package kr.or.ddit.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.board.vo.AttachVO;
import kr.or.ddit.board.vo.BoardVO;

@Mapper
public interface AttachDAO {
	public int insertattaches(BoardVO board);
	public List<AttachVO> selectattachList(int boNo);
	public AttachVO selectattach(int attNo);
	public int deleteattaches(BoardVO board);
}
