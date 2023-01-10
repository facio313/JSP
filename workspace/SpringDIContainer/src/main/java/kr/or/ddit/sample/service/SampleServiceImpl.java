package kr.or.ddit.sample.service;

import java.util.Calendar;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import kr.or.ddit.sample.dao.SampleDAO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("sampleService")
public class SampleServiceImpl implements SampleService, ApplicationContextAware {
	private ConfigurableApplicationContext context;
	private Resource log4j2xml;

	@Override
	public void setApplicationContext(ApplicationContext arg0) throws BeansException {
		// 등록된 어플리케이션 중에서 ApplicationContextAware
		this.context = (ConfigurableApplicationContext) arg0;
		log.info("ApplicationContextAware 구조로 컨테이너 주입됨");
	}

	public void init() {
		log.info("{} 객체 초기화", getClass().getSimpleName());
		log4j2xml = context.getResource("classpath:log4j2.xml");
		log.info("{} 리소스 로딩 완료", log4j2xml);
	}

	public void destroy() {
		log.info("{} 객체 소멸", getClass().getSimpleName());
	}

	// case1 : 의존객체를 new 키워드로 직접 생성.(결합력 최상)
	// private SampleDAO dao = new SampleDAOImpl_Oracle();
	// private SampleDAO dao = new SampleDAOImpl_Postgre();

	// case2 : Factory Object[Method] Pattern
	// 결합력 낮아짐, 어떤 sql을 사용해도 SampleDAOFactory만 수정하면 됨
	// 단점 : factory에서 변경
	// private SampleDAO dao = SampleDAOFactory.getSampleDAO();

	// case3 : Strategy Pattern, 전략 주입자가 필요함(view)
	// 의존해야하는 전략객체를 내가 생성하지 않음 -> 상황에 맞게 주입받음
	// 단점 : view에서 변경해야함

	// case4 : DI Container
	// xml만 수정하면 됨 -> 재기동 필요 없음
	@javax.annotation.Resource(name="daoOracle")
	private SampleDAO dao; // 전략객체

	// 기본생성자 주입
	public SampleServiceImpl() {
		super();
		log.info("기본생성자로 {} 객체 생성", getClass().getSimpleName());
	}

	// setter 주입
//	@Autowired
	public void setDao(SampleDAO dao) {
		this.dao = dao;
		log.info("{} 객체 생성 후 setter를 통해 주입받음"
				, getClass().getSimpleName()
				, dao.getClass().getSimpleName());
	}


	// 생성자나 setter를 통해서 외부에서 주입받음
	public SampleServiceImpl(SampleDAO dao) {
		super();
		this.dao = dao;
		log.info("{} 객체 생성 및 전략 객체({}) 주입", getClass().getSimpleName());
	}

	@Override
	public StringBuffer retrieveInformation(String pk) {
		String data = dao.selectRawData(pk);
		StringBuffer infomation = new StringBuffer();
		infomation.append(String.format("%tc에 조회된 데이터를 가공함 - %s", Calendar.getInstance(), data));
		return infomation;
	}

}
