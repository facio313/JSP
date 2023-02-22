package kr.or.ddit.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString(exclude= {"blackListContent"})
@Data
@NoArgsConstructor
public class BlackVO {

	private String blackListSn;
	private String blackListDate;
	private String blackListContent;
	private String memId;
	private String blackListCheck;
}
