package kr.or.ddit.resume.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class FacilityVO {

	private String facilitySn;
	private String memId;
	private String facilityName;
	private String facilityCategory;
	private String facilityLevel;
	private String facilityGetdate;
	private String facilityPeriod;
	private String facilityInsertDate;
	private String facilityDeleteDate;
	private Integer attId;
	
	public String getFacilityGetdate() {
		return facilityGetdate;
	}
	public void setFacilityGetdate(String facilityGetdate) {
		this.facilityGetdate = facilityGetdate.substring(0, 10);
	}
	
	
}
