package kr.or.ddit.marshalling.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/jsonView.do")
public class MarshallingJsonViewServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		Object targets = req.getAttribute("target");
		Enumeration<String> names = req.getAttributeNames();
		Map<String, Object> target = new HashMap<>();
		while (names.hasMoreElements()) {
			String name = (String) names.nextElement();
			Object value = req.getAttribute(name);
			target.put(name, value);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		resp.setContentType("application/json; charset=UTF-8");
		try(
			PrintWriter out = resp.getWriter();
		){
			mapper.writeValue(out, target);
		}
	}
}
