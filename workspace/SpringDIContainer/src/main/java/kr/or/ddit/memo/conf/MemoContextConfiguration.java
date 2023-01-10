package kr.or.ddit.memo.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;

import kr.or.ddit.memo.MemoTestView;
import kr.or.ddit.memo.dao.FileSystemMemoDAOImpl;
import kr.or.ddit.memo.dao.MemoDAO;
import kr.or.ddit.memo.service.MemoService;

@ComponentScan("kr.or.ddit.memo")
@Lazy
public class MemoContextConfiguration {
//	@Bean // id를 안 붙이면 메서드명이 id가 됨
//	@Scope("prototype") // value와 ScopeName은 같은 의미
//	public MemoDAO memoDAO() {
//		return new FileSystemMemoDAOImpl();
//	}
//	
//	@Bean
//	public MemoService generateService(MemoDAO dao) {
//		return new MemoService(dao);
//	}
//	
//	@Bean("testView")
//	public MemoTestView testView(MemoService service) { // setter의 문제점 때문에 inject이 안 됐는데, 기본 생성자도 상관 없어짐?????
//		MemoTestView view = new MemoTestView();
//		view.setService(service);
//		return view;
//	}
}
