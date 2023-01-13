package kr.or.ddit.board.vo;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="boNo")
@ToString(exclude= {"boContent", "boPass"})
public class BoardVO implements Serializable {
	private int rnum;
	private Integer boNo;
	private String boTitle;
	private String boWriter;
	private String boIp;
	private String boMail;
	@JsonIgnore
	private transient String boPass; // 아무리 transient를 붙이더라도 마샬링할 때는 들어감. 그래서 위에 @JsonIgnore
	private String boContent;
	private String boDate;
	private Integer boHit;
	
	private List<AttachVO> attachList; // has many
	
	private int[] delAttNos; // 게시글 수정 시 삭제할 첨부파일 번호 유지
	
	private int attCount;
}