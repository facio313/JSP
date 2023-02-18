package kr.or.ddit.process.vo;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ProcessVO {

	private String daNo;
	private String processCodeId;
	private Integer processSn;
	private String processStartDate;
	private String processEndDate;
	private String processWay;
	private Integer processScore;
	private String tblId;
	private String processLimit;
	private String processDeleteDate;
	private String processInsertDate;
	
	private List<ProcessVO> processList;
}
