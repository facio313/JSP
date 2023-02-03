package kr.or.ddit.company.dao;


import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.company.vo.CompanyVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;

/**
 * 회원관리(CRUD)를 위한 Persistence Layer
 *
 */
@Mapper
public interface CompanyDAO{
	public int selectTotalRecord(PagingVO<MemberVO> pagingVO);
	
	public CompanyVO selectCompany(String comId);

}
