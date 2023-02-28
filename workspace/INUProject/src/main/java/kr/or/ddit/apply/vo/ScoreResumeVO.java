package kr.or.ddit.apply.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ScoreResumeVO {
	private String applySn;
	private Integer itm001;
	private Integer itm002;
	private Integer itm003;
	private Integer itm004;
	private Integer itm005;
	private Integer itm006;
	private Integer itm007;
	private Integer itm008;
	private Integer itm009;
	private Integer itm010;
	private Integer itm011;
	private Integer itm012;
	private Integer resumeTotal;
	private Integer total;
	private Integer avg;
	private String resumeScoreDate;
	private String incruiterId;

	public void setResumeTotal(Integer resumeTotal) {
		if (resumeTotal == 0) {
			List<Integer> itmList = new ArrayList<>();
			itmList.add(itm001);
			itmList.add(itm002);
			itmList.add(itm003);
			itmList.add(itm004);
			itmList.add(itm005);
			itmList.add(itm006);
			itmList.add(itm007);
			itmList.add(itm008);
			itmList.add(itm009);
			itmList.add(itm010);
			itmList.add(itm011);
			itmList.add(itm012);
			
			List<Integer> modifiedList = new ArrayList<>();
			for (int itm : itmList) {
//			if (itm == 0) {
//				itmList.remove(itm);
//			}
				if (itm > 0) {
					modifiedList.add(itm);
				}
			}
			
			for (int i = 0; i < modifiedList.size(); i++) {
				resumeTotal += modifiedList.get(i);
			}
			
			this.total = resumeTotal;
			if (modifiedList.size() > 0) {
				this.avg = resumeTotal/modifiedList.size();
			} else {
				this.avg = 0;
			}
		} else {
			this.resumeTotal = resumeTotal;
			this.total = resumeTotal;
			this.avg = 0;
		}
	}
	
	
	
}
