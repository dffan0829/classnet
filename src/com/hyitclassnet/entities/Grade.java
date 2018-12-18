package com.hyitclassnet.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

//班级实体类
@Entity
@Table(name = "grade", catalog = "classnet")
public class Grade {
	private String rowGuid;
	private Integer classId;
	private String className;
	private Integer classNum;
	private Integer teacherId;

	@Id
	public String getRowGuid() {
		return rowGuid;
	}

	public void setRowGuid(String rowGuid) {
		this.rowGuid = rowGuid;
	}
	
	@Column(name = "teacherid", nullable = false)
	public Integer getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	@Column(name = "classid", nullable = false)
	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	@Column(name = "classname", nullable = false)
	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	@Column(name = "classnum", nullable = false)
	public Integer getClassNum() {
		return classNum;
	}

	public void setClassNum(Integer classNum) {
		this.classNum = classNum;
	}

}
