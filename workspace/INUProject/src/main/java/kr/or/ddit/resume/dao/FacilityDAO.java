package kr.or.ddit.resume.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.resume.vo.FacilityVO;

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
public interface FacilityDAO {
	/**
	 * 하나의 기능 찾기
	 * @param facilityId
	 * @return 존재하지 않으면, null
	 */
	public FacilityVO selectFacility(String facilitySn);
	
	/**
	 * 한 회원이 쓴 모든 기능 목록
	 * @param memId
	 * @return List
	 */
	public List<FacilityVO> selectFacilityList(String memId);
	
	/**
	 * 신규 기능 등록
	 * @param facility
	 * @return 등록된 기능 수
	 */
	public int insertFacility(FacilityVO facility);
	
	/**
	 * 기능 수정
	 * @param facility
	 * @return 수정된 기능 수
	 */
	public int updateFacility(FacilityVO facility);
}
