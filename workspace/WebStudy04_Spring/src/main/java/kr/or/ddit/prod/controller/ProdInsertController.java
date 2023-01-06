package kr.or.ddit.prod.controller;

import java.io.File;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.mvc.annotation.RequestMethod;
import kr.or.ddit.mvc.annotation.resolvers.ModelAttribute;
import kr.or.ddit.mvc.annotation.resolvers.RequestPart;
import kr.or.ddit.mvc.annotation.sterotype.Controller;
import kr.or.ddit.mvc.annotation.sterotype.RequestMapping;
import kr.or.ddit.mvc.multipart.MultipartFile;
import kr.or.ddit.mvc.multipart.MultipartHttpServletRequest;
import kr.or.ddit.prod.dao.OthersDAO;
import kr.or.ddit.prod.dao.OthersDAOImpl;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.ValidationUtils;
import kr.or.ddit.vo.ProdVO;

@Controller
public class ProdInsertController { // AbstractController 때문에 POJO가 되지 못함. 
	private ProdService service = new ProdServiceImpl();
	private OthersDAO othersDAO = new OthersDAOImpl();

	private void addAttribute(HttpServletRequest req) {
		req.setAttribute("lprodList", othersDAO.selectLprodList());
		req.setAttribute("buyerList", othersDAO.selectBuyerList(null));
	}
	
	@RequestMapping("/prod/prodInsert.do")
	public String process(HttpServletRequest req) {
		addAttribute(req);
		return "prod/prodForm";
	}
	
	@RequestMapping(value="/prod/prodInsert.do", method=RequestMethod.POST)
	public String insertProcess(
		HttpServletRequest req
		, HttpSession session
		, @ModelAttribute("prod") ProdVO prod
		, @RequestPart("prodImage") MultipartFile prodImage
	) throws IOException, ServletException {
		addAttribute(req);
		
//		if (req instanceof MultipartHttpServletRequest) {
//			MultipartHttpServletRequest wrapperReq = (MultipartHttpServletRequest) req;
			// prodImage -> prodImg
//			MultipartFile prodImage = wrapperReq.getFile("prodImage");
			if (prodImage != null && !prodImage.isEmpty()) { // ProdVO에서 MemberVO처럼 바꾸면 중복을 많이 줄일 수 있음
//			1.저장 - 저장 위치(/resources/prodImages의 실제 경로)
				String saveFolderURL = "/resources/prodImages"; // 하드코딩 하지 말고 properties로 빼는 방법이 제일 좋음
				ServletContext application = req.getServletContext();
				String saveFolderPath = application.getRealPath(saveFolderURL);
				File saveFolder = new File(saveFolderPath);
				if (!saveFolder.exists()) {
					saveFolder.mkdirs();
				}
//				2.metadata 추출(저장 파일 url)
				String saveFileName = UUID.randomUUID().toString();
				prodImage.transfetTo(new File(saveFolder, saveFileName));
//				3. DB 저장 : prodImg
				prod.setProdImg(saveFileName);
			}
//		}
		
		
		Map<String, List<String>> errors = new LinkedHashMap<>();
		req.setAttribute("errors", errors);
	    
	    boolean valid = ValidationUtils.validate(prod, errors, InsertGroup.class);

	    String viewName = null;
	      
	    if(valid) {
//			3.db 저장 : prodImg
	       ServiceResult result = service.createProd(prod);
	       switch (result) {
	       case FAIL:
	    	   req.setAttribute("message", "서버에 문제 있음. 쫌따 다시 하셈.");
	    	   viewName = "prod/prodForm";
	    	   break;
	       default:
	    	   viewName = "redirect:/prod/prodView.do?what=" + prod.getProdId();
	    	   break;
	       }
	    }else {
	    	viewName = "prod/prodForm";
	    }
	    return viewName;
	}

}
