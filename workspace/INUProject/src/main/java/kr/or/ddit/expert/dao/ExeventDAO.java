package kr.or.ddit.expert.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.expert.vo.ExeventVO;

@Mapper
public interface ExeventDAO {
	public int insertExevent(ExeventVO exevent); 
	
}
