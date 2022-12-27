package kr.or.ddit.io;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import org.junit.Before;
import org.junit.Test;

public class StreamCopyTest1 {
	private File targetFile;
	private File destFile;
	
	@Before
	public void setUp() {
		targetFile = new File("D:/contents/movies/target.mp4");
		destFile = new File("D:/target.mp4");
	}
	
	@Test
	public void test() {
		FileInputStream fis = null; // 파일을 읽어올 byte타입의 FileInputStream 변수 선언
		FileOutputStream fos = null; // 읽어온 파일을 출력할 byte타입의 FileOutputStream 변수 선언
		BufferedOutputStream bos = null; // FileOutputStream 객체를 좀 더 빠르게 보조할 보조 스트림 BufferedOutputStream 변수 선언
		
		
		try { // 일단 싸게 싸게 해봐봐
			fis = new FileInputStream(targetFile); // 읽는 객체를 생성하는데 매개변수로 File타입의 객체가 필요함. 즉, 어떤 객체를 읽어올 것이냐!!는 위의  "D:/contents/movies/target.mp4"
			fos = new FileOutputStream(destFile); // 출력하는 객체를 생성하는데 매개변수로 File타입의 객체가 필요함. 어디로 어떤 이름으로 출력할 것이냐라고 생각해주면 될 듯 "D:/target.mp4"
			bos = new BufferedOutputStream(fos); // 그냥 FileOutputStream 보조해주는 보조스트림 - 특징은 빠르게 만들어준다~~~
			
			int data = 0; // 읽어온 데이터는 char가 아니라 byte타입이다!(FileInputStream이니까) 그래서 fis로 읽어올 데이터를  담을 int 변수 선언 
			
			
			while ((data = fis.read()) != -1) { // 읽는 객체를 생성하여 담은 fis변수에 내용을 얼어올 read()의 리턴값을 data에 담는데 이때, 없을 때(-1) 전까지 담는다.
				bos.write(data); // data(담은 데이터)를 FileOutputStream의 write()를 통해 출력하는데, 보조스트림을 사용하여 좀 더 빠르게 출력한다.!  
			}
			
			bos.flush(); // FileWriter 내부 버퍼의 내용을 파일에 writer합니다. flush()를 호출하지 않는다면 내용이 버퍼에만 남고 파일에는 쓰이지 않는 상황이 나올 수 있습니다.
			
		} catch (IOException ex) { // IO작업을 하고 있으니 IOException!
			ex.printStackTrace();
		} finally {
			try {
				fis.close(); // io작업이 끝나면 객체도 끝내는 게 좋다
				fos.close();
				bos.close();
			} catch (IOException e) {
				e.printStackTrace();
			} 
		}
	}
}
