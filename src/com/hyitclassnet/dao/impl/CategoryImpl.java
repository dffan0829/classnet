package com.hyitclassnet.dao.impl;

import com.classnet.dao.impl.HibernateSupportDao;
import com.hyitclassnet.dao.CategoryDao;
import com.hyitclassnet.entities.Category;

public class CategoryImpl extends HibernateSupportDao<Category> implements CategoryDao{

	public int findCount(){
		String sql = "select count(t.id) from ClazzEntity t";
		Object o = sessionFactory.getCurrentSession().createQuery(sql).setMaxResults(1).uniqueResult();
		return Integer.parseInt(o.toString());
	}
}
