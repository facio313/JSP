package kr.or.ddit.resume.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.resume.dao.EducationDAO;
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
@Service
public class EducationServiceImpl implements EducationService {

	@Inject
	private EducationDAO dao;
	
	@Override
	public EducationVO retrieveEducation(String eduSn) {
		EducationVO edu = dao.selectEducation(eduSn);
		return edu;
	}

	@Override
	public List<EducationVO> retrieveEducationList(String memId) {
		List<EducationVO> eduList = dao.selectEducationList(memId);
		return eduList;
	}

	@Override
	public ServiceResult createEducation(EducationVO edu) {

		return null;
	}

	@Override
	public ServiceResult modifyEducation(EducationVO edu) {

		return null;
	}

}
