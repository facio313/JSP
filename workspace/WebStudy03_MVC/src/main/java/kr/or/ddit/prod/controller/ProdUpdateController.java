package kr.or.ddit.prod.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.mvc.annotation.RequestMethod;
import kr.or.ddit.mvc.annotation.resolvers.ModelAttribute;
import kr.or.ddit.mvc.annotation.resolvers.RequestParam;
import kr.or.ddit.mvc.annotation.resolvers.RequestPart;
import kr.or.ddit.mvc.annotation.sterotype.Controller;
import kr.or.ddit.mvc.annotation.sterotype.RequestMapping;
import kr.or.ddit.mvc.multipart.MultipartFile;
import kr.or.ddit.prod.dao.OthersDAO;
import kr.or.ddit.prod.dao.OthersDAOImpl;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.validate.ValidationUtils;
import kr.or.ddit.vo.ProdVO;

@Controller
public class ProdUpdateController {
	private ProdService service = new ProdServiceImpl();
	private OthersDAO othersDAO = new OthersDAOImpl();
	
	private void addAttribute(HttpServletRequest req) {
		req.setAttribute("lprodList", othersDAO.selectLprodList());
		req.setAttribute("buyerList", othersDAO.selectBuyerList(null));
	}
		
	@RequestMapping("/prod/prodUpdate.do")
	public String updateForm(
		@RequestParam(value="what", required=true) String prodId // 없다면 핸들러 어댑터가 에러를 발생시킴
		, HttpServletRequest req
	) {
		ProdVO prod = service.retrieveProd(prodId);
		req.setAttribute("prod", prod);
		addAttribute(req);

		return "prod/prodForm";
	}
	
	@RequestMapping(value="/prod/prodUpdate.do", method=RequestMethod.POST)
	public String updateProcess(
		@ModelAttribute("prod") ProdVO prod // 마커면 prodVO로 보낸 걸로 인식함
		, @RequestPart(value="prodImage", required=false) MultipartFile prodImage
		, HttpServletRequest req
	) throws IOException {
		addAttribute(req);
		
		String viewName = null;
		
		prod.setProdImage(prodImage);
		
		String saveFolderURL = "/resources/prodImages"; // 하드코딩 하지 말고 properties로 빼는 방법이 제일 좋음
		ServletContext application = req.getServletContext();
		String saveFolderPath = application.getRealPath(saveFolderURL);
		File saveFolder = new File(saveFolderPath);
		if (!saveFolder.exists()) {
			saveFolder.mkdirs();
		}
		prod.saveTo(saveFolder);
		
		Map<String, List<String>> errors = new LinkedHashMap<>();
		req.setAttribute("errors", errors);
		
		boolean valid = ValidationUtils.validate(prod, errors, UpdateGroup.class);
		
		if (valid) {
			ServiceResult result = service.modifyProd(prod);
			switch (result) {
				case FAIL:
					req.setAttribute("message", "서버 오류.");
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
