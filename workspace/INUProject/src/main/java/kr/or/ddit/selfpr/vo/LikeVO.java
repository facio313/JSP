package kr.or.ddit.selfpr.vo;

import java.sql.Date;

import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class LikeVO {
	
	@NotNull
	private int inteNo;
	@NotNull
	private Date inteDate;
	@NotNull
	private int prNo;
	@NotNull
	private String memId;
}
