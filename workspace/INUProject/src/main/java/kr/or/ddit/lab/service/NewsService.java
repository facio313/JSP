package kr.or.ddit.lab.service;

import kr.or.ddit.lab.vo.NewsVO;
import kr.or.ddit.vo.PagingVO;

public interface NewsService {

	public void retrieveNewsList(PagingVO<NewsVO> pagingVO);
	
}
