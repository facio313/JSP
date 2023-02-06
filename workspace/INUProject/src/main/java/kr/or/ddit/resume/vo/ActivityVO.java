package kr.or.ddit.resume.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ActivityVO {

	private String actSn;
	private String memId;
	private String actName;
	private String actCategory;
	private String actInstitution;
	private String actPeriod;
	private String actInsertDate;
	private String actDeleteDate;
	private Integer attId;
}
