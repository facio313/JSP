package kr.or.ddit.resume.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.resume.dao.ActivityDAO;
import kr.or.ddit.resume.dao.AwardDAO;
import kr.or.ddit.resume.dao.CareerDAO;
import kr.or.ddit.resume.dao.CertificationDAO;
import kr.or.ddit.resume.dao.CourseDAO;
import kr.or.ddit.resume.dao.EducationDAO;
import kr.or.ddit.resume.dao.FacilityDAO;
import kr.or.ddit.resume.dao.ResumeDAO;
import kr.or.ddit.resume.vo.ActivityVO;
import kr.or.ddit.resume.vo.AwardVO;
import kr.or.ddit.resume.vo.CareerVO;
import kr.or.ddit.resume.vo.CertificationVO;
import kr.or.ddit.resume.vo.CourseVO;
import kr.or.ddit.resume.vo.EducationVO;
import kr.or.ddit.resume.vo.FacilityVO;
import kr.or.ddit.resume.vo.ResumeItemVO;
import kr.or.ddit.resume.vo.ResumeVO;
import lombok.extern.slf4j.Slf4j;

@Service
public class ResumeServiceImpl implements ResumeService {
	@Inject
	private ResumeDAO dao;
	
	@Inject
	private EducationDAO edu;
	@Inject
	private CareerDAO career;
	@Inject
	private CertificationDAO cert;
	@Inject
	private FacilityDAO facility;
	@Inject
	private ActivityDAO activity;
	@Inject
	private CourseDAO course;
	@Inject
	private AwardDAO award;
	
	@Override
	public ResumeVO retrieveResume(String resumeSn) {
		ResumeVO resume = dao.selectResume(resumeSn);
		retrieveItemList(resumeSn, resume);
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

	@Override
	public void retrieveItemList(String resumeSn, ResumeVO resume) {
		List<ResumeItemVO> itemList = dao.selectItemList(resumeSn);
		String sn = null;
		for (ResumeItemVO item : itemList) {
			sn = item.getResumeItemSn();
			switch (sn.substring(0, 3)) {
				case "EDU": // 나중에 enum으로 바꾸
					if (resume.getEduList() == null) {
						resume.setEduList(new ArrayList());
					}
					resume.getEduList().add(edu.selectEducation(sn));
					break;
				case "CRR":
					if (resume.getCareerList() == null) {
						resume.setCareerList(new ArrayList());
					}
					resume.getCareerList().add(career.selectCareer(sn));
					break;
				case "CRT":
					if (resume.getCertList() == null) {
						resume.setCertList(new ArrayList());
					}
					resume.getCertList().add(cert.selectCertification(sn));
					break;
				case "FAC":
					if (resume.getFacilityList() == null) {
						resume.setFacilityList(new ArrayList());
					}
					resume.getFacilityList().add(facility.selectFacility(sn));
					break;
				case "ACT":
					if (resume.getActivityList() == null) {
						resume.setActivityList(new ArrayList());
					}
					resume.getActivityList().add(activity.selectActivity(sn));
					break;
				case "CRS":
					if (resume.getCourseList() == null) {
						resume.setCourseList(new ArrayList());
					}
					resume.getCourseList().add(course.selectCourse(sn));
					break;
				case "AWD":
					if (resume.getAwardList() == null) {
						resume.setAwardList(new ArrayList());
					}
					resume.getAwardList().add(award.selectAward(sn));
					break;
			}
		}
	}

	@Override
	public ServiceResult createItem(String resumeSn, Object vo) {
		int rowcnt = 0;
		String resumeItemSn = "";
		if (vo instanceof EducationVO) {
			rowcnt += edu.inserteEducation((EducationVO) vo);
			resumeItemSn = ((EducationVO) vo).getTblId();
//		} else if (vo instanceof CareerVO) {
//			rowcnt += career.insertCareer((CareerVO) vo);
//			resumeItemSn = ((CareerVO) vo).getTblId();
		}
		ResumeItemVO item = new ResumeItemVO(resumeSn, resumeItemSn);
		rowcnt += dao.insertItem(item);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}
	
	@Override
	public ServiceResult removeItem(String resumeItemSn) {
		int rowcnt = dao.deleteItem(resumeItemSn);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ResumeVO retrieveItemForResume(String memId) {
		ResumeVO resume = new ResumeVO();
		if (resume.getEduList() == null) {
			resume.setEduList(edu.selectEducationForResume(memId));
		}
		
		return resume;
	}

}
