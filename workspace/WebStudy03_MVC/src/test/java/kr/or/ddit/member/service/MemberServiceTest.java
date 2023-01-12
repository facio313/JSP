package kr.or.ddit.member.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;

public class MemberServiceTest {
	private MemberService service;
	private MemberVO member;
	
	@Before
	public void setUp() throws Exception {
		member = new MemberVO();
//		member.setMemId("a001");
	}

//	@Test
	public void testCreateMember() {
		ServiceResult result = service.createMember(member); // 숫자는 식별성이 있는 값이 될 순 없음
//		result == ServiceResult.OK
//		result == ServiceResult.FAIL
//		result == ServiceResult.PKDUPLICATED
		
	}

	@Test
	public void testRetrieveMemberList() {
		PagingVO<MemberVO> pagingVO = new PagingVO();
		List<MemberVO> memberList = service.retrieveMemberList(pagingVO);
		assertNotEquals(0, memberList.size());
	}

//	@Test
	public void testRetrieveMember() {
		fail("Not yet implemented");
	}

//	@Test
	public void testModifyMember() {
		fail("Not yet implemented");
	}

//	@Test
	public void testRemoveMember() {
		fail("Not yet implemented");
	}

}
