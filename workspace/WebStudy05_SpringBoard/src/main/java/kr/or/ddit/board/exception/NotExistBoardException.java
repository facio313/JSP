package kr.or.ddit.board.exception;

public class NotExistBoardException extends RuntimeException { // unchecked

	public NotExistBoardException(int boNo) {
		super(String.format("%d번의 글은 존재하지 않습니다.", boNo));
	}
}
