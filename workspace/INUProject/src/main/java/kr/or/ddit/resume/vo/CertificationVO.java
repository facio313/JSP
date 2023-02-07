package kr.or.ddit.resume.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CertificationVO {

	private String certSn;
	private String memId;
	private String certNo;
	private String certName;
	private String certDate;
	private String certInstitution;
	private String certInsertDate;
	private String certDeleteDate;
	private Integer attId;
	
	public String getCertDate() {
		return certDate;
	}
	public void setCertDate(String certDate) {
		this.certDate = certDate.substring(0, 10);
	}
	
}
