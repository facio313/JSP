package kr.or.ddit.announcement.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface PdfService {

	String createPdf(String keyword);

	MultipartFile createHtmlPdf(String filename, String htmlStr, HttpServletRequest request);

}
