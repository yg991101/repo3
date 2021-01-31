package org.h7n9.spring.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
@Table(name = "case_info")
public class CaseInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer caseid;

	@Column
	// 姓名
	private String name;

	@Column
	// 性别
	private String gender;
	
	@Column
	// 年龄
	private String age;
	
	@Column
	// 地区
	private String area;
	
	@Column
	// 基础设施
	private Integer base;
	
	@Column
	// 防御流感管理体系
	private Integer management;
	
	@Column
	// 防御控制实施渠道
	private Integer channel;
	
	@Column
	// 主要防控人员的素质和经验
	private Integer experience;
	
	@Column
	// 防控结构合理性
	private Integer rationality;
	
	@Column
	// 国家和地方政府的资金投入
	private Integer fund;
	
	@Column
	// 防御机制的稳定性和前景分析
	private Integer analysis;
	
	@Column
	// 重大疫情防御情况
	private Integer defence;
	
	@Column
	// 危害等级
	private Integer sum;
	
	@Column
	// 症状
	private String symptom;

	@Column
	// 是否确证
	private int confirmation;

	@Column
	// 日期
	@Temporal(TemporalType.TIMESTAMP)
	private Date infodate;
	
	@Transient
	private String symptomString;

	public Integer getCaseid() {
		return caseid;
	}

	public void setCaseid(Integer caseid) {
		this.caseid = caseid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getSymptom() {
		return symptom;
	}

	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}

	public int getConfirmation() {
		return confirmation;
	}

	public void setConfirmation(int confirmation) {
		this.confirmation = confirmation;
	}

	public Date getInfodate() {
		return infodate;
	}

	public void setInfodate(Date infodate) {
		this.infodate = infodate;
	}

	public String getSymptomString() {
		return symptomString;
	}

	public void setSymptomString(String symptomString) {
		this.symptomString = symptomString;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public Integer getBase() {
		return base;
	}

	public void setBase(Integer base) {
		this.base = base;
	}

	public Integer getManagement() {
		return management;
	}

	public void setManagement(Integer management) {
		this.management = management;
	}

	public Integer getChannel() {
		return channel;
	}

	public void setChannel(Integer channel) {
		this.channel = channel;
	}

	public Integer getExperience() {
		return experience;
	}

	public void setExperience(Integer experience) {
		this.experience = experience;
	}

	public Integer getRationality() {
		return rationality;
	}

	public void setRationality(Integer rationality) {
		this.rationality = rationality;
	}

	public Integer getFund() {
		return fund;
	}

	public void setFund(Integer fund) {
		this.fund = fund;
	}

	public Integer getAnalysis() {
		return analysis;
	}

	public void setAnalysis(Integer analysis) {
		this.analysis = analysis;
	}

	public Integer getDefence() {
		return defence;
	}

	public void setDefence(Integer defence) {
		this.defence = defence;
	}

	public Integer getSum() {
		return sum;
	}

	public void setSum(Integer sum) {
		this.sum = sum;
	}

}
