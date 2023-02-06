package kr.or.ddit.lab.dao;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.lab.vo.NewsVO;
import kr.or.ddit.vo.PagingVO;

@Mapper
public interface NewsDAO {

	public List<NewsVO> selectBoardList(PagingVO<NewsVO> pagingVO);
	
	public int selectTotalRecord(PagingVO<NewsVO> pagingVO);
}
