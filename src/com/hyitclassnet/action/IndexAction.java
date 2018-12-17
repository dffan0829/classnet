package com.hyitclassnet.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.hyitclassnet.dao.CategoryDao;
import com.hyitclassnet.entities.Category;
/**
 * 课程网个性化首页
 * @author dff
 *
 */
public class IndexAction extends Action{

	private CategoryDao categoryDao;
	public CategoryDao getCategoryDao() {
		return categoryDao;
	}
	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}
	@SuppressWarnings("unchecked")
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//自定义查询
		DetachedCriteria category = DetachedCriteria.forClass(Category.class);
		category.addOrder(Order.asc("categoryOrder"));
		category.add(Restrictions.eq("parentId", 0));
		List<Category> catogoryList = categoryDao.findByExample(category);
		
		System.out.println("戴非凡11----------------------------");

		request.setAttribute("catogoryList", catogoryList);
		return mapping.findForward("classnetindex");
	}
}
