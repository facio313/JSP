package kr.or.ddit.resume.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.AttachVO;

@Mapper
public interface KSAttachDAO {
	public int insertAttaches(Object vo);
	public List<AttachVO> selectAttachList(int sn);
	public AttachVO selectAttach(int attNo);
	public int deleteAttaches(Object vo);
	
}