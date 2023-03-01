package kr.or.ddit.selfpr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.selfpr.dao.TodaySeeDAO;
import kr.or.ddit.selfpr.vo.TodaySeeVO;

@Service
public class TodaySeeServiceImpl implements TodaySeeService {
	//DI(Dependency Injection) : 의존성 주입
	@Autowired
	TodaySeeDAO todaySeeDAO;
	
	//오늘 본 인재 로그 저장 및 24시간 내 확인
	@Override
	public int insertTodaySee(TodaySeeVO todaySeeVO) {
		//TodaySeeVO(todayNo=0, prNo=32, memId=abcabc001, TODAY_DATE=null, TODAY_EDATE=null)
		return this.todaySeeDAO.insertTodaySee(todaySeeVO);
	}
}
