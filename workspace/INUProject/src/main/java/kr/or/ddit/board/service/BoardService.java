package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.InterviewVO;

public interface BoardService {


	public BoardVO retrieveBoard(String boardNo);

	public List<BoardVO> retrieveBoardList();

	public int createBoard(BoardVO board);

	public int modifyBoard(BoardVO board);

	public int removeBoard(BoardVO board);
}
