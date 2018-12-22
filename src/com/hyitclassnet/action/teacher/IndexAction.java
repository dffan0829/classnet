package com.hyitclassnet.action.teacher;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.classnet.dao.UserDao;
import com.classnet.entity.UserEntity;
import com.classnet.util.page.WebUtil;
import com.hyitclassnet.dao.GradeDao;
import com.hyitclassnet.entities.Grade;

public class IndexAction extends Action{

	private UserDao userDao;
	private GradeDao gradeDao;
	
	public void setGradeDao(GradeDao gradeDao) {
		this.gradeDao = gradeDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String loginUser = WebUtil.getLoginUser();
		UserEntity userEntity = userDao.getUser(loginUser);
		request.setAttribute("userEntity", userEntity);
		
		//自定义查询
		DetachedCriteria dc = DetachedCriteria.forClass(Grade.class);
		dc.add(Restrictions.eq("teacherId", userEntity.getId()));
		Grade grade =  gradeDao.uniqueResult(dc);
		request.setAttribute("grade", grade);
		
		return mapping.findForward("succ");
	}
}
