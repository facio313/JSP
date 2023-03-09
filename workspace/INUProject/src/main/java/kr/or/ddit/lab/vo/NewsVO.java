package kr.or.ddit.lab.vo;

import java.sql.Date;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class NewsVO {
	
	@NotNull
	private int newsNo;
	private String newsField;
	private String newsName;
	private String newsSemiName;
	private int newsHit;
	private Date newsDate;
	private String newsContent;
	
	private int newsFieldSum;
	
	}
