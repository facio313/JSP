package kr.or.ddit.sample.dao;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository("daoOracle") // 아 얘가 persistent구나!
//@Component // 위와 다르게 의미가 모호해짐
public class SampleDAOImpl_Oracle implements SampleDAO {

	public void init() {
		log.info("{} 객체 초기화", getClass().getSimpleName()); // 가장 마지막에 실행됨
	}

	public void destroy() {
		log.info("{} 객체 소멸", getClass().getSimpleName());
	}

	private Map<String, String> dummyDB;
	
	// setter로 호출하는 단점 : 한 번도 호출되지 않으면 Inject되지 않음
	@Required // 위 단점을 상쇄하는데, 실제로는 주입해주는 애가 아님 => 밑에 거 주석으로 묶고 실행 시 Property 'dummyDB' is required for bean 'daoOracle'라고 에러가 나오게끔 하는 것 => 즉, 주입해야 된다고만 알려주는 것
	@Resource(name="oracleDB") // 이걸 주석으로 묶으면 위에 거가 있더라도 주입되지 않고 에러남 // 실제로 주입하는 애
	public void setDummyDB(Map<String, String> dummyDB) {
		this.dummyDB = dummyDB;
		log.info("{} 객체 생성, setter 주입으로 dummyDB 객체 주입.", getClass().getSimpleName());
	}

//	public SampleDAOImpl_Oracle(@Autowired Map<String, String> dummyDB) {//생성자방식
//		super();
//		log.info("{} 객체 생성, 생성자 주입으로 dummyDB 객체 주입.", getClass().getSimpleName());
//		this.dummyDB = dummyDB;
////		dummyDB = new HashMap<>();
////		int idx = 0;
////		dummyDB.put("PK_" + ++idx, "oracle 레코드 " + idx);
////		dummyDB.put("PK_" + ++idx, "oracle 레코드 " + idx);
////		dummyDB.put("PK_" + ++idx, "oracle 레코드 " + idx);
//		//주입받을 때 고려할 건 셋터로 주입받을 지 생성자로 받을지
//	}

	@Override
	public String selectRawData(String primaryKey) {
		return dummyDB.get(primaryKey);
	}

}
