package kr.or.ddit.resume.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.resume.dao.AwardDAO;
import kr.or.ddit.resume.vo.AwardVO;

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
public class AwardServiceImpl implements AwardService {

	@Inject
	private AwardDAO dao;
	
	@Override
	public AwardVO retrieveAward(String awardSn) {
		AwardVO award = dao.selectAward(awardSn);
		return award;
	}

	@Override
	public List<AwardVO> retrieveAwardList(String memId) {
		List<AwardVO> awardList = dao.selectAwardList(memId);
		return awardList;
	}

	@Override
	public ServiceResult createAward(AwardVO award) {

		return null;
	}

	@Override
	public ServiceResult modifyAward(AwardVO award) {

		return null;
	}

}
