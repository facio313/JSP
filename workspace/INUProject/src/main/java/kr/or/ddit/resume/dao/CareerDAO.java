package kr.or.ddit.resume.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.resume.vo.CareerVO;

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
public interface CareerDAO {
	/**
	 * 하나의 경력 찾기
	 * @param CareerId
	 * @return 존재하지 않으면, null
	 */
	public CareerVO selectCareer(String careerSn);
	
	/**
	 * 한 회원이 쓴 모든 경력 목록
	 * @param memId
	 * @return List
	 */
	public List<CareerVO> selectCareerList(String memId);
	
	/**
	 * 신규 경력 등록
	 * @param Career
	 * @return 등록된 경력 수
	 */
	public int insertCareer(CareerVO career);
	
	/**
	 * 경력 수정
	 * @param Career
	 * @return 수정된 경력 수
	 */
	public int updateCareer(CareerVO career);
}
