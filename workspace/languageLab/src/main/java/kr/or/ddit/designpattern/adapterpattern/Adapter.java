package kr.or.ddit.designpattern.adapterpattern;

public class Adapter implements Target {
	private Adaptee adaptee;
	
	// wrapper instance
	public Adapter(Adaptee adaptee) { // adaptee가 없다면 adapter을 만들 수 없게 됨
		super();
		this.adaptee = adaptee;
	}

	@Override
	public void request() {
		adaptee.specificRequest();
	}
}
