package com.hyitclassnet.dao.impl;

import org.hibernate.SQLQuery;

import com.classnet.dao.impl.HibernateSupportDao;
import com.hyitclassnet.dao.ContentDao;
import com.hyitclassnet.entities.Content;

public class ContentDaoImpl extends HibernateSupportDao<Content> implements ContentDao{

	public void delete(int id){
		try{
			String sql = "delete from clazz_menu where parentId=:parentId";
			SQLQuery q = sessionFactory.getCurrentSession().createSQLQuery(sql);
			q.setParameter("parentId", id);
			q.executeUpdate();
			
			String sql1 = "delete from clazz_menu where id=:id";
			SQLQuery q1 = sessionFactory.getCurrentSession().createSQLQuery(sql1);
			q1.setParameter("id", id);
			q1.executeUpdate();
			
		}catch(Exception e){
			throw new RuntimeException();
		}
	}
}
