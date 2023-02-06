package kr.or.ddit.resume.vo;

import java.util.List;

import kr.or.ddit.vo.SeekerVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ResumeVO {

	private String resumeSn;
	private SeekerVO seeker;
	private List<EducationVO> eduList;
	private List<CareerVO> careerList;
	private List<CertificationVO> certList;
	private List<FacilityVO> facilityList;
	private List<ActivityVO> activityList;
	private List<CourseVO> courseList;
	private List<AwardVO> awardList;
}
