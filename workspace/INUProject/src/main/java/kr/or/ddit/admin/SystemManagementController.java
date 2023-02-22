package kr.or.ddit.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.company.service.CompanyService;
import kr.or.ddit.company.vo.CompanyVO;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;

/**
 * 
 * @author 박형준
 * @since 2023. 2. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 4.      박형준       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/systemManagement")
public class SystemManagementController {

	@Inject
	private MemberService memberService;
	@Inject
	private CompanyService companyService;
	
	//시스템 관리페이지
	@GetMapping
	public String system() {
		return "admin/systemManagement";
	}
	
	//회원 목록
	@GetMapping("/memberList")
	public String memberProcess(
		Model model
		, @RequestParam(value="memAuthCd", required=false, defaultValue="ROLE_SEEKER") String memAuthCd
	) {
		MemberVO list = new MemberVO();
		list.setMemAuthCd(memAuthCd);
		List<MemberVO> authMemberList = memberService.retrieveAuthMemberList(list);
		model.addAttribute("authMemberList", authMemberList);
		return "admin/memberList";
	}
	
	//기업 목록
	@GetMapping("/companyList")
	public String companyProcess(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, @ModelAttribute("simpleCondition") SearchVO searchVO
		, Model model
	) {
		PagingVO<CompanyVO> pagingVO = new PagingVO<>(20, 10);
		pagingVO.setCurrentPage(currentPage); //현재페이지
		pagingVO.setSimpleCondition(searchVO); // 검색 키워드
		
		companyService.retrieveCompanyList(pagingVO);
		
		model.addAttribute("pagingVO", pagingVO);
		return "admin/companyList";
	}
	
	//승인 관리
	@GetMapping("/acceptManagement")
	public String acceptProcess() {
		return "admin/acceptManagement";
	}
	
	//총괄기업회원 신청목록
	@GetMapping("/acceptManagement/acceptGeneralIncruiterList")
	public String generalIncruiterProcess() {
		return "admin/acceptGeneralIncruiterList";
	}
	
	//차단회원 목록
	@GetMapping("/cutList")
	public String cutProcess(
		Model model
	) {
		List<MemberVO> cutList = memberService.retrieveCutList();
		model.addAttribute("cutList",cutList);
		return "admin/cutList";
	}
	
	//블랙리스트 목록
	@GetMapping("/blackList")
	public String blackProcess(
		Model model
	) {
		List<MemberVO> blackList = memberService.retrieveBlackList();
		model.addAttribute("blackList",blackList);
		return "admin/blackList";
	}
	
	//신고 목록
	@GetMapping("/reportList")
	public String reportProcess() {
		return "admin/reportList";
	}
	
}








