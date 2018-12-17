package com.hyitclassnet.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="content",catalog="classnet")
public class Content implements Serializable{

	private String rowGuid;
	private Integer contentId;
	private Integer categoryId; 
	private String contentTitle;
	private String content;
	private Date addTime;
	
	@Id
	@GeneratedValue
	public String getRowGuid() {
		return rowGuid;
	}
	public void setRowGuid(String rowGuid) {
		this.rowGuid = rowGuid;
	}
	@Column(name="contenttitle",nullable=false)
	public String getContentTitle() {
		return contentTitle;
	}
	public void setContentTitle(String contentTitle) {
		this.contentTitle = contentTitle;
	}
	@Column(name="content",nullable=false)
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Column(name="addtime",nullable=false)
	public Date getAddTime() {
		return addTime;
	}
	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	@Column(name="contentid",nullable=false)
	public Integer getContentId() {
		return contentId;
	}
	public void setContentId(Integer contentId) {
		this.contentId = contentId;
	}
	@Column(name="categoryid",nullable=false)
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	
	 
	
	 
}
