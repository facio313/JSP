package kr.or.ddit.mvc.multipart;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;

public class StandardServletMultipartFile implements MultipartFile {

	private Part adaptee; // 2점대로 바꾸고자 한다면 Part를 FileItem으로 바꾸면 됨. 그게 common3의 fileupload
	
	public StandardServletMultipartFile(Part adaptee) { // 기본 생성자가 없어져서 adapte가 됨. 
		super();
		this.adaptee = adaptee;
	}

	@Override
	public byte[] getBytes() throws IOException {
//		ByteArrayOutputStream os = new ByteArrayOutputStream();
//		InputStream is = getInputStream();
//		while() {
//			~~
//		}
//		os.toByteArray();
//		FileU
		return IOUtils.toByteArray(getInputStream());
	}

	@Override
	public String getContentType() {
		return adaptee.getContentType();
	}

	@Override
	public InputStream getInputStream() throws IOException {
		return adaptee.getInputStream();
	}

	@Override
	public String getName() {

		return adaptee.getName();
	}

	@Override
	public String getOriginalFilename() {

		return adaptee.getSubmittedFileName();
	}

	@Override
	public long getSize() {

		return adaptee.getSize();
	}

	@Override
	public boolean isEmpty() {

		return StringUtils.isBlank(getOriginalFilename());
	}

	@Override
	public void transferTo(File dest) throws IOException {
		adaptee.write(dest.getCanonicalPath());
	}

}
