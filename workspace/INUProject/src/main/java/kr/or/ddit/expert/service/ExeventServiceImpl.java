package kr.or.ddit.expert.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.or.ddit.expert.dao.AttachDAO;
import kr.or.ddit.expert.dao.ExeventDAO;
import kr.or.ddit.expert.vo.ExeventVO;
import kr.or.ddit.vo.AttachVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ExeventServiceImpl implements ExeventService {

	@Inject
	private AttachDAO attachDAO;
	@Inject
	private ExeventDAO exeventDAO;
	
	
	@Value("#{appInfo.saveFiles}")
	private File saveFiles;

	@PostConstruct
	public void init() throws IOException {
		log.info("EL로 주입된 첨부파일 저장 경로 : {}", saveFiles.getCanonicalPath());
	}

	private int processAttatchList(ExeventVO exevent) {
		List<AttachVO> attatchList = exevent.getAttatchList();
		if (attatchList == null || attatchList.isEmpty())
			return 0;
		// 1. metadata 저장 - DB (ATTATCH)
		int rowcnt = attachDAO.insertAttatches(exevent);
		// 2. binary 저장 - Middle Tier : (D:\saveFiles)
		try {
			for (AttachVO attatch : attatchList) {
//				if(1==1) 
//					throw new RuntimeException("강제 발생 예외");
				
				attatch.saveTo(saveFiles);
			}
			return rowcnt;
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}	
	@Override
	public int createExevent(ExeventVO exevent) {
		int rowcnt = exeventDAO.insertExevent(exevent);
		
		rowcnt += processAttatchList(exevent);
		
		return rowcnt;
	}

	@Override
	public AttachVO retrieveFordownload(String attId) {
		// TODO Auto-generated method stub
		return null;
	}

}
