package com.mcs.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mcs.board.domain.Board;
import com.mcs.board.repository.AnswerRepository;
import com.mcs.board.repository.BoardRepository;


@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardRepository boardRepo;
	@Autowired
	private AnswerRepository answerRepo;
	
	public List<Board> getBoardList(String userid) {
		return boardRepo.findByUserid(userid);
	}
	
	public void insertBoard(Board board) {
		boardRepo.save(board);
	}
	@Override
	public Board getBoard(Integer boardnum) {	
		return boardRepo.findByBoardnum(boardnum);
	}
	
	public void updateBoard(Board board) {
		boardRepo.save(board);
		
	}
	
	public void deleteBoard(Integer boardnum) {
		boardRepo.deleteByBoardnum(boardnum);
	}

	@Override
	public List<Board> reBoardList(Integer pronum) {
		return boardRepo.findByPronum(pronum);
	}

	@Override
	public List<Board> anBoardList(Integer pronum) {
		
		return boardRepo.findByPronum(pronum);
	}

	@Override
	public Board management(Integer pronum) {
		
		return boardRepo.findByBoardnum(pronum);
	}

	@Override
	public List<Board> findByPronum(int pronum) {
		return boardRepo.findByPronum(pronum);
	}
	
	
	

	
	
}
