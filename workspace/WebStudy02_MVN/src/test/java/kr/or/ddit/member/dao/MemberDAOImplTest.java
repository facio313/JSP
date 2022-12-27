package kr.or.ddit.member.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.vo.MemberVO;

public class MemberDAOImplTest {

	private MemberDAO dao = new MemberDAOImpl();
	private MemberVO member;
	
	@Before
	public void setUp() throws Exception {
		member = new MemberVO();
		member.setMemId("abcd");
		member.setMemPass("0000");
		member.setMemName("2022-12-08");
		member.setMemBir("memBir");
		member.setMemZip("abcd");
		member.setMemAdd1("abcd");
		member.setMemAdd2("abcd");
	}

	@Test
	public void testInsertMember() {
		dao.insertMember(member);
	}

	@Test
	public void testSelectMemberList() {
		List<MemberVO> memberList = dao.selectMemberList();
		memberList.stream().forEach(System.out::println);
	}

	@Test
	public void testSelectMember() {
		MemberVO member = dao.selectMember("a001");
		System.out.println(member);
		member = dao.selectMember("12134a");
		assertNull(member);
	}

	@Test
	public void testUpdateMember() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteMember() {
		fail("Not yet implemented");
	}

}
