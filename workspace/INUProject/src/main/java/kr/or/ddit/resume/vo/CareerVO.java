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
	
}
