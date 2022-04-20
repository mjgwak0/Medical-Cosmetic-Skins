package com.mcs.board.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mcs.board.domain.Board;
	
public interface BoardRepository extends JpaRepository<Board, Integer> {

	List<Board> findByUserid(String userid);

	Board findByBoardnum(Integer boardnum);

	void deleteByBoardnum(Integer boardnum);

	List<Board> findByPronum(Integer pronum);
	






	

}
