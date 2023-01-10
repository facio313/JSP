package kr.or.ddit.sample.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.ddit.sample.service.SampleService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SampleController {
//	@Autowired
//	@Inject // 여기다 놔도 spring(reflection을 정교히 사용함)이 private을 public으로 강제로 바꾸고 주입을 시킴
	private SampleService service;
	
	@Inject // POJO를 위해...이식성이 높음...
	public void setService(SampleService service) {
		this.service = service;
		log.info("주입된 service : {}", service);
	}
}
