package kr.or.ddit.prod.view.preparer;

import java.util.Arrays;
import java.util.List;
import java.util.Map;


import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;

import kr.or.ddit.vo.MenuVO;

public class ProdViewPreparer implements ViewPreparer {
	
	@Override
	public void execute(Request req, AttributeContext attrContext) {
		MenuVO menu1 = new MenuVO("상품 게시글 작성", "/prod/prodInsert.do");
		MenuVO menu2 = new MenuVO("상품 목록조회", "/prod");
		List<MenuVO> menuList = Arrays.asList(menu1, menu2);
		
		Map<String, Object> scope = req.getContext(Request.REQUEST_SCOPE);
		scope.put("menuList", menuList);
	}
	
}
