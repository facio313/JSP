package kr.or.ddit.prod;


import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.prod.dao.ProdDAO;
import kr.or.ddit.prod.dao.ProdDAOImpl;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class TestProdDAOImpl {
	
	private ProdDAO dao = new ProdDAOImpl();
	private PagingVO<ProdVO> pagingVO;
	
	@Before
	public void setUp() {
		pagingVO = new PagingVO<>();
		pagingVO.setCurrentPage(1);
	}
	
	@Test
	public void testSelectTotalRecord() {
		int tr = dao.selectTotalRecord(pagingVO);
		assertNotEquals(0, tr);
	}
	
	@Test
	public void testSelectProdList() {
		List<ProdVO> prodList = dao.selectProdList(pagingVO);
		assertEquals(10, prodList.size());
		log.info("prodList : {}", prodList);
	}

//	@Test
	public void testSelectProd() {
		PagingVO<ProdVO> pagingVO = new PagingVO();
		pagingVO.setTotalRecord(dao.selectTotalRecord(pagingVO));
		pagingVO.setCurrentPage(2);
		
		List<ProdVO> prodList = dao.selectProdList(pagingVO);
		prodList.stream().forEach(System.out::println);
		pagingVO.setDataList(prodList);
		
		log.info("paging : {}", pagingVO); // 어디꺼 로그?...
	}

}
