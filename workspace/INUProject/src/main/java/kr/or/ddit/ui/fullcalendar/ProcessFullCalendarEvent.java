package kr.or.ddit.ui.fullcalendar;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Random;

import com.fasterxml.jackson.annotation.JsonInclude;

import kr.or.ddit.announcement.vo.AnnoDetailVO;
import kr.or.ddit.announcement.vo.AnnoVO;
import kr.or.ddit.process.vo.ProcessVO;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class ProcessFullCalendarEvent extends FullCalendarEventAdapter<ProcessVO>{

	private SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	
	public ProcessFullCalendarEvent(ProcessVO source) {
		super(source);
	}

	@Override
	public String getId() {
		return getSource().getProcessCodeId();
	}

	@Override
	public boolean isAllDay() {
		return true;
	}
	
	@Override
	public long getStart() {
		long start = 0;
		
		try {
			 start = formatter.parse(getSource().getProcessStartDate().substring(0, 16)).getTime();
		} catch (ParseException e) {
			new RuntimeException(e);
		}
		return start;
	}

	@Override
	public long getEnd() {
		long end = 0;
		try {
			end = formatter.parse(getSource().getProcessEndDate().substring(0, 16)).getTime();
		} catch (ParseException e) {
			new RuntimeException(e);
		}
		return end;
	}

	@Override
	public String getTitle() {
		return getSource().getProcessCodeName();
	}
	
	@Override
	public String getBackgroundColor() {
/*		Random random = new Random(System.currentTimeMillis());
		int bound = (int) (1*Math.pow(16, 6));
		String color = "#"+Integer.toString(random.nextInt(bound), 16); */
		String color = "";
		String daNo = getSource().getDaNo().substring(8);
		if (daNo.equals("0")) {
			color = "#7DABD0";
		} else if (daNo.equals("1")) {
			color = "#CFE7EA";
		} else if (daNo.equals("2")) {
			color = "#FBC1AD";
		} else if (daNo.equals("3")) {
			color = "#F56E4A";
		} else if (daNo.equals("4")) {
			color = "#FFDF6F";
		} else if (daNo.equals("5")) {
			color = "#E5E1E0";
		} else if (daNo.equals("6")) {
			color = "#B3DFEC";
		} else if (daNo.equals("7")) {
			color = "#B9C0EA";
		} else if (daNo.equals("8")) {
			color = "#E8A5CC";
		} else if (daNo.equals("9")) {
			color = "#F0725C";
		}
		return color;
	}
	
	@Override
	public String getUrl() {
		StringBuilder str = new StringBuilder();
		str.append("INUProcjest/process/").append(getSource().getDaNo()).append("/").append(getId());
		return str.toString();
	}

}
