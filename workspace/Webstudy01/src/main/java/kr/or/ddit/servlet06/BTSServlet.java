package kr.or.ddit.servlet06;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value = "/bts", loadOnStartup = 1) // value는 String[]을 리턴하기 때문에 그냥 "/bts"도 되지만 {"/bts", "/bts/*"}도 된다. 하지만 단일 책임구조가 아니라 권하는 방식이 아님
public class BTSServlet extends HttpServlet {
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		ServletContext application = config.getServletContext();
		application.setAttribute("btsMembers", getBtsMemberList()); // setAttribute는 scope를 사용하기 위한 것(request, session, servletContext)
	}
	
	// 모델
	public Map<String, String[]> getBtsMemberList() {
		// BTS 멤버를 담을 members 변수 생성
		Map<String, String[]> members = new LinkedHashMap<>();
		// BTS 멤버에 대한 키값과, 내용을 담을 value값 설정하는, String의 배열로!
		// 6명의 멤버 다 해줘야 하나? 비숫자적 연쇄 때문에 못 돌릴 것 같음
		members.put("B001", new String[] {"RM", "/WEB-INF/views/bts/rm.jsp"});
		members.put("B002", new String[] {"진", "/WEB-INF/views/bts/jin.jsp"});
		members.put("B003", new String[] {"슈가", "/WEB-INF/views/bts/suga.jsp"});
		members.put("B004", new String[] {"제이홉", "/WEB-INF/views/bts/jhop.jsp"});
		members.put("B005", new String[] {"지민", "/WEB-INF/views/bts/jimin.jsp"});
		members.put("B006", new String[] {"뷔", "/WEB-INF/views/bts/bui.jsp"});
		members.put("B007", new String[] {"정국", "/WEB-INF/views/bts/jungkuk.jsp"});
		return members;
	}
	
	public String[] getMemberContent(String code) {
		String[] content = getBtsMemberList().get(code);
		return content;
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		1. 요청 분석
//		bts 전체 목록에 대한 것 
		String accept = req.getHeader("Accept");
		if (accept.contains("xml")) {
			resp.sendError(HttpServletResponse.SC_NOT_ACCEPTABLE);
			return;
		}

//		2. 모델 확보
//		bts 전체 목록 가져오기
		Map<String, String[]> bts = getBtsMemberList();
		
//		3. 모델 공유 (이름은 정해짐)
//		멤버의 목록 setAttribute
//		json으로 받는댔으니까 마샬링...
		req.setAttribute("bts", bts);
		
//		4. 뷰 선택(json 내보낸다면 이미 정해진 거)
//		btsForm의 ajax로 보내기
		String viewName = "/jsonView.do";
		
//		5. 이동 선택
//		그냥 get이니까 forward 쓰면 될 듯
		req.getRequestDispatcher(viewName).forward(req, resp);
	}
}
