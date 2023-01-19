package kr.or.ddit.mybatis;

import static org.junit.Assert.*;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringRunner.class) // 1단계 spring과 junit 연동 구조
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/datasource-context.xml") // 2단계 가상의 컨테이너 생성
@WebAppConfiguration // 3단계 웹용!
public class DataSourceTest {
	
	@Inject
	private DataSource dataSource;
	
	@Test
	public void test() {
		log.info("주입된 DataSource : {}", dataSource);
	}

}
