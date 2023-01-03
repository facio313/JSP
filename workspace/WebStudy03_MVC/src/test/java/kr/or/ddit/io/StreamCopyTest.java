package kr.or.ddit.io;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;

import org.junit.Before;
import org.junit.Test;

// IO 작업의 4 단계
// 1. 객체화
// 2. 어쩌고
// 3.
// 4.

public class StreamCopyTest {
	private File targetFile;
	private File destFile;
	
	@Before
	public void setUp() {
		targetFile = new File("D:/contents/movies/target.mp4");
		destFile = new File("D:/target.mp4");
	}
	
//	@Test // 2~4s
	public void copyTest() throws IOException {
		
		try (
			FileInputStream fis = new FileInputStream(targetFile);
			FileOutputStream fos = new FileOutputStream(destFile);
		){
			int tmp = -1;
			while ((tmp = fis.read()) != -1) {
				fos.write(tmp);
			}
		}
	}
	
//	@Test // 0.00001s
	public void copyTest2() throws IOException {
		
		try (
			FileInputStream fis = new FileInputStream(targetFile);
			FileOutputStream fos = new FileOutputStream(destFile);
		){
			byte[] buffer = new byte[1024];
			int length = -1;
			int count = 1;
			while ((length = fis.read(buffer)) != -1) { // 반복문의 횟수를 줄이면 빨라짐! 그것이 buffer~
				if (count++ == 1) {
					Arrays.fill(buffer, (byte)0);
				}
				fos.write(buffer, 0, length); //1.5kb다 하면 1번 돌고 2번째 돌 때, 512개 넣고 배열[1024]에서 513~1024까지는 그 전에 있던 데이터가 있겠지! 그럼 이상한 데이터!! 그래서 이렇게 정해줘야 함. 길이는 length가 갖고 있으니~
			}
		}
	}
	
	// 1차 스트림은 미디어에 직접적으로 개방한다
	// 2차 스트림은 이미 개방된 것에 접근한다. 그래서 기본 생성자가 없음
	
	@Test // 0.032s
	public void copyTest3() throws IOException {
		
		try (
			FileInputStream fis = new FileInputStream(targetFile);
			FileOutputStream fos = new FileOutputStream(destFile);
				
			BufferedInputStream bis = new BufferedInputStream(fis);
			BufferedOutputStream bos = new BufferedOutputStream(fos);
		){
			int tmp = -1;
			while ((tmp = bis.read()) != -1) {
				bos.write(tmp);
			}
		}
	}
}
