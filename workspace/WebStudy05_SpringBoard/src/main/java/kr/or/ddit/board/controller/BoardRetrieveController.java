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

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardRetrieveController {
	
	@Inject
	private BoardService service;
	
	@GetMapping("boardList.do")
	public String boardList(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, @ModelAttribute("simpleCondition") SearchVO simpleCondition
		, Model model
	) {
		PagingVO<BoardVO> pagingVO = new PagingVO<>(5, 5);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleCondition(simpleCondition);
		service.retrieveBoardList(pagingVO);
		model.addAttribute("pagingVO", pagingVO);
		
		log.info("paging data : {}", pagingVO);
		
		return "board/boardList";
	}
	
	@GetMapping("boardView.do")
	public String boardView(
		@RequestParam("boNo") int boNo
		, Model model
	) {
		BoardVO board = service.retrieveBoard(boNo);
		model.addAttribute("board", board);
		return "board/boardView";
	}

}
