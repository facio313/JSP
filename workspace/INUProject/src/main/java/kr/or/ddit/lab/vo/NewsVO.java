package kr.or.ddit.lab.vo;

import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class NewsVO {
	@NotNull
	private String newsField;
	@NotNull
	private String newsName;
	@NotNull
	private int newsHit;
	@NotNull
	private String newsDate;
}
