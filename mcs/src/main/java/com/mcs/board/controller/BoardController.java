package com.mcs.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mcs.board.domain.Board;
import com.mcs.board.service.BoardService;
import com.mcs.member.domain.Member;

@Controller // 컨트롤러라고 선언함
public class BoardController {

    @Autowired
    private BoardService boardService; //서비스와 연결

	//문의글 등록 화면
	@GetMapping("/board/insertBoard")
	public String insertBoardView(@AuthenticationPrincipal Member member, Model model, @RequestParam(value="pronum",required = false ) Integer pronum) {
		Board board = new Board();
		board.setUserid(member.getUserid());
		board.setBoard_name(member.getName());
		board.setPronum(pronum);
		model.addAttribute("member",board);
		return "/board/insertBoard";
	}
	
	//문의글 저장
	@PostMapping("/board/productInfo")
	public String insertBoard(Board board) {
			boardService.insertBoard(board);		
		return "redirect:/productInfo?pronum=" + board.getPronum();	
	}
	
		
	//문의글 수정 화면
	@GetMapping("/board/getBoard")
	public String getBoardView(@AuthenticationPrincipal Member member, Model model,
			@RequestParam("boardnum") Integer boardnum) {
		Board board = boardService.getBoard(boardnum);
		model.addAttribute("board", board);
		return "/board/getBoard";
	}

	//문의글 수정
	@PostMapping("/board/updateBoard")
	public String updateBoard(@ModelAttribute("board") Board board) {
		board.setBoard_title(board.getBoard_title());
		board.setBoard_content(board.getBoard_content());
		boardService.updateBoard(board);
		return "redirect:/mypage/memberBoard";
	}

	//문의글 삭제
	@Transactional
	@GetMapping("/board/deleteBoard")
	public String deleteBoard(@RequestParam("boardnum") Integer boardnum) {
		boardService.deleteBoard(boardnum);
		return "redirect:/mypage/memberBoard";
	}

	// 관리자 답변 게시판
	@RequestMapping("/management")
	public String answerBoard(@RequestParam(value = "pronum", required = false) Integer pronum, Model model) {
		Board management = boardService.management(pronum);
		List<Board> boardList = boardService.anBoardList(pronum);
		model.addAttribute("board", management);
		model.addAttribute("boardList", boardList);
		return "/enterprise/management";
	}
	     
	     
}
	     
	    

	        
	 

