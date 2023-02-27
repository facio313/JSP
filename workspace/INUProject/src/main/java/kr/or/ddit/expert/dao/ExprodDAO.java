package kr.or.ddit.expert.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.expert.vo.ExprodVO;
import kr.or.ddit.expert.vo.ExreviewVO;
import kr.or.ddit.expert.vo.LikeExprodVO;
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
	
	/**
	 * 관심상품 등록 여부 조회
	 * @param exprodId
	 * @param memId
	 * @return
	 */
	public int selectExprodlike(@Param("exprodId") String exprodId, @Param("memId") String memId);
	
	/**
	 * 관심상품 등록
	 * @param exprodId
	 * @param memId
	 * @return
	 */
	public int insertExprodlike(@Param("exprodId") String exprodId, @Param("memId") String memId);
	
	/**
	 * 관심상품 삭제
	 * @param exprodId
	 * @param memId
	 * @return
	 */
	public int deleteExprodlike(@Param("exprodId") String exprodId, @Param("memId") String memId);
	
	/*=========================시스템 관리 부분=========================*/
	//상품 신청 목록
	public List<ExprodVO> selectAppliProdList(PagingVO<ExprodVO> pagingVO);
	//상품 신청 세부
	public ExprodVO selectAppliProd(String exprodId);
	//상품 신청 승인
	public int updateAppliProd(ExprodVO exprod);
	//상품 신청 반려
	public int deleteAppliProd(ExprodVO exprod);
	
}
