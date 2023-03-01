package kr.or.ddit.apply.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.apply.dao.ApplyDAO;
import kr.or.ddit.apply.vo.ApplyVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.process.service.ProcessService;

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
	
	@Inject
	private ProcessService processService;
	
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
	public List<ApplyVO> retrieveApplicant(String daNo, String processCodeId) {
		Map<String, String> map = new HashMap<>();
		map.put("daNo", daNo);
		map.put("processCodeId", processCodeId);
		List<ApplyVO> applicantList = dao.selectApplicant(map);
		List<ApplyVO> modifiedList = new ArrayList<>();
		for (ApplyVO vo : applicantList) {
			String vp = vo.getProcessCodeId();
			if (processCodeId.equals("PRC01")) {
				vo.setSelected(vo.getScoreResume());
				modifiedList.add(vo);
			} else if (processCodeId.equals("PRC02") && !vp.equals("PRC01")) {
				vo.setSelected(vo.getScoreIntro());
				modifiedList.add(vo);
			} else if (processCodeId.equals("PRC03") && !vp.equals("PRC01") && !vp.equals("PRC02")) {
				vo.setSelected(vo.getScoreTest());
				modifiedList.add(vo);
			} else if (processCodeId.equals("PRC04") && !vp.equals("PRC01") && !vp.equals("PRC02") && !vp.equals("PRC03")) {
				vo.setSelected(vo.getScoreComp());
				modifiedList.add(vo);
			} else if (processCodeId.equals("PRC05") && !vp.equals("PRC01") && !vp.equals("PRC02") && !vp.equals("PRC03") && !vp.equals("PRC04")) {
				vo.setSelected(vo.getScoreDiscuss());
				modifiedList.add(vo);
			} else if (processCodeId.equals("PRC06") && !vp.equals("PRC01") && !vp.equals("PRC02") && !vp.equals("PRC03") && !vp.equals("PRC04") && !vp.equals("PRC05")) {
				vo.setSelected(vo.getScorePractice());
				modifiedList.add(vo);
			} else if (processCodeId.equals("PRC07") && !vp.equals("PRC01") && !vp.equals("PRC02") && !vp.equals("PRC03") && !vp.equals("PRC04") && !vp.equals("PRC05") && !vp.equals("PRC06")) {
				vo.setSelected(vo.getScoreIntern());
				modifiedList.add(vo);
			} else if (processCodeId.equals("PRC08") && !vp.equals("PRC01") && !vp.equals("PRC02") && !vp.equals("PRC03") && !vp.equals("PRC04") && !vp.equals("PRC05") && !vp.equals("PRC06") && !vp.equals("PRC07")) {
				vo.setSelected(vo.getScoreIndepth());
				modifiedList.add(vo);
			}
		}
		
		return modifiedList;
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
			map.put("table", "SCORE_COMP");
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

	@Override
	public ServiceResult modifyScoreZero(String table, String itemCodeId, String applySn) {
		Map<String, String> map = new HashMap<>();
		map.put("table", table);
		map.put("itemCodeId", itemCodeId);
		map.put("applySn", applySn);
		int rowcnt = dao.updateScoreZero(map);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<String> retireveApplySnList(String daNo) {
		List<String> list = dao.selectApplySnList(daNo);
		return list;
	}
	
	// 여러 개 넣으면 이상함..
	@Override
	public ServiceResult modifyResult(List<ApplyVO> resultList) {
		int rowcnt = 0;
		String daNo = resultList.get(0).getDaNo();
		List<String> processList = processService.retrieveProcessListFor(daNo);
		for (ApplyVO vo : resultList) {
			String pcid = vo.getProcessCodeId();
			String result = vo.getApplyResult();
			for (int i = 0; i < processList.size(); i++) {
				if (pcid.equals(processList.get(i))) {
					if (!pcid.equals("PRC08")) {
						if (result.equals("합격")) {
							vo.setProcessCodeId(processList.get(i + 1));
							vo.setApplyResult("진행중");
							dao.updateResult(vo);
						} else {
							dao.updateResult(vo);
						}
					} else {
						if (result.equals("합격")) {
							vo.setApplyResult("최종합격");
							dao.updateResult(vo);
						} else {
							dao.updateResult(vo);
						}
					}
				}
			}

		}
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

}
