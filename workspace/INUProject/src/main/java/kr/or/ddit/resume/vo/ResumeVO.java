package kr.or.ddit.resume.vo;

import java.util.List;

import kr.or.ddit.vo.SeekerVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ResumeVO {

	private String resumeSn;
	private String memId;
	private String resumeTitle;
	private String resumeInsertDate;
	private String resumeDeleteDate;
	private String resumeName;
	private String resumeGender;
	private String resumeAddr1;
	private String resumeEmail;
	private String resumeTel;
	
	private List<ResumeItemVO> itemList;
}
