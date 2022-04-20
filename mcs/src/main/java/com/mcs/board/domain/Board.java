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
public class Board {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "b_seq")
    @SequenceGenerator(sequenceName = "board_seq", allocationSize = 1, name = "b_seq")
    private Integer boardnum;
    private String userid;
    private Integer pronum;
    private String detailnum;
    private String board_type;
    private String board_title;
    private String board_content;
    
    @DateTimeFormat(pattern = "yyyy-mm-dd")
    private LocalDate logtime;
    
    private String board_name;
    private String board_state;

    @PrePersist
    public void logtime() {
    	this.logtime = LocalDate.now();
    }
}
