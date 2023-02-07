package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.vo.BoardVO;

public interface BoardService {


	public BoardVO retrieveBoard(String boardId);

	public List<BoardVO> retrieveBoardList();
}
