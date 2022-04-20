package com.mcs.board.service;

import java.util.List;

import com.mcs.board.domain.Board;

public interface BoardService {

	List<Board> getBoardList(String userid);

	void insertBoard(Board board);

	void updateBoard(Board board);

	void deleteBoard(Integer boardnum);

	Board getBoard(Integer boardnum);

	List<Board> reBoardList(Integer pronum);

	Board management(Integer pronum);

	List<Board> anBoardList(Integer pronum);

	List<Board> findByPronum(int pronum);

	

	

	

	
	
	
}
