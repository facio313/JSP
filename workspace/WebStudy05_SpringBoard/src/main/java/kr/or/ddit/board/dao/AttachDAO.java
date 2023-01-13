package kr.or.ddit.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.board.vo.AttachVO;
import kr.or.ddit.board.vo.BoardVO;

@Mapper
public interface AttachDAO {
	public int insertAttaches(BoardVO board);
	public List<AttachVO> selectAttachList(int boNo);
	public AttachVO selectAttach(int attNo); // 하나 하나 다운로드 하게 해주기 위해서
	public int deleteAttaches(BoardVO board); // rawcount = delAttNos.length
}