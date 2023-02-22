package kr.or.ddit.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString(exclude= {"cutContent"})
@Data
@NoArgsConstructor
public class CutVO {

	private String cutSn;
	private String cutDate;
	private String cutContent;
	private String memId;
	private String cutCheck;
}
