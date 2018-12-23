package com.classnet.action.master;

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
import com.hyitclassnet.dao.StudentDao;
import com.hyitclassnet.entities.Grade;
import com.hyitclassnet.entities.StudentInfoEntities;

public class IndexAction extends Action{

	private UserDao userDao;
	private GradeDao gradeDao;
	private StudentDao studentDao;
	
	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
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
		StudentInfoEntities studentInfoEntities = studentDao.selectById(StudentInfoEntities.class, userEntity.getFkid());
	  	Grade grade = gradeDao.selectById(Grade.class, studentInfoEntities.getClassno());
		request.setAttribute("grade", grade);
		
		return mapping.findForward("succ");
	}
}
