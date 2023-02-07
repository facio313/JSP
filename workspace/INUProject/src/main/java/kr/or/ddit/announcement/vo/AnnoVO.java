package kr.or.ddit.announcement.vo;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode
@ToString
public class AnnoVO {
	private int rnum;
	private String annoNo;
	private String cmpId;
	private String memId;
	private String annoTitle;
	private String annoContent;
	private String annoStartdate;
	private String annoEnddate;
	private Integer annoHit;
	private String annoDate;
	private String annoStateCd; //code(common)
	private String annoWorkenv;
	private String annoProbation;
	private String annoSalary;
	private Integer attId;
	private String industryCode; //code
	private String eduCode; //code
	
	private String industryName; 
	private String eduName;
	
	private List<AnnoDetailVO> detailList;
	private List<AnnoWalfareVO> walfareList;
	
	private List<String> regionList;
}
