package kr.or.ddit.board.service;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.ddit.board.dao.AttachDAO;
import kr.or.ddit.board.dao.BoardDAO;
import kr.or.ddit.board.exception.AuthenticationException;
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
//				if (1==1) throw new RuntimeException("강제 발생 예외");
				attach.saveTo(saveFiles);
			}
			return rowcnt;
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	// 원래 트랜잭션을 관리하기 위한 SqlSession, SqlSessionFactory가 없음
	// @Transactional 하나로 트랜잭션을 관리하게 되는 것.
	// 어노테이션을 선언했다고 해서 선언적 프로그래밍이라고 함. 기저에 깔린 것이 AOP
//	@Transactional 
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
		BoardVO savedBoard = boardDAO.selectBoard(board.getBoNo());
		if (savedBoard == null) throw new NotExistBoardException(board.getBoNo());
		
		boardAuthenticate(board.getBoPass(), savedBoard.getBoPass());
//		1. board update
//		board.setBoPass(savedBoard.getBoPass());
		int rowcnt = boardDAO.updateBoard(board);
//		2. new attach insert (metadata, binary)
		rowcnt += processAttachList(board);
		int[] delAttNos = board.getDelAttNos();
		if (delAttNos != null && delAttNos.length > 0) {
			Arrays.sort(delAttNos); // 배열 정리, 이진 탐색 구조
//		3. delete attach (metadata, binary)
			rowcnt += attachDAO.deleteAttaches(board);
			String[] delAttSavenames = savedBoard.getAttachList().stream()
								.filter(attach -> {
									return Arrays.binarySearch(delAttNos, attach.getAttNo()) >= 0; // 없는 거 빼고 남음
//								}).map(attach -> attach.getAttSavename) // 바디가 하나라 밑에처럼 가능
								}).map(AttachVO::getAttSavename)
								.toArray(String[]::new);
			for (String saveName : delAttSavenames) {
				FileUtils.deleteQuietly(new File(saveFiles, saveName));
			}
		}

		return rowcnt;
	}

	private void boardAuthenticate(String input, String savedPass) {
		if (!encoder.matches(input, savedPass)) throw new AuthenticationException("비밀번호 인증 실패"); // 단방향 암호화(원래껄 인코딩해서 비교해야 함)
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
