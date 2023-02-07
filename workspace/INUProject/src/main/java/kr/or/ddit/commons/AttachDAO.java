package kr.or.ddit.commons;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.AttachVO;

@Mapper
public interface AttachDAO {
	public <T extends AttachVO>int insertAttatches(T vo);
	public List<AttachVO> selectAttatchList(String attId);
	public AttachVO selectAttatch(int attNo);
	public <T extends AttachVO>int deleteAttatchs(T vo);
	public <T extends AttachVO>int updateAttatch(T vo);
}
