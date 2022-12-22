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

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.exc.MismatchedInputException;

import kr.or.ddit.memo.dao.FileSystemMemoDAOImpl;
import kr.or.ddit.memo.dao.MemoDAO;
import kr.or.ddit.vo.MemoVO;

@WebServlet("/memo/*")
public class MemoControllerServlet extends HttpServlet {

	private MemoDAO dao = FileSystemMemoDAOImpl.getInstance();
	// 1. 요청의 조건
	// 2. 모델 확보
	// 3. 모델 공유
	// 4. 뷰 선택
	// 5. 뷰로 이동

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. 요청의 조건
//		memoView에서 get방식의 ajax가 호출되면 실행된다
//		request의 accpet가 뭔지 알아온다.
		String accept = req.getHeader("Accept");
		if (accept.contains("xml")) {
			resp.sendError(HttpServletResponse.SC_NOT_ACCEPTABLE);
			return;
		}

		// 2. 모델 확보
//		dao의 selectMemoList를 통해 목록을 가져와서 변수에 담는다.
		List<MemoVO> memoList = dao.selectMemoList();

		// 3. 모델 공유
//		가져온 모델을 request 객체에 담는다
		req.setAttribute("memoList", memoList);

		// 4. 뷰 선택
//		어디로 보낼지 정한다.
//		memoView.jsp를 선택한다.
//		jsp, xml, plain 등 뭐가 올지에 따라 선택해준다.
//		String path = "";
//		if (accept.contains("json")) {
//			path = "/jsonView.do";
		String path = "/jsonView.do"; // marshalling을 하기 위함!!
//		} else if ...

		// 5. 뷰로 이동
//		Dispatcher로 보낸다.
		req.getRequestDispatcher(path).forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		Post-Redirect-Get : PRG pattern - 전형적인 데이터 작성 구조
		// Accept는 유지됨

		// 3. 모델 공유
		// 4. 뷰 선택
		// 5. 뷰로 이동

		MemoVO memo = getMemoFromRequest(req);
		dao.insertMemo(memo);

//		작성하고 req 안의 메모 관련 내용 지우기 
//		이거 후 메모리스트 갱신
		resp.sendRedirect(req.getContextPath() + "/memo");

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

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
		req.setAttribute("location", req.getContextPath() + "/memo");
		String viewName = "/jsonView.do";
		req.getRequestDispatcher(viewName).forward(req, resp);
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getPathInfo();
		MemoVO memo = getMemoFromRequest(req);
		dao.deleteMemo(memo.getCode());
		req.setAttribute("location", req.getContextPath() + "/memo");
		String viewName = "/jsonView.do";
		req.getRequestDispatcher(viewName).forward(req, resp);	}
}
