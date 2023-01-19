package kr.or.ddit.board.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.board.exception.AuthenticationException;
import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.validate.UpdateGroup;

@Controller
@RequestMapping("/board/boardUpdate.do")
public class BoardUpdateController {
	
	@Inject
	private BoardService service;
	
	@ModelAttribute
	private BoardVO board() {
		return new BoardVO();
	}
	
	@GetMapping
	public String updateForm(
		@RequestParam("what") int boNo
		, Model model
	) {
		BoardVO board = service.retrieveBoard(boNo);
		model.addAttribute("board", board);
		return "board/boardEdit";
	}
	
	@PostMapping
	public String boardUpdate(
		@Validated(UpdateGroup.class) @ModelAttribute("board") BoardVO board // command object
		, BindingResult errors
		, Model model
		, @RequestPart MultipartFile[] boFiles
	) {
		String viewName = null;
		if (!errors.hasErrors()) {
			try { // 경우의 수를 rowcnt로 잡거나, 예외발생으로 잡거나, try catch로 잡거나
				int rowcnt = service.modifyBoard(board);
				if (rowcnt > 0) {
					viewName = "redirect:/board/boardView.do?boNo=" + board.getBoNo();
				} else {
					model.addAttribute("message", "서버 오류, 쫌따 다시!");
					viewName = "board/boardEdit";
				}
			} catch (AuthenticationException e) {
				model.addAttribute("message", "비번 오류"); // tiles의 템플릿이 갖게 됨
				viewName = "board/boardEdit";
			}
		} else {
			viewName = "board/boardEdit";
		}

		return viewName;
	}
			

}
