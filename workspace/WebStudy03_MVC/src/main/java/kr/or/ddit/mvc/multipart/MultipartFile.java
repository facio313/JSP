package kr.or.ddit.mvc.multipart;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

public interface MultipartFile {
	public byte[] getBytes() throws IOException; // 2진 데이터만 꺼내온다.
	public String getContentType(); // Part가 갖고 있던 것
	public InputStream getInputStream() throws IOException;
	public String getName(); // Part이름을 갖고와서 넘기면 되는 것
	public String getOriginalFilename(); // getSubmittedFilename()과 비슷한 것
	public long getSize(); // 사이즈
	public boolean isEmpty(); // 아무런 데이터를 넣지 않더라도 파트는 생성됨
	public void transfetTo(File dest) throws IOException; // write 역할을 대신 해주는 것, write는 저장명만.. 얘는 파일 객체!로
}
