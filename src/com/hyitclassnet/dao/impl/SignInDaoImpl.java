package com.hyitclassnet.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.SQLQuery;

import com.classnet.dao.impl.HibernateSupportDao;
import com.hyitclassnet.dao.SignInDao;
import com.hyitclassnet.entities.SignIn;

public class SignInDaoImpl extends HibernateSupportDao<SignIn> implements SignInDao{

	@Override
	public boolean duplicateSignIn(Integer stuno) {
		String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String sql = "select * from signin where stuno=:stuno and time like '%"+date+"%'";
		SQLQuery q = sessionFactory.getCurrentSession().createSQLQuery(sql);
		q.setParameter("stuno", stuno);
		List l = q.list();
		if(l.size() >= 1){
			return true;
		}
		return false;
	}
}
