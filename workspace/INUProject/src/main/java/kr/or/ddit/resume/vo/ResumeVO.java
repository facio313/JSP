package kr.or.ddit.resume.vo;

import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.vo.SeekerVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
public class ResumeVO {

	private String resumeSn;
	private String memId;
	private String resumeTitle;
	private String resumeInsertDate;
	private String resumeDeleteDate;
	private String resumeName;
	private String resumeGender;
	private String resumeAddr1;
	private String resumeEmail;
	private String resumeTel;
	
	private List<ResumeItemVO> itemList;
	
	private List<EducationVO> eduList;
	private List<CareerVO> careerList;
	private List<CertificationVO> certList;
	private List<FacilityVO> facilityList;
	private List<ActivityVO> activityList;
	private List<CourseVO> courseList;
	private List<AwardVO> awardList;
	
}
