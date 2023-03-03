package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.or.ddit.board.dao.BoardDAO;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author 작성자명
 * @since 2023. 3. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 3. 2.      작성자명       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Slf4j
@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;

	// 상세조회
	@Override
	public BoardVO retrieveBoard(String boardNo) {
		BoardVO board = dao.selectBoard(boardNo);
		if(board==null) {
			throw new UsernameNotFoundException(String.format(boardNo+"에 해당하는 게시글 없음."));
		}
		return board;
	}

	// 전체 조회(total), 메인(Main)
	@Override
	public void retrieveBoardList(PagingVO<BoardVO> pagingVO) {
		pagingVO.setTotalRecord(dao.selectTotalRecord(pagingVO));
		pagingVO.setDataList(dao.selectBoardList(pagingVO));
	}

	//지난 3일동안 조회수가 높았던 인기글 20개
	@Override
	public List<BoardVO> selectHotBoard() {
		return this.dao.selectHotBoard();
	}

	// 등록
	@Override
	public int createBoard(BoardVO board) {
		int rowcnt = dao.insertBoard(board);
		/*rowcnt += processAttatchList(board);*/
		return rowcnt;
	}

	// 수정
	@Override
	public int modifyBoard(BoardVO board) {
		int rowcnt = dao.updateBoard(board);
		return rowcnt;
	}

	// 삭제
	@Override
	public int removeBoard(BoardVO board) {
		int rowcnt = dao.deleteBoard(board);
		return rowcnt;
	}

	// 조회수
	@Override
	public int updateHits(String boardNo) {
		int rowcnt = dao.updateHits(boardNo);
		return rowcnt;
	}

	// 좋아요 추가
//	@Override
//	public int insertLike(Map<String, Object> m) throws Exception {
//		return dao.insertLike(m);
//	}

	// 좋아요 개수
	@Override
	public int likeCount(String boardNo) {
		return dao.likeCount(boardNo);
	}

	// 좋아요 on
	@Override
	public String likeOn(String boardNo, String memId) {
		return dao.likeOn(boardNo, memId);
	}

	@Override
	public int likeInsert(Map<String, Object> m) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

//	HOT 이번주 전체 인기 글
	@Override
	public List<BoardVO> hotBoard(){
		return dao.hotBoard();
	}

	// 댓글 수
	@Override
	public int updateReplyCnt(String boardNo) {
		return 0;
	}
}





















