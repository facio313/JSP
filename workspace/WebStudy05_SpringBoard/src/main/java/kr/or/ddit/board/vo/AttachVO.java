package kr.or.ddit.board.vo;

import java.io.Serializable;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@EqualsAndHashCode(of="attNo")
@NoArgsConstructor // DB에서 보내는 것을 받으려면 기본 생성자가 필요하다.(DB Column을 반영했으니까)
public class AttachVO implements Serializable {
	private MultipartFile realFile;

	// DL은 클라이언트가 보내주는 것, 디비에서 오는 것 두 가지 경우가 있다.
	// 이 생성자는 클라이언트가 보내주는 것은 받는 것이다.
	public AttachVO(MultipartFile realFile) {
		super();
		this.realFile = realFile;
		this.attFilename = realFile.getOriginalFilename();
		this.attSavename = UUID.randomUUID().toString();
		this.attMime = realFile.getContentType();
		this.attFilesize = realFile.getSize();
		this.attFancysize = FileUtils.byteCountToDisplaySize(attFilesize);
	}
	private Integer attNo;
	private Integer boNo;
	private String attFilename;
	private String attSavename;
	private String attMime;
	private Long attFilesize;
	private String attFancysize;
	private Integer attDownload;
}
