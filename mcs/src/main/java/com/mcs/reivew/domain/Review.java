package com.mcs.reivew.domain;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
@Entity
public class Review {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "review_seq")
    @SequenceGenerator(sequenceName = "reviewnum_seq", allocationSize = 1, name = "review_seq")
	private Integer reviewnum;
	private String userid;
	private Integer pronum;
	private Integer ratings;
	private String review_cont;
	
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private LocalDate review_date;
	@PrePersist
	public void review_date() {
		this.review_date = LocalDate.now();
	}
}
