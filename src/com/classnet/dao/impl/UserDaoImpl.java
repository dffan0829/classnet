package com.classnet.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.classnet.dao.UserDao;
import com.classnet.entity.UserEntity;

public class UserDaoImpl extends HibernateSupportDao<UserEntity> implements UserDao{

	public UserEntity getUser(String username){
		try{
			String sql = "from UserEntity where username=:username";
			Query q = getSessionFactory().getCurrentSession().createQuery(sql);
			q.setParameter("username", username);
			return (UserEntity)q.setMaxResults(1).uniqueResult();
		}catch(RuntimeException e){
			throw e;
		}
	}
	@SuppressWarnings("unchecked")
	public List<UserEntity> getTeacher(){
		try{
			String sql = "select * from user_table where authorite = 'ROLE_TEACHER'";
			Query q = getSessionFactory().getCurrentSession().createSQLQuery(sql);
			System.out.println(q.list());
			return q.list();
		}catch(RuntimeException e){
			throw e;
		}
	}
	
}
