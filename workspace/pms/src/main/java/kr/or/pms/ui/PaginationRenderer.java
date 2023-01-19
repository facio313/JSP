package kr.or.pms.ui;

import kr.or.pms.vo.PagingVO;

public interface PaginationRenderer {
	public String renderPagination(PagingVO<?> pagingVO);
}
