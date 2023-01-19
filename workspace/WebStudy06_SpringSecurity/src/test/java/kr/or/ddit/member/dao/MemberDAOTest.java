package kr.or.ddit.member.dao;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringRunner;

import kr.or.ddit.AbstractTestCase;
import kr.or.ddit.RootContextConfiguration;
import lombok.extern.slf4j.Slf4j;

@Slf4j
//@RunWith(SpringRunner.class) // 1. Junit Context 구성 // 메타 어노테이션으로 쓸 수 없는 녀석 // 그래서 추상 클래스 상속으로!
//@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/*-context.xml") // 2. 테스트용 가상 컨테이너 생성
//@WebAppConfiguration // optional(stand alone은 필요 없는 부분) 3. WebApplicationContext로 가상 컨테이너 생성
//@RootContextConfiguration
public class MemberDAOTest extends AbstractTestCase {
	
	@Inject
	private MemberDAO memberDAO;
	
	@Test
	public void test() {
		log.info("주입된 객체 : {}", memberDAO);
	}

}
