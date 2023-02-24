package kr.or.ddit.expert.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.expert.vo.ExprodVO;
import kr.or.ddit.expert.vo.ExreviewVO;
import kr.or.ddit.vo.PagingVO;

@Mapper
public interface ExprodDAO {
	public int InsertExprod(ExprodVO exprod);
	
	public ExprodVO selectExprod(String exprodId);
	
	public int updateExprod(ExprodVO exprod);
	
	public List<ExprodVO> selectExprodList(PagingVO<ExprodVO> pagingVO);
	
	public int selectTotalRecord(PagingVO<ExprodVO> pagingVO);
	
	public int deleteExprod(String exprodId);
	
	public int updateExprodName(ExprodVO exprod);
	
	public List<ExreviewVO> selectExreviewList(String exprodId);
	
	
	
	/*=========================시스템 관리 부분=========================*/
	//상품 신청 목록
	public List<ExprodVO> selectAppliProdList(PagingVO<ExprodVO> pagingVO);
	//상품 승인
	public int updateAppliProd(ExprodVO exprod);
	
}
