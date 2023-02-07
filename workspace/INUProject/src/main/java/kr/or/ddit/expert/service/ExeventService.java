package kr.or.ddit.expert.service;

import kr.or.ddit.expert.vo.ExeventVO;
import kr.or.ddit.vo.AttachVO;

public interface ExeventService {
	
	public int createExevent(ExeventVO exevent);
	
	public AttachVO retrieveFordownload(String attId);
}
