package com.kime.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name = "t_dict")
public class Dict {
	@Id
	@GeneratedValue(generator="assigned")
	@GenericGenerator(name = "assigned", strategy = "assigned")
	private String type;
	@Column
	private String key;
	@Column
	private String value;
	@Transient
	private String addFlag;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getAddFlag() {
		return addFlag;
	}
	public void setAddFlag(String addFlag) {
		this.addFlag = addFlag;
	}

	
	
}
