package kr.or.ddit.member.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
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
		PagingVO<MemberVO> pagingVO = new PagingVO();
		pagingVO.setTotalRecord(dao.selectTotalRecord(pagingVO));
		pagingVO.setCurrentPage(2);
		
		List<MemberVO> memberList = dao.selectMemberList(pagingVO);
		memberList.stream().forEach(System.out::println);
		pagingVO.setDataList(memberList);
		
		log.info("paging : {}", pagingVO); // 어디꺼 로그?...
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
