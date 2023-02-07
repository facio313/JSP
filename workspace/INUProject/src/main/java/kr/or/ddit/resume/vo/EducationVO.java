package kr.or.ddit.resume.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class EducationVO {
	
	private String eduSn;
	private String memId;
	private String eduName;
	private String eduDepartment;
	private String eduMajor;
	private String eduEntered;
	private String eduGraduated;
	private String eduStatus;
	private double eduScore;
	private double eduStandard;
	private String eduInsertDate;
	private String eduDeleteDate;
	private Integer attId;
	
	public String getEduEntered() {
		return eduEntered;
	}
	public void setEduEntered(String eduEntered) {
		this.eduEntered = eduEntered.substring(0, 10);
	}
	public String getEduGraduated() {
		return eduGraduated;
	}
	public void setEduGraduated(String eduGraduated) {
		this.eduGraduated = eduGraduated.substring(0, 10);
	}
	
}
