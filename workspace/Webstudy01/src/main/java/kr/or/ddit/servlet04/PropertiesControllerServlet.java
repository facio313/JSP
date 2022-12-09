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
import kr.or.ddit.servlet04.service.PropertiesService;

@WebServlet("/03/propsView.do")
public class PropertiesControllerServlet extends HttpServlet {
	private PropertiesService service;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { // get이라 받을 편지 내용은 없음
		String accept = req.getHeader("Accept");
		
		Object target = service.retrieveData();
		req.setAttribute("target", target);
		
		String path = null;
		
		if (accept.startsWith("*/*") || accept.toLowerCase().contains("html")) {
			path = "/WEB-INF/views/03/propsView.jsp";
		} else if (accept.toLowerCase().contains("json")) {
			path = "/jsonView.do";
		} else {
			path = "/xmlView.do";
		}
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
