package kr.or.ddit.board.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.board.service.ReplyService;
import kr.or.ddit.board.vo.ReplyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reply/*")
public class ReplyController {

	@Inject
	private ReplyService service;

	// 댓글 조회

	// 댓글 작성
	@PostMapping("/replyInsert")
	public String writeReply(@ModelAttribute ReplyVO reply) throws Exception{
		//reply : ReplyVO(replyNo=null, boardNo=BOD000074, memId=lcr0000, replyDate=null)
		log.info("reply : " + reply);

		service.createReply(reply);
		return "redirect:/board/boardDetail?boardNo=" + reply.getBoardNo();
	}

	// 댓글 수정

	// 댓글 삭제
}
