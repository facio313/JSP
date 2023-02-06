package kr.or.ddit.lab.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.lab.dao.NewsDAO;
import kr.or.ddit.lab.vo.NewsVO;
import kr.or.ddit.vo.PagingVO;

@Service
public class NewsServiceImpl implements NewsService {
	
	@Inject
	private NewsDAO NewsDAO;
	
	@Override
	public void retrieveNewsList(PagingVO<NewsVO> pagingVO) {
		pagingVO.setTotalRecord(NewsDAO.selectTotalRecord(pagingVO));
		pagingVO.setDataList(NewsDAO.selectBoardList(pagingVO));
	}
	
	

}
