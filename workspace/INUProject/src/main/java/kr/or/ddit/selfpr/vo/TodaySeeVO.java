package kr.or.ddit.selfpr.vo;

import java.util.Date;

import lombok.Data;

@Data
public class TodaySeeVO {

	private int todayNo;
	private String prNo;
	private String memId;
	
	private Date TODAY_DATE;
	private Date TODAY_EDATE;
	
}
