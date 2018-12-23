package com.hyitclassnet.dao.impl;

import java.util.List;
import java.util.UUID;

import com.classnet.dao.impl.HibernateSupportDao;
import com.classnet.entity.UserEntity;
import com.hyitclassnet.dao.StudentDao;
import com.hyitclassnet.entities.StudentInfoEntities;

public class StudentDaoImpl extends HibernateSupportDao<StudentInfoEntities> implements StudentDao{

	@Override
	public boolean exportStuInfo(List<StudentInfoEntities> list) {
		for (StudentInfoEntities studentInfoEntities : list) {
			String rowguid = UUID.randomUUID().toString();
			studentInfoEntities.setRowguid(rowguid);
			
			//同时保存在登录用户表中
			UserEntity userEntity = new UserEntity();
			userEntity.setUsername(String.valueOf(studentInfoEntities.getStuNo()));
			userEntity.setPassword("1234");
			userEntity.setAuthorite("ROLE_USER");
			userEntity.setEnable(true);
			userEntity.setEmail(studentInfoEntities.getEmail());
			userEntity.setPhoneNumber(studentInfoEntities.getStuTel());
			userEntity.setRealName(studentInfoEntities.getStuName());
			//设置的是导入的学生表的主键
			userEntity.setFkid(rowguid);
			
			sessionFactory.getCurrentSession().save(userEntity);
			sessionFactory.getCurrentSession().save(studentInfoEntities);
		}
		return false;
	}
 
}
