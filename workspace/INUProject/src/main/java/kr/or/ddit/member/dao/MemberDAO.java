package kr.or.ddit.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.context.support.WebApplicationContextUtils;

import kr.or.ddit.vo.IncruiterVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SeekerVO;

/**
 * 회원관리(CRUD)를 위한 Persistence Layer
 *
 */
@Mapper
public interface MemberDAO{
	public int selectTotalRecord(PagingVO<MemberVO> pagingVO);
	
	/**
	 * 회원 신규 등록
	 * @param member
	 * @return 등록된 레코드 수 (rowcnt) > 0 : 성공, <= 0 : 실패 
	 */
	public int insertMember(MemberVO member);
	
	/**
	 * 일반회원 신규 등록
	 * @param member
	 * @return 등록된 레코드 수 (rowcnt) > 0 : 성공, <= 0 : 실패 
	 */
	public int insertSeeker(SeekerVO seeker);
	
	/**
	 * 기업회원 신규 등록
	 * @param member
	 * @return 등록된 레코드 수 (rowcnt) > 0 : 성공, <= 0 : 실패 
	 */
	public int insertIncruiter(IncruiterVO incruiter);
	/**
	 * 회원 목록 조회
	 * @param pagingVO TODO
	 * @return size == 0 인 경우, 조건에 맞는 레코드 없음. 
	 */
	public List<MemberVO> selectMemberList(PagingVO<MemberVO> pagingVO);
	/** 회원 상세 조회
	 * @param memId
	 * @return 조건에 맞는 레코드 없는 경우, null 반환
	 */
	public MemberVO selectMember(@Param("memId") String memId);
	
	/**
	 * 회원 정보 수정
	 * @param member
	 * @return 수정된 레코드 수(rowcnt) > 0 : 성공, <= 0 : 실패  
	 */
	public int updateMember(MemberVO member);
	/**
	 * 회원 정보 삭제(?)
	 * @param memId
	 * @return 삭제된 레코드 수(rowcnt) > 0 : 성공, <= 0 : 실패  
	 */
	public int deleteMember(String memId);
}