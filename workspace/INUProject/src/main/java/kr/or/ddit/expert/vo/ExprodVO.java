package kr.or.ddit.expert.vo;

import java.util.List;

import lombok.Data;

@Data
public class ExprodVO extends ExpertVO{
	private int rnum;
	private String exprodId;
	private String exprodStart;
	private String exprodEnd;
	private String exprodTarget;
	private String exprodName;
	private Integer exprodPrice;
	private String exprodWay;
	private String exprodTime;
	private String exprodDetail;
	private String memId;
	private String expertId;
	private String memName;
	private String memEmail;
	private String expertField;
	private String exprodAproval;
	private String exlprodId;
	private String exfieldId;
	private String exjobId;
	private String exprodPr;
	private String preExprod;
	private String nextExprod;
	private List<ExcartVO> excartList;
	private List<ExreviewVO> exreviewList;
	
	public String getPreExprod() {
		if(preExprod!=null) {
			return preExprod;
		}else if(preExprod==null){
			preExprod = null;
		}
		return preExprod;
		
	}
	public String getNextExprod() {
		if(nextExprod!=null) {
			return nextExprod;
		}else if(nextExprod==null){
			nextExprod = null;
		}		
		
		return nextExprod;
	}
	
	
}