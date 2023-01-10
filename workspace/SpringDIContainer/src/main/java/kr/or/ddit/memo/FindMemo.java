package kr.or.ddit.memo;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.util.Map;

import kr.or.ddit.vo.MemoVO;

public class FindMemo {
	public static void main(String[] args) throws IOException, ClassNotFoundException {
		ObjectInputStream ois = null;
		try {
			ois = new ObjectInputStream(
					new BufferedInputStream(
					new FileInputStream("d:/memos.dat")));
			
			Object obj = null;
			
			 // ObjectInputStream의 read.Object 메서드(Object로 리턴)
			while ((obj = ois.readObject(/*여기서 역직렬화*/)) != null) {
				System.out.println(obj.toString());
			}

		} catch (IOException ex) {
			// 더 이상 읽어올 객체가 없으면 예외 발생함
			// EndOfFileException
//			ex.printStackTrace();
			System.out.println("출력작업 끝...");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				ois.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
}
