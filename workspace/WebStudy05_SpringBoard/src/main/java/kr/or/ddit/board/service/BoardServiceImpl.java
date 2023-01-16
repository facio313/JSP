package kr.or.ddit.board.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.board.dao.AttachDAO;
import kr.or.ddit.board.dao.BoardDAO;
import kr.or.ddit.board.exception.NotExistBoardException;
import kr.or.ddit.board.vo.AttachVO;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;
	
	@Inject
	private AttachDAO attachDAO;
	
	@Inject
	private PasswordEncoder encoder;
	
	@Value("#{appInfo.saveFiles}")
	private File saveFiles; // propertyEditor가 자동으로 File객체로 만들어줌
	
	@PostConstruct
	private void init() throws IOException {
		log.info("EL로 주입된 첨부파일 저장 경로 : {}", saveFiles.getCanonicalPath());
	}
	
	private int processAttachList(BoardVO board) {
		List<AttachVO> attachList = board.getAttachList();
		if (attachList == null || attachList.isEmpty()) return 0;
		// 1. metadata 저장 -DB(DB는 RollBack이라는 기능이 있으니)
		int rowcnt = attachDAO.insertAttaches(board); // 잘 기억하기
		// 2. binary 저장 - Middle Ties) D:/saveFiles -> appIndo.properties
		try {
			for (AttachVO attach : attachList) {
				if (1==1) throw new RuntimeException("강제 발생 예외");
				attach.saveTo(saveFiles);
			}
			return rowcnt;
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		
	}
	
	@Transactional
	@Override
	public int createBoard(BoardVO board) {
		String plain = board.getBoPass();
		String encoded = encoder.encode(plain);
		board.setBoPass(encoded);
		
		int rowcnt = boardDAO.insertBoard(board);
		// 첨부 파일 등록
		rowcnt += processAttachList(board);
		return rowcnt;
	}

	@Override
	public void retrieveBoardList(PagingVO<BoardVO> pagingVO) {
////		세션 열어서 리스트 가져오고
//		pagingVO.setTotalRecord(boardDAO.selectTotalRecord(pagingVO));
////		가져온 거 pagingVO에 담아서
//		List<BoardVO> boardList = boardDAO.selectBoardList(pagingVO);
////		void이니까 call by reference
//		pagingVO.setDataList(boardList);
		pagingVO.setTotalRecord(boardDAO.selectTotalRecord(pagingVO));
		pagingVO.setDataList(boardDAO.selectBoardList(pagingVO));
	}

	@Override
	public BoardVO retrieveBoard(int boNo) {
		BoardVO board = boardDAO.selectBoard(boNo);
		if (board == null) throw new NotExistBoardException(boNo);
		boardDAO.incrementHit(boNo);
		return board;
	}

	@Override
	public int modifyBoard(BoardVO board) {

		return 0;
	}

	@Override
	public int removeBoard(int boNo) {

		return 0;
	}

	@Override
	public AttachVO retrieveForDownload(int attNo) {

		return null;
	}

}
