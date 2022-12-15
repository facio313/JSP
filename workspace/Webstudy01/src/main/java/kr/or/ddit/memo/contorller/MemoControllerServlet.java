package kr.or.ddit.memo.contorller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.memo.dao.FileSystemMemoDAOImpl;
import kr.or.ddit.memo.dao.MemoDAO;
import kr.or.ddit.memo.vo.MemoVO;

@WebServlet("/memo")
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

	private MemoVO getMemoFromRequest(HttpServletRequest req) {
		// 1. 요청의 조건
//		String accept = req.getHeader("Accept");

		// 2. 모델 확보
//		ajax를 통해 받아온 post 요청의 파라미터들을 받아온다.
		String writer = req.getParameter("writer");
		String date = req.getParameter("date");
		String content = req.getParameter("content");

		System.out.println(writer);
		System.out.println(date);
		System.out.println(content);

//		확보한 모델을 담을 VO객체 생성
		MemoVO mv = new MemoVO();

//		객체에 모델 담기
		mv.setWriter(writer);
		mv.setDate(date);
		mv.setContent(content);

		return mv;
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPut(req, resp);
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doDelete(req, resp);
	}
}
