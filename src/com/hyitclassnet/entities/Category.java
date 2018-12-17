package com.hyitclassnet.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="category",catalog="classnet")
public class Category implements Serializable{

	private String rowGuid;
	private Integer categoryId;
	private String categoryName;
	private String categoryType;
	private Integer parentId;
	private Integer categoryOrder;//排序号
	
	@Id
	@GeneratedValue
	public String getRowGuid() {
		return rowGuid;
	}
	public void setRowGuid(String rowGuid) {
		this.rowGuid = rowGuid;
	}
	
	@Column(name="categoryid",length=11,nullable=false)
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	
	@Column(name="categoryname",length=50,nullable=false)
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	@Column(name="categorytype",length=10,nullable=false)
	public String getCategoryType() {
		return categoryType;
	}
	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}
	@Column(name="parentid",length=11,nullable=false)
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	@Column(name="categoryorder",length=11,nullable=false)
	public Integer getCategoryOrder() {
		return categoryOrder;
	}
	public void setCategoryOrder(Integer categoryOrder) {
		this.categoryOrder = categoryOrder;
	}




	
	
	
	
	
	 
}
