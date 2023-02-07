package kr.or.ddit.expert.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.AttachVO;

@Mapper
public interface AttachDAO {
	public <T>int insertAttatches(T vo);
	public List<AttachVO> selectAttatchList(String attId);
	public AttachVO selectAttatch(int attNo);
	public <T>int deleteAttatchs(T vo);
	public <T>int updateAttatch(T vo);
}
