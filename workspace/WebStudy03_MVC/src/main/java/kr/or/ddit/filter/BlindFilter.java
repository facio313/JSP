package kr.or.ddit.filter;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class BlindFilter implements Filter {

	private Map<String, String> blindMap; // 원래는 데이터베이스로 경고 누적 시 블라인드 처리!
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		log.info("{} 초기화", this.getClass().getName());
		blindMap = new LinkedHashMap<>();
		blindMap.put("127.0.0.1", "나니까 블라인드");
		blindMap.put("0:0:0:0:0:0:0:1", "나니까 블라인드");
		blindMap.put("192.168.35.51", "나니까 블라인드");
		blindMap.put("192.168.35.43", "나래누나니까 블라인드");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		log.info("BlindFilter 동작시작");
//		1. 클라이언트 아이피 주소 얻기
		String ipAddress = request.getRemoteAddr();
		
		if (blindMap.containsKey(ipAddress)) {
			String reason = blindMap.get(ipAddress);
			String message = String.format("당신은 %s 사유로 블라인드 처리 됐슴다.", reason);
			request.setAttribute("message", message);
			String viewName = "/WEB-INF/views/commons/messageView.jsp";
			request.getRequestDispatcher(viewName).forward(request, response);
		} else {
			chain.doFilter(request, response);
		}
		
		
//		boolean blinded = false;
//		String message = "";
//		
////		2. 대상자 판단하기
//		for(Map.Entry<String, String> m : blindMap.entrySet()) {
//			if (ip.equals(m.getKey())) {
//				blinded = true;
//				message = m.getValue();
//			}
//		}
//		
////		4. 대상자라면 통과시키지 않기 -> 블라인드 사유 알려주면서 ~이유로 블라인드 처리되었습니다.
//		if (blinded) {
//			request.setAttribute("message", message);
//			try {
//				request.getRequestDispatcher("/WEB-INF/views/commons/messageView.jsp").forward(request, response);
//			} catch (ServletException | IOException e) {
//				throw new RuntimeException(e);
//			}
//		} else {
//			try {
////		3. 대상자가 아니라면 정상적인 서비스 이용
//				chain.doFilter(request, response);
//			} catch (IOException | ServletException e) {
//				throw new RuntimeException(e);
//			}
//		}
		
		log.info("BlindFilter 동작종료");
	}

	@Override
	public void destroy() {
		log.info("{} 소멸", this.getClass().getName());
		
	}

}
