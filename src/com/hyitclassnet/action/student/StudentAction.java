package com.hyitclassnet.action.student;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import com.classnet.util.WebUtils;
import com.hyitclassnet.dao.SignInDao;
import com.hyitclassnet.dao.StudentDao;
import com.hyitclassnet.entities.Grade;
import com.hyitclassnet.entities.SignIn;

public class StudentAction extends Action{

	private SignInDao signInDao;
	private StudentDao studentDao;
	
	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	public void setSignInDao(SignInDao signInDao) {
		this.signInDao = signInDao;
	}
	
	public ActionForward signIn(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String flag = request.getParameter("flag");
		if("true".equals(flag)){
			
			
		}
		
		DetachedCriteria dc = DetachedCriteria.forClass(SignIn.class);
		request.setAttribute("singinlst", signInDao.findByExample(dc));
		return mapping.findForward("signinlst");
	}
	
}
