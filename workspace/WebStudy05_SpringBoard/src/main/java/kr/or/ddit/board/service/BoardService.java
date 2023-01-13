package kr.or.ddit.board.service;

import kr.or.ddit.board.vo.AttachVO;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.vo.PagingVO;

public interface BoardService {
	public int createBoard(BoardVO board); // 이넘 없는 경우가 많음, 그때는 int 명확히 판단할 수 있도록
	/**
	 * Call by Reference를 통해 pagingVO에다가 BoardList를 받는다.
	 * @param pagingVO
	 */
	public void retrieveBoardList(PagingVO<BoardVO> pagingVO); // Map으로 받는 경우도 있고, Vo가 없는 경우도 있음, void인 경우는 call by reference
	/**
	 * @param boNo
	 * @return 존재여부(NotExistBoardException)
	 */
	public BoardVO retrieveBoard(int boNo); // 첨부파일(테이블 두 개 이상 조인해야 함) // 존재하지 않는다 예외구조 필요
	/**
	 * 게시글 수정
	 * @param board
	 * @return 존재여부(NotExistBoardException), 인증성공여부(AuthenticationException), rowcnt(정상적인 경우)
	 */
	public int modifyBoard(BoardVO board); // 인증구조 필요, 발생 경우의 수가 다양함, enum이 없다면 인증 실패 어떻게? => 예외 발생시키기
	/**
	 * 게시글 삭제
	 * @param boNo
	 * @return 존재여부(NotExistBoardException), 인증성공여부(AuthenticationException), rowcnt(정상적인 경우)
	 */
	public int removeBoard(int boNo);
	
	public AttachVO retrieveForDownload(int attNo); 
}