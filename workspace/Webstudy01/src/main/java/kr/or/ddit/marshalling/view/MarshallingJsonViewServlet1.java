package kr.or.ddit.marshalling.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/jsonView.do1")
public class MarshallingJsonViewServlet1 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Object target = req.getAttribute("target");
		
		ObjectMapper mapper = new ObjectMapper();
		resp.setContentType("application/json; charset=UTF-8");
		try(
			PrintWriter out = resp.getWriter();
		){
			mapper.writeValue(out, target);
		}
	}
}