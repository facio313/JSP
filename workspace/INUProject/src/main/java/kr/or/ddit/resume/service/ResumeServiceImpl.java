package kr.or.ddit.resume.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.resume.dao.ResumeDAO;
import kr.or.ddit.resume.vo.ResumeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ResumeServiceImpl implements ResumeService {
	@Inject
	private ResumeDAO dao;

	@Override
	public ResumeVO retrieveResume(String resumeSn) {
		ResumeVO resume = dao.selectResume(resumeSn);
		return resume;
	}

	@Override
	public List<ResumeVO> retrieveResumeList(String memId) {
		List<ResumeVO> resumeList = dao.selectResumeList(memId);
		return resumeList;
	}

	@Override
	public ServiceResult createResume(ResumeVO resume) {

		return null;
	}

	@Override
	public ServiceResult modifyResume(ResumeVO resume) {

		return null;
	}

}
