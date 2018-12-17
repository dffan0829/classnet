package com.classnet.dao;

import java.util.List;

import com.classnet.entity.UserEntity;

public interface UserDao extends IHibernateSupportDao<UserEntity>{

	public UserEntity getUser(String username);
	public List<UserEntity> getTeacher();
	
}
