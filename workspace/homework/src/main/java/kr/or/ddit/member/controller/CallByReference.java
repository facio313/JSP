package kr.or.ddit.member.controller;

public class CallByReference {
	public static void main(String[] args) {
		CallByReference c = new CallByReference();
		c.method1();
	}
	
	public void method1() {
		String a = "A";
		String b = "B";
		System.out.println("before" + a + ", " + b );
		method2(a, b);
		System.out.println("after" + a + ", " + b);
	}
	
	public void method2(String a, String b) {
		a = "C";
		b = "D";
	}
}
