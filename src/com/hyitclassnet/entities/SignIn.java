package com.hyitclassnet.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "signin", catalog = "classnet")
public class SignIn implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String rowguid;
	private Integer stuno;
	private String stuname;
	private Integer classno;
	private String classname;
	private Date time;
	private String address;

	@Id
	@GenericGenerator(name = "assigned", strategy = "auto")
	public String getRowguid() {
		return rowguid;
	}

	public void setRowguid(String rowguid) {
		this.rowguid = rowguid;
	}

	@Column(name = "stuno", nullable = false)
	public Integer getStuno() {
		return stuno;
	}

	public void setStuno(Integer stuno) {
		this.stuno = stuno;
	}

	@Column(name = "stuname", nullable = false)
	public String getStuname() {
		return stuname;
	}

	public void setStuname(String stuname) {
		this.stuname = stuname;
	}

	@Column(name = "classno", nullable = false)
	public Integer getClassno() {
		return classno;
	}

	public void setClassno(Integer classno) {
		this.classno = classno;
	}

	@Column(name = "classname", nullable = false)
	public String getClassname() {
		return classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}

	@Column(name = "time", nullable = false)
	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
}
