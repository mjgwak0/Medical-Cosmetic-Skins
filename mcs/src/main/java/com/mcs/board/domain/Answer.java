package com.mcs.board.domain;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.DynamicInsert;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
@Entity
@DynamicInsert
public class Answer {
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "a_seq")
	@SequenceGenerator(sequenceName = "answer_seq", allocationSize = 1, name = "a_seq")
	@Id
	private Integer answernum;
	private String company;
	private Integer boardnum;
	private String answer_id;
	
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private LocalDate answer_date;
	
	private String answer_cont;
	
	 @PrePersist
	    public void answer_date() {
	    	this.answer_date = LocalDate.now();
	 }
}