package kr.or.ddit.resume.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.resume.dao.FacilityDAO;
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
@Service
public class FacilityServiceImpl implements FacilityService {

	@Inject
	private FacilityDAO dao;
	
	@Override
	public FacilityVO retrieveFacility(String facilitySn) {
		FacilityVO facility = dao.selectFacility(facilitySn);
		return facility;
	}

	@Override
	public List<FacilityVO> retrieveFacilityList(String memId) {
		List<FacilityVO> facilityList = dao.selectFacilityList(memId);
		return facilityList;
	}

	@Override
	public ServiceResult createFacility(FacilityVO facility) {

		return null;
	}

	@Override
	public ServiceResult modifyFacility(FacilityVO facility) {

		return null;
	}

}
