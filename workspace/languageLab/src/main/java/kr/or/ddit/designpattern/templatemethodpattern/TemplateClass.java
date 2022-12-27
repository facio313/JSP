package kr.or.ddit.designpattern.templatemethodpattern;

public abstract class TemplateClass {
	
//	template method : 순서를 고정시키는 것
	public final void template() {// 유일하게 쓸 수 있는 / 다른 곳에서도 못 바꾸는 것 
		stepOne();
		stepTwo();
		stepThree();
	}
	
//	hook method
	private void stepOne() {
		System.out.println("1단계");
	}
	protected abstract void stepTwo();
	
	private void stepThree() {
		System.out.println("3단계");
	}
}
