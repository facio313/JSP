package kr.or.ddit.prod;


import java.util.List;

import org.junit.Test;

import kr.or.ddit.prod.dao.ProdDAO;
import kr.or.ddit.prod.dao.ProdDAOImpl;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class TestProdDAOImpl {
	
	private ProdDAO dao = new ProdDAOImpl();

	@Test
	public void testSelectProdList() {
		PagingVO<ProdVO> pagingVO = new PagingVO();
		pagingVO.setTotalRecord(dao.selectTotalRecord(pagingVO));
		pagingVO.setCurrentPage(2);
		
		List<ProdVO> prodList = dao.selectProdList(pagingVO);
		prodList.stream().forEach(System.out::println);
		pagingVO.setDataList(prodList);
		
		log.info("paging : {}", pagingVO); // 어디꺼 로그?...
	}

}
