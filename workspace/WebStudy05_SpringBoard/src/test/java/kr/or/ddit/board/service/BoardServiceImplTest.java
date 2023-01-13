package kr.or.ddit.board.service;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class BoardServiceImplTest {

	@Inject
	private BoardServiceImpl service;
	
	@Test
	public void test() {
		log.info("주입된 객체 : {}", service);
	}
	
//	@Test
	public void testCreateBoard() {
		fail("Not yet implemented");
	}

	@Test
	public void testRetrieveBoardList() {
//		service.retrieveBoardList(pagingVO);;
	}

//	@Test
	public void testRetrieveBoard() {
		fail("Not yet implemented");
	}

//	@Test
	public void testModifyBoard() {
		fail("Not yet implemented");
	}

//	@Test
	public void testRemoveBoard() {
		fail("Not yet implemented");
	}

//	@Test
	public void testRetrieveForDownload() {
		fail("Not yet implemented");
	}

}
