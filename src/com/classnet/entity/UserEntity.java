package com.classnet.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="user_table",catalog="classnet")
public class UserEntity implements Serializable{

	private Integer id;
	private String username;
	private String password;
	private String email;
	private boolean enable=true;
	private String authorite; //ROLE_USER,ROLE_SUPERVISOR
	private String phoneNumber;
	private String realName;
	private String fkid;
	
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name="username",length=50,nullable=false)
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Column(name="password",length=50,nullable=false)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Column(name="email",length=50,nullable=false)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Column(name="enable")
	public boolean isEnable() {
		return enable;
	}
	public void setEnable(boolean enable) {
		this.enable = enable;
	}
	@Column(name="authorite",length=50,nullable=false)
	public String getAuthorite() {
		return authorite;
	}
	public void setAuthorite(String authorite) {
		this.authorite = authorite;
	}
	@Column(name="phonenumber",length=11,nullable=false)
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	@Column(name="realname",length=50,nullable=false)
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	@Column(name="fkid",nullable=true)
	public String getFkid() {
		return fkid;
	}
	public void setFkid(String fkid) {
		this.fkid = fkid;
	}
}
