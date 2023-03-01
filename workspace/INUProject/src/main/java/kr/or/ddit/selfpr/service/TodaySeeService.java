package kr.or.ddit.selfpr.service;

import kr.or.ddit.selfpr.vo.TodaySeeVO;

public interface TodaySeeService {
	//메소드 시그니처
	//오늘 본 인재 로그 저장 및 24시간 내 확인
	public int insertTodaySee(TodaySeeVO todaySeeVO);

}
