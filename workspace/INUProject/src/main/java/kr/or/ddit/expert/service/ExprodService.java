package kr.or.ddit.expert.service;

import java.util.List;

import kr.or.ddit.expert.vo.ExprodVO;
import kr.or.ddit.expert.vo.ExreviewVO;
import kr.or.ddit.vo.PagingVO;

public interface ExprodService {
	public int InsertExprod(ExprodVO exprod);
	
	public ExprodVO selectExprod(String exprodId);
	
	public int updateExprod(ExprodVO exprod);
	
	public void selectExprodList(PagingVO<ExprodVO> pagingVO);
	
	public int removeExprod(String exprodId);
	
	public int updateExprodName(ExprodVO exprod);
	
	
	
	/*=========================시스템 관리 부분=========================*/
	//상품 신청 목록
	public void retrieveAppliProdList(PagingVO<ExprodVO> pagingVO);
	//상품 승인
	public int modifyAppliProd(ExprodVO exprod);
}
