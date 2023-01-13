package kr.or.ddit.board.service;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.board.dao.BoardDAO;
import kr.or.ddit.board.vo.AttachVO;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;
	
	@PostConstruct
	private void init() {
		log.info("주입된 객체 : {}", boardDAO);
	}
	
	@Override
	public int createBoard(BoardVO board) {

		return 0;
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

		return null;
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
