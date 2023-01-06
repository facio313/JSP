package kr.or.ddit.memo.contorller;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.exc.MismatchedInputException;

//import kr.or.ddit.memo.dao.DataBaseMemoDAOImpl;
import kr.or.ddit.memo.dao.MemoDAO;
import kr.or.ddit.memo.dao.MemoDAOImpl;
import kr.or.ddit.mvc.annotation.RequestMethod;
import kr.or.ddit.mvc.annotation.resolvers.RequestParam;
import kr.or.ddit.mvc.annotation.sterotype.Controller;
import kr.or.ddit.mvc.annotation.sterotype.RequestMapping;
import kr.or.ddit.vo.MemoVO;

@Controller
public class MemoController {
	private static final Logger log = LoggerFactory.getLogger(MemoController.class); 

//	private MemoDAO dao = FileSystemMemoDAOImpl.getInstance();
//	private MemoDAO dao = DataBaseMemoDAOImpl.getInstance();
	private MemoDAO dao = new MemoDAOImpl();
	// 1. 요청의 조건
	// 2. 모델 확보
	// 3. 모델 공유
	// 4. 뷰 선택
	// 5. 뷰로 이동

	@RequestMapping("/memo")
	public String doGet(
//		@RequestHeader("Accept") String accept
		HttpServletRequest req, HttpServletResponse resp
	) throws ServletException, IOException {
		// 1. 요청의 조건
		String accept = req.getHeader("Accept");
//		log.debug("accept header : {}", accept);
		log.info("accept header : {}", accept);
		if (accept.contains("xml")) {
			resp.sendError(HttpServletResponse.SC_NOT_ACCEPTABLE);
			return null;
		}

		// 2. 모델 확보
		List<MemoVO> memoList = dao.selectMemoList();

		// 3. 모델 공유
		req.setAttribute("memoList", memoList);

		// 4. 뷰 선택
		return "forward:/jsonView.do";
	}

	@RequestMapping(value="/memo", method=RequestMethod.POST)
	public String doPost(HttpServletRequest req) throws ServletException, IOException {
//		Post-Redirect-Get : PRG pattern - 전형적인 데이터 작성 구조
		// Accept는 유지됨

		// 3. 모델 공유
		// 4. 뷰 선택
		// 5. 뷰로 이동

		MemoVO memo = getMemoFromRequest(req);;
		
		int cnt = dao.insertMemo(memo);

		return "redirect:/memo";

	}

	private MemoVO getMemoFromRequest(HttpServletRequest req) throws IOException {
		// ★ 바디에 내용이 있잖아!!!
		
		String contentType = req.getContentType();
		MemoVO mv = null;
		
		// restful형태 서비스에서 많이 사용되는 것. 객체 대 객체로 활용하는 데 좋음
		if (contentType.contains("json")) { // json으로 옴
			try(
				BufferedReader br = req.getReader(); // body content read용(역직렬화) 입력 스트림	
			){
				mv = new ObjectMapper().readValue(br, MemoVO.class);
				return mv;
			}			
		} else if (contentType.contains("xml")) { // xml으로 옴
			try(
				BufferedReader br = req.getReader(); // body content read용(역직렬화) 입력 스트림	
			){
				mv = new ObjectMapper().readValue(br, MemoVO.class);
				return mv;
			}

		} else { // 파라미터로 옴 - 파라미터 일일이 다 써줘야 해서 위에 것이 장점이 많음
			mv = new MemoVO();
			mv.setWriter(req.getParameter("writer"));
			mv.setDate(req.getParameter("date"));
			mv.setContent(req.getParameter("content"));
			return mv;
		}
		
		
		// 1. 요청의 조건 - json
//		String accept = req.getHeader("Accept");
		
		// 2. 모델 확보 - json 데이터를 꺼낸다
		
//		확보한 모델을 담을 VO객체 생성

//		객체에 모델 담기
//		mv.setWriter(writer);
//		mv.setDate(date);
//		mv.setContent(content);
		
//		try(
//			BufferedReader br = req.getReader();	
//		){
//			String tmp = null;
//			StringBuffer strJson = new StringBuffer();
//			while ((tmp = br.readLine()) != null) {
//				strJson.append(tmp);
//			}
//			ObjectMapper mapper = new ObjectMapper();
//			mv = mapper.readValue(strJson.toString(), MemoVO.class);
//		}
		
//		return mv;
	}

	@RequestMapping(value="/memo", method=RequestMethod.PUT)
	public String doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Enumeration<String> names = req.getAttributeNames();
		Map<String, Object> target = new HashMap<>();
		while (names.hasMoreElements()) {
			String name = (String) names.nextElement();
			Object value = req.getAttribute(name);
			target.put(name, value);
		}
		System.out.println(target);
		
		MemoVO memo = getMemoFromRequest(req);
		int cnt = dao.updateMemo(memo);
//		resp.sendRedirect(req.getContextPath() + "/memo");
		if (cnt > 0) {
			req.setAttribute("location", req.getContextPath() + "/memo");
			String viewName = "/jsonView.do";
			req.getRequestDispatcher(viewName).forward(req, resp);
		} else {
			System.out.println("실패");
		}
		return null;
	}

	@RequestMapping(value="/memo", method=RequestMethod.DELETE)
	public String doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getPathInfo();
		MemoVO memo = getMemoFromRequest(req);
		dao.deleteMemo(memo.getCode());
		req.setAttribute("location", req.getContextPath() + "/memo");
		String viewName = "/jsonView.do";
		req.getRequestDispatcher(viewName).forward(req, resp);	
		return null;
	}
	
}
