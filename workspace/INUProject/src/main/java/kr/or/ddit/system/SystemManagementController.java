package kr.or.ddit.system;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.company.service.CompanyService;
import kr.or.ddit.company.vo.CompanyVO;
import kr.or.ddit.expert.service.ExpertService;
import kr.or.ddit.expert.service.ExprodService;
import kr.or.ddit.expert.vo.ExpertVO;
import kr.or.ddit.expert.vo.ExprodVO;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.ui.PaginationRenderer;
import kr.or.ddit.vo.IncruiterVO;
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
 * 수정일                 수정자               수정내용
 * --------        --------    ----------------------
 * 2023. 2. 4.      박형준              최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/systemManagement")
public class SystemManagementController {
	@Resource(name="bootstrapPaginationRender")
	private PaginationRenderer renderer;
	
	@Inject
	private MemberService memberService;
	@Inject
	private CompanyService companyService;
	@Inject
	private ExprodService exprodService;
	@Inject
	private ExpertService expertService;
	
	//시스템 관리페이지
	@GetMapping
	public String system() {
		return "system/systemManagement";
	}
/*========================================================회원관리========================================================*/	
	//회원 목록
	@GetMapping("/memberList")
	public String memberProcess(
		Model model
	) {
		//일반
		List<MemberVO> seekerList = memberService.retrieveSkrList();
		model.addAttribute("seekerList", seekerList);
		
		//기업
		List<MemberVO> incruiterList = memberService.retrieveIncList();
		model.addAttribute("incruiterList", incruiterList);
		
		//전문가
		List<MemberVO> expertList = memberService.retrieveExpList();
		model.addAttribute("expertList", expertList);
		
		//차단
		List<MemberVO> cutList = memberService.retrieveCutList();
		model.addAttribute("cutList", cutList);
		
		//블랙리스트
		List<MemberVO> blackList = memberService.retrieveBlackList();
		model.addAttribute("blackList", blackList);
		
		//탈퇴
		List<MemberVO> delMemList = memberService.retrieveDelMemList();
		model.addAttribute("delMemList", delMemList);
		
		return "system/memberList";
	}
	
	//일반회원 목록
	@GetMapping("/memberList/seekerList")
	public String seekerProcess(
		Model model
	) {
		List<MemberVO> seekerList = memberService.retrieveSkrList();
		model.addAttribute("seekerList", seekerList);
		
		return "system/seekerList";
	}
	
	//기업회원 목록
	@GetMapping("/memberList/incruiterList")
	public String incruiterProcess(
		Model model
	) {
		List<MemberVO> incruiterList = memberService.retrieveIncList();
		model.addAttribute("incruiterList", incruiterList);
		return "system/incruiterList";
	}
	
	//전문가회원 목록
	@GetMapping("/memberList/expertList")
	public String expertProcess(
		Model model
	) {
		List<MemberVO> expertList = memberService.retrieveExpList();
		model.addAttribute("expertList", expertList);
		return "system/expertList";
	}
	
	
	//차단회원 목록
	@GetMapping("/memberList/cutList")
	public String cutProcess(
		Model model
	) {
		List<MemberVO> cutList = memberService.retrieveCutList();
		model.addAttribute("cutList",cutList);
		return "system/cutList";
	}
	
	//블랙리스트 목록
	@GetMapping("/memberList/blackList")
	public String blackProcess(
		Model model
	) {
		List<MemberVO> blackList = memberService.retrieveBlackList();
		model.addAttribute("blackList",blackList);
		return "system/blackList";
	}
	
	//탈퇴회원 목록
	@GetMapping("/memberList/delMemList")
	public String delMemProcess(
		Model model
	) {
		List<MemberVO> delMemList = memberService.retrieveDelMemList();
		model.addAttribute("delMemList", delMemList);
		return "system/delMemList";
	}

/*========================================================기업관리========================================================*/		
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
		return "system/companyList";
	}

	
