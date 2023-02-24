package kr.or.ddit.expert.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.expert.dao.ExprodDAO;
import kr.or.ddit.expert.vo.ExprodVO;
import kr.or.ddit.expert.vo.ExreviewVO;
import kr.or.ddit.vo.PagingVO;
@Service
public class ExprodServiceImpl implements ExprodService {
	
	@Inject
	private ExprodDAO exprodDAO;
	
	@Override
	public int InsertExprod(ExprodVO exprod) {
		int rowcnt = exprodDAO.InsertExprod(exprod);
		return rowcnt;
	}

	@Override
	public ExprodVO selectExprod(String exprodId) {
		ExprodVO exprod = exprodDAO.selectExprod(exprodId);
		exprod.setExreviewList(exprodDAO.selectExreviewList(exprodId));
		return exprod;
	}

	@Override
	public int updateExprod(ExprodVO exprod) {
		int rowcnt = exprodDAO.updateExprod(exprod);
		return rowcnt;
	}

	@Override
	public void selectExprodList(PagingVO<ExprodVO> pagingVO) {
		pagingVO.setTotalRecord(exprodDAO.selectTotalRecord(pagingVO));
		List<ExprodVO> exprodList = exprodDAO.selectExprodList(pagingVO);
		pagingVO.setDataList(exprodList);
		exprodList.stream().forEach(System.out::println);
	}

	@Override
	public int removeExprod(String exprodId) {
		int rowcnt = exprodDAO.deleteExprod(exprodId);
		return rowcnt;
	}
	
	@Override
	public int updateExprodName(ExprodVO exprod) {
		int rowcnt = exprodDAO.updateExprodName(exprod);
		return rowcnt;
	}

	
	/*=========================시스템 관리 부분=========================*/
	//상품 신청 목록
	@Override
	public void retrieveAppliProdList(PagingVO<ExprodVO> pagingVO) {
		pagingVO.setTotalRecord(exprodDAO.selectTotalRecord(pagingVO));
		pagingVO.setDataList(exprodDAO.selectAppliProdList(pagingVO));
	}
	//상품 승인
	@Override
	public int modifyAppliProd(ExprodVO exprod) {
		int rowcnt = exprodDAO.updateAppliProd(exprod);
		return rowcnt;
	}



}
