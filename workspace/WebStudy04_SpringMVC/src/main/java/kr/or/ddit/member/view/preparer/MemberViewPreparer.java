package kr.or.ddit.member.view.preparer;

import java.util.Arrays;
import java.util.List;
import java.util.Map;


import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;

import kr.or.ddit.vo.MenuVO;

public class MemberViewPreparer implements ViewPreparer {
	
	@Override
	public void execute(Request req, AttributeContext attrContext) {
		MenuVO menu1 = new MenuVO("회원 목록 조회", "/member/memberList.do");
		MenuVO menu2 = new MenuVO("회원 추가", "/member/memberInsert.do");
		List<MenuVO> menuList = Arrays.asList(menu1, menu2);
		
		Map<String, Object> scope = req.getContext(Request.REQUEST_SCOPE);
		scope.put("menuList", menuList);
	}
	
}
