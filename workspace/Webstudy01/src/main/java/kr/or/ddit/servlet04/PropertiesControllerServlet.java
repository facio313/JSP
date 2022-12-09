package kr.or.ddit.servlet04;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.Document;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;

import kr.or.ddit.servlet01.DescriptionServlet;

@WebServlet("/03/propsView.do")
public class PropertiesControllerServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { // get이라 받을 편지 내용은 없음
		String accept = req.getHeader("Accept");
		
		Object target = retrieveData();
		req.setAttribute("target", target);
		
		if (accept.startsWith("*/*") || accept.toLowerCase().contains("html")) {
			String path = "/WEB-INF/views/03/propsView.jsp";
			req.getRequestDispatcher(path).forward(req, resp);
		} else if (accept.toLowerCase().contains("json")) {
			marshallingJson(req, resp);
		} else {
			marshallingXml(req, resp);
		}
	}

	private void marshallingJson(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Object target = req.getAttribute("target");
		
		ObjectMapper mapper = new ObjectMapper();
		resp.setContentType("application/json; charset=UTF-8");
		try(
			PrintWriter out = resp.getWriter();
		){
			mapper.writeValue(out, target);
		}
	}
	
	private void marshallingXml(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Object target = req.getAttribute("target");
		
		ObjectMapper mapper = new XmlMapper();
		resp.setContentType("application/xml; charset=UTF-8");
		try(
			PrintWriter out = resp.getWriter();
		){
			mapper.writeValue(out, target);
		}
	}
	
	private Object retrieveData() throws IOException {
		
		Properties properties = new Properties();
		
		try(
			InputStream is = DescriptionServlet.class.getResourceAsStream("/kr/or/ddit/props/DataStore.properties");
		){
			properties.load(is);
		}
		return properties;
	}
}
