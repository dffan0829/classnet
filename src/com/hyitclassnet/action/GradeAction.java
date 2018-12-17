package com.hyitclassnet.action;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import com.classnet.dao.UserDao;
import com.classnet.util.WebUtils;
import com.hyitclassnet.dao.GradeDao;
import com.hyitclassnet.entities.Grade;

public class GradeAction extends DispatchAction {

	private GradeDao gradeDao;
	private UserDao userDao;

	public void setGradeDao(GradeDao gradeDao) {
		this.gradeDao = gradeDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public ActionForward list(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String key = request.getParameter("key");
		DetachedCriteria dc = DetachedCriteria.forClass(Grade.class);
		if (!WebUtils.isEmpty(key)) {
			key = new String(key.getBytes("ISO8859-1"), "utf-8");
			dc.add(Restrictions.like("className", key, MatchMode.ANYWHERE));
			request.setAttribute("key", key);
		}
		request.setAttribute("gradeList", gradeDao.findByExample(dc));

		return mapping.findForward("list");
	}

	public ActionForward addGrade(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setAttribute("teacherlst", userDao.getTeacher());
		return mapping.findForward("addGrade");
	}
	
	public ActionForward toUpdate(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String rowguid = request.getParameter("id");
		Grade entity = gradeDao.selectById(Grade.class, rowguid);
		request.setAttribute("grade", entity);
		return mapping.findForward("addGrade");

	}
	
	
	public ActionForward delGrade(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String rowguid = request.getParameter("id");
		Grade entity = gradeDao.selectById(Grade.class, rowguid);
		gradeDao.delete_(entity);
		response.sendRedirect(request.getContextPath()+"/admin/grade.do?m=list");
		return null;
	}
	
	public ActionForward doAddGrade(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String rowguid = request.getParameter("rowguid");
		String classid = request.getParameter("classid");
		String classname = request.getParameter("classname");
		String classnum = request.getParameter("classnum");
		if(!"".equals(rowguid)){
			Grade entity = gradeDao.selectById(Grade.class, rowguid);
			if(entity!=null){
				entity.setClassId(Integer.parseInt(classid));
				entity.setClassName(classname);
				entity.setClassNum(Integer.parseInt(classnum));
			}
			gradeDao.update_(entity);
		}else{
			Grade entity = new Grade();
			entity.setRowGuid(UUID.randomUUID().toString());
			entity.setClassId(Integer.parseInt(classid));
			entity.setClassName(classname);
			entity.setClassNum(Integer.parseInt(classnum));
			gradeDao.save_(entity);
		}
		response.sendRedirect(request.getContextPath()+"/admin/grade.do?m=list");
		return null;
	}
	
	public ActionForward changestatus(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		response.sendRedirect(request.getContextPath() + "/admin/user.do?m=list");
		return null;
	}
}
