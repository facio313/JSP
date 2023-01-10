package kr.or.ddit.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.dao.SampleDAO;

@Service
public class SampleService {
	private SampleDAO dao;
	
	// 생성자가 하나밖에 없으면 알아서 컨테이너가 주입을 해줌
	@Inject
	public SampleService(SampleDAO dao) {
		super();
		this.dao = dao;
	}
	
	public String retrieveInfo() {
		return "Info " + dao.selectData();
	}
}
