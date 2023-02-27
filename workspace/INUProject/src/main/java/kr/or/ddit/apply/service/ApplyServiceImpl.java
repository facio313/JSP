package kr.or.ddit.apply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.apply.dao.ApplyDAO;
import kr.or.ddit.apply.vo.ApplyVO;
import kr.or.ddit.enumpkg.ServiceResult;

/**
 * 
 * @author 최경수
 * @since 2023. 2. 13.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자        수정내용
 * --------     --------    ----------------------
 * 2023. 2. 13.      최경수       최초작성
 * 2023. 2. 27.      최경수       지원자 목록 가져오기
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Service
public class ApplyServiceImpl implements ApplyService {

	@Inject
	private ApplyDAO dao;
	
	@Override
	public ApplyVO retrieveApply(String applySn) {
		ApplyVO apply = dao.selectApply(applySn);
		return apply;
	}

	@Override
	public List<ApplyVO> retrieveApplyList(String memId) {
		List<ApplyVO> list = dao.selectApplyList(memId);
		return list;
	}

	@Override
	public ServiceResult createApply(ApplyVO apply) {
		int rowcnt = dao.insertApply(apply);
		String applySn = apply.getApplySn();
		rowcnt += dao.insertScore(applySn);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyApply(ApplyVO apply) {
		int rowcnt = dao.updateApply(apply);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeApply(String applySn) {
		int rowcnt = dao.deleteApply(applySn);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<ApplyVO> retrieveApplicant(String daNo, String processCodeId, String itemCodeId) {
		Map<String, String> map = new HashMap<>();
		map.put("daNo", daNo);
		map.put("processCodeId", processCodeId);
		List<ApplyVO> applicantList = dao.selectApplicant(map);
		for (ApplyVO vo : applicantList) {
			if (processCodeId.equals("PRC01")) {
				vo.setSelected(vo.getScoreResume());
			} else if (processCodeId.equals("PRC02")) {
				vo.setSelected(vo.getScoreIntro());
			} else if (processCodeId.equals("PRC03")) {
				vo.setSelected(vo.getScoreTest());
			} else if (processCodeId.equals("PRC04")) {
				vo.setSelected(vo.getScoreComp());
			} else if (processCodeId.equals("PRC05")) {
				vo.setSelected(vo.getScoreDiscuss());
			} else if (processCodeId.equals("PRC06")) {
				vo.setSelected(vo.getScorePractice());
			} else if (processCodeId.equals("PRC07")) {
				vo.setSelected(vo.getScoreIntern());
			} else if (processCodeId.equals("PRC08")) {
				vo.setSelected(vo.getScoreIndepth());
			}
		}
		
		return applicantList;
	}

	@Override
	public ServiceResult modifyScore(Map<String, String> map) {
		String processCodeId = map.get("processCodeId");
		if (processCodeId.equals("PRC01")) {
			map.put("table", "SCORE_RESUME");
		} else if (processCodeId.equals("PRC02")) {
			map.put("table", "SCORE_INTRO");	
		} else if (processCodeId.equals("PRC03")) {
			map.put("table", "SCORE_TEST");
		} else if (processCodeId.equals("PRC04")) {
			map.put("table", "SCORE_COMPETENCY");
		} else if (processCodeId.equals("PRC05")) {
			map.put("table", "SCORE_DISCUSS");
		} else if (processCodeId.equals("PRC06")) {
			map.put("table", "SCORE_PRACTICE");
		} else if (processCodeId.equals("PRC07")) {
			map.put("table", "SCORE_INTERN");
		} else if (processCodeId.equals("PRC08")) {
			map.put("table", "SCORE_INDEPTH");
		}
		int rowcnt = dao.updateScore(map);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

}
