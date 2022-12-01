package kr.or.ddit.servlet02;

public class test {
	public static void main(String[] args) {
		int number = 10;
		int result = 1;
		for (int i = 1; i <= number; i++) {
			result = i * result;
		}
		System.out.println(result);
	}

}
