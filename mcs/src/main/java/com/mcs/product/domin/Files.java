package com.mcs.product.domin;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import lombok.Data;

@Data
@Entity
public class Files {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "f_seq")
    @SequenceGenerator(sequenceName = "file_seq", allocationSize = 1, name = "f_seq")
	Integer filenum;
	
	String file_name; //서버파일이름
	String fileoriname; //원본파일이름
	String file_url; //파일저장경로
	
	
}
