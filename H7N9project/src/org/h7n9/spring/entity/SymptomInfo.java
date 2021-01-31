package org.h7n9.spring.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "symptom_info")
public class SymptomInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer symptomid;
	
	@Column
	private String code;
	
	@Column
	private String name;
	
	@Column
	private String descriptions;
	
	@Transient
	private int all;
	
	@Transient
	private int confirm;
	
	@Transient
	private int unconfirm;

	public Integer getSymptomid() {
		return symptomid;
	}

	public void setSymptomid(Integer symptomid) {
		this.symptomid = symptomid;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}

	public int getAll() {
		return all;
	}

	public void setAll(int all) {
		this.all = all;
	}

	public int getConfirm() {
		return confirm;
	}

	public void setConfirm(int confirm) {
		this.confirm = confirm;
	}

	public int getUnconfirm() {
		return unconfirm;
	}

	public void setUnconfirm(int unconfirm) {
		this.unconfirm = unconfirm;
	}

}
