package kr.or.ddit.board.controller;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.validate.InsertGroup;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // 생성자 주입
@Controller
@RequestMapping("/board/boardInsert.do")
public class BoardInsertController {
	
	private final BoardService service; // Proxy는 구현체로 주입 안 됨, 인터페이스로 주입 받아야 함 // 서비스의 구현체를 하나밖에 안 만드는데 왜 인터페이스를 만드느냐?! AOP 같이 이런 것 때문에
	
	@PostConstruct
	public void init() { // service의 실체 확인
		log.info("주입된 service  객체 : {}", service.getClass().getName());
	}
	
	@ModelAttribute("board")
	public BoardVO board() {
		return new BoardVO();
	}
	
	@GetMapping
	public String boardForm() {
		return "board/boardForm";
	}
	
	@PostMapping
	public String boardInsert(
		Model model
		, @Validated(InsertGroup.class) @ModelAttribute("board") BoardVO board
		, Errors errors
		, @RequestPart MultipartFile[] boFiles
	) {
		String viewName = null;
		if (!errors.hasErrors()) {
			int rowcnt = service.createBoard(board);
			if (rowcnt > 0) {
				viewName = "redirect:/board/boardView.do?boNo=" + board.getBoNo();
			} else {
				model.addAttribute("message", "서버 오류, 쫌따 다시!");
				viewName = "board/boardForm";
			}
		} else {
			viewName = "board/boardForm";
		}

		return viewName;
	}
	
}
