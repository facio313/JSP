package kr.or.ddit.memo;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Required;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import kr.or.ddit.memo.conf.MemoContextConfiguration;
import kr.or.ddit.memo.service.MemoService;
import kr.or.ddit.vo.MemoVO;

@Controller
public class MemoTestView {
	private MemoService service;
	
	@Required
	@Inject
	public void setService(MemoService service) { // 주입
		this.service = service;
	}
	
	public void printMemoList() {
//		service.retrieveMemoList().forEach(System.out::println);
		List<MemoVO> list = service.retrieveMemoList();
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
	}
	
	public static void main(String[] args) {
		// 계층구조를 썼을 때!
		// age 설정을 하지 않는다면 주입받지 않더라도 한 번에 생성한다.(뭘?)
//		ConfigurableApplicationContext context = new GenericXmlApplicationContext("classpath:kr/or/ddit/memo/conf/auto/root-context.xml"); // Generic이라 아직 정해지지 않았다?
//		context.registerShutdownHook();
//		ConfigurableApplicationContext childContext = new ClassPathXmlApplicationContext(
//					new String[] {"kr/or/ddit/memo/conf/auto/servlet-context.xml"} // 이미 classpath가 붙어 있음
//					, context
//				);
//		context.registerShutdownHook();
//		childContext.registerShutdownHook();
	
		ConfigurableApplicationContext context = new AnnotationConfigApplicationContext(MemoContextConfiguration.class);
		context.registerShutdownHook();
		
//		MemoTestView view = childContext.getBean(MemoTestView.class);
		MemoTestView view = context.getBean(MemoTestView.class);
		view.printMemoList();
		
//		MemoService service = new MemoService();
//		service.retrieveMemoList().forEach(System.out::println);
	}

}
