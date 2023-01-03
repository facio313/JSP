package kr.or.ddit.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.mvc.annotation.resolvers.ModelAttribute;
import kr.or.ddit.mvc.annotation.resolvers.RequestParam;
import kr.or.ddit.mvc.annotation.sterotype.Controller;
import kr.or.ddit.mvc.annotation.sterotype.RequestMapping;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberListController {
	private MemberService service = new MemberServiceImpl();
	
	@RequestMapping("/member/memberList.do")
	public String memberList(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, @ModelAttribute SearchVO simpleCondition
		, HttpServletRequest req
	) { // resp 안 쓰는데...
		
//		SearchVO simpleCondition = new SearchVO(searchType, searchWord);
		
		PagingVO<MemberVO> pagingVO = new PagingVO<>(5, 5);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(simpleCondition);
		
		List<MemberVO> memberList = service.retrieveMemberList(pagingVO);
		req.setAttribute("pagingVO", pagingVO);
		
		log.info("paging data : {}", pagingVO);
		String viewName = "member/memberList";
		
		return viewName;
	}	
}