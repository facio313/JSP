package kr.or.ddit.board.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.or.ddit.AbstractTestCase;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class BoardDAOTest extends AbstractTestCase {
	
	@Inject
	private BoardDAO boardDAO;
	
	private PagingVO<BoardVO> pagingVO;
	
	@Test
	public void test() {
		log.info("주입된 객체 : {}", boardDAO);
	}
	
	@Before
	public void setUp() {
		pagingVO = new PagingVO<>();
		pagingVO.setCurrentPage(1);
	}


//	@Test
	public void testInsertBoard() {
		fail("Not yet implemented");
	}

//	@Test
	public void testSelectBoardList() {
		List<BoardVO> dataList = boardDAO.selectBoardList(pagingVO);
		assertNotEquals(0, dataList.size());
	}

//	@Test
	public void testSelectTotalRecord() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectBoard() {
		BoardVO board = boardDAO.selectBoard(154);
		assertNotNull(board);
		board.getAttachList().stream().forEach(System.out::println);
	}

//	@Test
	public void testUpdateBoard() {
		fail("Not yet implemented");
	}

//	@Test
	public void testDeleteBoard() {
		fail("Not yet implemented");
	}

}
