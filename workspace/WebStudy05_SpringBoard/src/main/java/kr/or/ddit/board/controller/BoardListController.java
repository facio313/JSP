package kr.or.ddit.board.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;
import lombok.extern.slf4j.Slf4j;

// /board/boardList.do (검색 조건 : 작성자, 글의 내용, 전체)

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardListController {
	
//	주입할 객체들 Inject해주기
	@Inject
	private BoardService service;
	
//	리스트를 보여줄 get방식의 메서드 작성
	@GetMapping("boardList.do")
	public String boardList(
//		페이지 처리를 위한 요청 페이지 파라미터
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage
//		검색 조건 처리를 위한 검색 조건 객체
		, @ModelAttribute("simpleCondition") SearchVO simpleCondition
//		모델을 담을 모델 객체
		, Model model
	) {
//		페이징 처리를 위해 페이징 객체를 만들어주고
		PagingVO<BoardVO> pagingVO = new PagingVO<>(5, 5);
//		현재 페이지 설정
		pagingVO.setCurrentPage(currentPage);
//		검색조건 설정
		pagingVO.setSimpleCondition(simpleCondition);
//		검색하기
		service.retrieveBoardList(pagingVO);
//		모델에 담아주고
		model.addAttribute("pagingVO", pagingVO);
		
		log.info("paging data : {}", pagingVO);
		
		return "board/boardList";
	}

}
