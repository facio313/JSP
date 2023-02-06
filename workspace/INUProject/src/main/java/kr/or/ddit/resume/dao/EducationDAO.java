package kr.or.ddit.resume.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.resume.vo.EducationVO;

/**
 * @author 최경수
 * @since 2023. 2. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 	    수정일               수정자                                     수정내용
 * --------     --------    ----------------------
 * 2023. 2. 6.       최경수        최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Mapper
public interface EducationDAO {
	/**
	 * 하나의 학력 찾기
	 * @param eduId
	 * @return 존재하지 않으면, null
	 */
	public EducationVO selectEducation(String eduSn);
	
	/**
	 * 한 회원이 쓴 모든 학력 목록
	 * @param memId
	 * @return List
	 */
	public List<EducationVO> selectEducationList(String memId);
	
	/**
	 * 신규 학력 등록
	 * @param edu
	 * @return 등록된 학력 수
	 */
	public int inserteEducation(EducationVO edu);
	
	/**
	 * 학력 수정
	 * @param edu
	 * @return 수정된 학력 수
	 */
	public int updateEducation(EducationVO edu);
}
