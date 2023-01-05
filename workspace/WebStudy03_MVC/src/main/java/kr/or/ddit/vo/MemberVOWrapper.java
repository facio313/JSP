package kr.or.ddit.vo;

import java.security.Principal;

/**
 * Adapter는 기본 생성자를 쓸 필요가 없다.
 * 어차피 adaptee가 없으면 쓸 필요가 없어지니까
 * Wrapper로 만들면 MemberVO를 바꿀 필요가 없어진다.
 * 제 1원칙 : 한 번 만든 건 바꾸지 않는다.
 *
 */
public class MemberVOWrapper implements Principal {
	private MemberVO realMember;

	public MemberVOWrapper(MemberVO realMember) {
		super();
		this.realMember = realMember;
	}
	
	public MemberVO getRealMember() {
		return realMember;
	}

	@Override
	public String getName() {
		return realMember.getMemId();
	}
}
