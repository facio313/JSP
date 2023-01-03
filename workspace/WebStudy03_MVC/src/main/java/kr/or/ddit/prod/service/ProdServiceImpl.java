package kr.or.ddit.prod.service;

import java.util.List;

import kr.or.ddit.prod.dao.ProdDAO;
import kr.or.ddit.prod.dao.ProdDAOImpl;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdVO;

public class ProdServiceImpl implements ProdService {
	private ProdDAO prodDAO = new ProdDAOImpl();

	@Override
	public ProdVO retrieveProd(String prodId) {
		ProdVO prod = prodDAO.selectProd(prodId);
		if (prod==null)
			throw new RuntimeException(String.format("%s 는 없는 상품", prodId));
		return prod;
	}

	// call by reference : 참조에 의한 호출을 의미합니다. 전달받은 값을 직접 참조합니다. 즉 전달받은 값을 변경할 경우 원본도 같이 변경이 됩니다.
	@Override
	public void retrieveProdList(PagingVO<ProdVO> pagingVO) { // 검색 조건도 포함되어 있을 것!!!
		pagingVO.setTotalRecord(prodDAO.selectTotalRecord(pagingVO));
		List<ProdVO> dataList = prodDAO.selectProdList(pagingVO);
		pagingVO.setDataList(dataList);
	}
}
