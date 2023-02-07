package kr.or.ddit.expert.vo;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.AttachVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ExeventVO implements Serializable{
	private int rnum;
	@NotNull(groups= {UpdateGroup.class, DeleteGroup.class})
	private String exeventId;
	private String exeventName;
	private String exeventContent;
	private String exeventStart;
	private String exeventEnd;
	private int exeventAttId;
	private int exeventHits;
	
	private List<AttachVO> attatchList;	// has many
	
	private int[] delAttNos; // 게시글 수정시 삭제할 첨부파일 번호 유지.
	
	private int attCount;
	
	private MultipartFile[] exeventFiles;
	
	private int startAttNo;
	
	public void setExeventFiles(MultipartFile[] exeventFiles) {
		if(exeventFiles!=null && exeventFiles.length > 0) {
			this.exeventFiles = exeventFiles;
			this.attatchList = Arrays.stream(exeventFiles)
					.filter((f) ->!f.isEmpty())
					.map((f)->{
						return new AttachVO(f);
					}).collect(Collectors.toList());
		}
		
	}
}
