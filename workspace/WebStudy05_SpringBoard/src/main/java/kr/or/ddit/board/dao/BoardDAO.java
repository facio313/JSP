package kr.or.ddit.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.vo.PagingVO;

@Mapper
public interface BoardDAO {
	/**
	 * @param board
	 * @return 성공 시, 실패 시
	 */
	public int insertBoard(BoardVO board);
	/**
	 * 전체 게시판 글 목록을 가져오는 리스트이다.
	 * @param pagingVO
	 * @return paging처리된 BoardVO의 목록을 반환한다.
	 */
	public List<BoardVO> selectBoardList(PagingVO<BoardVO> pagingVO);
	/**
	 * 총 몇 줄이 있는지 셈한다.
	 * @param pagingVO
	 * @return paging처리를 위한 총 줄 수를 반환한다.
	 */
	public int selectTotalRecord(PagingVO<BoardVO> pagingVO);
	public BoardVO selectBoard(int boNo); // null 값 반환 경우의 수 고려!
	public void incrementHit(int boNo);
	public int updateBoard(BoardVO board);
	public int deleteBoard(int boNo);
}