/*========================================================승인관리========================================================*/		
	//승인 관리
	@GetMapping("/acceptManagement")
	public String acceptProcess(
		Model model
		, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
	) {
		PagingVO<ExprodVO> pagingVO = new PagingVO<>(20, 10);
		pagingVO.setCurrentPage(currentPage);
		exprodService.retrieveAppliProdList(pagingVO);
		
		List<MemberVO> incruiterList = memberService.retrieveIncruiterList();
		List<MemberVO> expertList = memberService.retrieveExpertList();
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("incruiterList", incruiterList);
		model.addAttribute("expertList", expertList);
		return "system/acceptManagement";
	}
	
	//총괄기업회원 신청목록
	@GetMapping("/acceptManagement/appliIncruiterList")
	public String generalIncruiterProcess(
		Model model
	) {
		List<MemberVO> incruiterList = memberService.retrieveIncruiterList();
		model.addAttribute("incruiterList", incruiterList);
		return "system/appliIncruiterList";
	}
	
	//총괄기업회원 신청세부
	@GetMapping("/acceptManagement/appliIncruiterList/{memId}")
	public String incruiterAppliView(
			@PathVariable String memId,
			Model model
	) {
		MemberVO incruiter = memberService.retrieveIncruiter(memId);
		model.addAttribute("incruiter", incruiter);
		return "system/incruiterView";
	}
	
	//총괄 승인
	@PostMapping("/acceptManagement/updateAcceptInc")
	public String updateAcceptInc(
		Model model
		, @ModelAttribute("incruiter") IncruiterVO incruiter
 	) {
		int inc = memberService.modifyAcceptInc(incruiter);
		int cmp = memberService.modifyAcceptCmp(incruiter);
		String viewName = null;
		if(inc * cmp > 0) {
			viewName = "redirect:/systemManagement/acceptManagement/appliIncruiterList";
		}else {
			model.addAttribute("message", "서버 오류");
			viewName = "system/appliIncruiterList";
		}
		return viewName;
	}
	
	//총괄 신청 삭제
	@PostMapping("/deleteAppli")
	public String deleteAppli(
		Model model
		, @ModelAttribute("memId") MemberVO memId
		, @ModelAttribute("cmpId") CompanyVO cmpId
	) {
		int inc = memberService.removeAppliInc(memId);
		int cmp = companyService.removeAppliCmp(cmpId);
		String viewName = null;
		if(inc * cmp > 0) {
			viewName = "redirect:/systemManagement/acceptManagement/appliIncruiterList";
		}else {
			model.addAttribute("message", "서버 오류");
			viewName = "system/incruiterView";
		}
		return viewName;
	}
	
	
	//신고 목록
	@GetMapping("/reportList")
	public String reportProcess() {
		return "system/reportList";
	}
	
	//전문가 신청 목록
	@GetMapping("/acceptManagement/appliExpertList")
	public String acceptExpert(
		Model model
	) {
		List<MemberVO> expertList = memberService.retrieveExpertList();
		model.addAttribute("expertList", expertList);
		return "system/appliExpertList";
	}
	
	//전문가 신청 세부
	@GetMapping("/acceptManagement/appliExpertList/{memId}")
	public String expertAppliView(
		Model model
		, @PathVariable String memId
	) {
		MemberVO expert = memberService.retrieveExpert(memId);
		model.addAttribute("expert", expert);
		return "system/expertView";
	}
	
	//전문가 승인
	@PostMapping("/acceptManagement/updateAcceptExp")
	public String acceptExp(
		Model model
		, @ModelAttribute("expert") MemberVO expert
	) {
		int expRole = memberService.modifyAcceptExpRole(expert);
		int exp = memberService.modifyAcceptExp(expert);
		String viewName = null; 
		if(expRole * exp > 0) {
			viewName = "redirect:/systemManagement/acceptManagement/appliExpertList";
		}else {
			model.addAttribute("message", "서버 오류");
			viewName = "system/appliExpertList";
		}
		return viewName;
	}
	
	//전문가 신청 삭제
	@PostMapping("/deleteAppliExp")
	public String deleteAppliExp(
		Model model
		, @ModelAttribute("memId") ExpertVO memId
	) {
		int exp = expertService.removeAppliExp(memId);
		String viewName = null;
		if(exp > 0) {
			viewName = "redirect:/systemManagement/acceptManagement/appliExpertList";
		}else {
			model.addAttribute("message", "서버 오류");
			viewName = "system/expertView";
		}
		return viewName;
	}
	
	
	//상품 신청 목록
	@GetMapping("/acceptManagement/appliProdList")
	public String prodList(
		Model model
		, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
	) {
		PagingVO<ExprodVO> pagingVO = new PagingVO<>(10, 10);
		pagingVO.setCurrentPage(currentPage);
		
		exprodService.retrieveAppliProdList(pagingVO);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "system/appliProdList";
	}
	
	//상품 신청 세부
	@GetMapping("/acceptManagement/appliprodList/{exprodId}")
	public String prodAppliView(
		Model model
		, @PathVariable String exprodId
	) {
		ExprodVO exprod = exprodService.retrieveAppliProd(exprodId);
		model.addAttribute("exprod",exprod);
		
		return "system/exprodView";
	}
	
	//상품 신청 승인
	@PostMapping("/acceptManagement/updateAcceptProd")
	public String acceptProd(
		@ModelAttribute("exprod") ExprodVO exprod
		, Model model
	) {
		int appliProd = exprodService.modifyAppliProd(exprod);
		String viewName = null;
		if(appliProd > 0) {
			viewName = "redirect:/systemManagement/acceptManagement/appliProdList";
		}else {
			model.addAttribute("message","서버 오류");
			viewName = "system/appliExprodList";
		}
		return viewName;
	}
	
	//상품 신청 반려
	@PostMapping("/deleteAppliProd")
	public String delteAppliProd(
		Model model
		, @ModelAttribute("exprodId") ExprodVO exprodId
	) {
		int prod = exprodService.removeAppliProd(exprodId);
		String viewName = null;
		if(prod>0) {
			viewName = "redirect:/systemManagement/acceptManagement/appliProdList";
		}else {
			model.addAttribute("message", "서버 오류");
			viewName = "system/exprodView";
		}
		return viewName;
	}
}

















