package kr.or.ddit.resume.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CareerVO {

	private String careerSn;
	private String memId;
	private String careerCategory;
	private String careerCompany;
	private String careerTask;
	private String careerClass;
	private String careerJoin;
	private String careerResign;
	private String careerSalary;
	private Integer careerAnnual;
	private String careerInsertDate;
	private String careerDeleteDate;
	private Integer attId;
	
	public String getCareerJoin() {
		return careerJoin;
	}
	public void setCareerJoin(String careerJoin) {
		this.careerJoin = careerJoin.substring(0, 10);
	}
	public String getCareerResign() {
		return careerResign;
	}
	public void setCareerResign(String careerResign) {
		this.careerResign = careerResign.substring(0, 10);
	}
	
	
	
}
