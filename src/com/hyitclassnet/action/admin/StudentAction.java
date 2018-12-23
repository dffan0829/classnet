package com.hyitclassnet.action.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.classnet.dao.UserDao;
import com.classnet.entity.UserEntity;
import com.classnet.util.WebUtils;
import com.classnet.util.page.IPagination;
import com.classnet.util.page.SimplePagination;
import com.classnet.util.page.WebUtil;
import com.hyitclassnet.dao.GradeDao;

public class StudentAction extends DispatchAction {

	private GradeDao gradeDao;
	private UserDao userDao;

	public void setGradeDao(GradeDao gradeDao) {
		this.gradeDao = gradeDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@SuppressWarnings("unchecked")
	public ActionForward stuList(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String key = request.getParameter("key");
		int page = WebUtil.getPage(request);
		int page_size = 10;
		DetachedCriteria dc = DetachedCriteria.forClass(UserEntity.class);
		dc.add(Restrictions.eq("authorite", "ROLE_USER"));
		if (!WebUtils.isEmpty(key)) {
			key = new String(key.getBytes("ISO8859-1"), "utf-8");
			dc.add(Restrictions.like("username", key, MatchMode.ANYWHERE));
			request.setAttribute("key", key);
		}
		IPagination pp = new SimplePagination(dc, Order.desc("id"), true, page, page_size);
		pp.save(request);
		List<UserEntity> userList = pp.getPage();
		request.setAttribute("userList", userList);
		return mapping.findForward("stulist");
	}

	public ActionForward toUpdate(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String rowguid = request.getParameter("id");
		UserEntity entity = userDao.selectById(UserEntity.class, Integer.parseInt(rowguid));
		System.out.println(entity);
		request.setAttribute("user", entity);
		return mapping.findForward("add");
	}

	public ActionForward delUser(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String rowguid = request.getParameter("id");
		UserEntity entity = userDao.selectById(UserEntity.class, Integer.parseInt(rowguid));
		userDao.delete_(entity);
		response.sendRedirect(request.getContextPath() + "/admin/student.do?m=stuList");
		return null;
	}

	public ActionForward doAddUser(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String realName = request.getParameter("realName");
		String phoneNumber = request.getParameter("phoneNumber");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String rowguid = request.getParameter("rowguid");
		if (!"".equals(rowguid)) {
			UserEntity entity = userDao.selectById(UserEntity.class, Integer.parseInt(rowguid));
			if (entity != null) {
				entity.setUsername(username);
				entity.setPassword(password);
				entity.setEmail(email);
				entity.setRealName(realName);
				entity.setPhoneNumber(phoneNumber);
			}
			userDao.update_(entity);
		}
		response.sendRedirect(request.getContextPath() + "/admin/student.do?m=stuList");
		return null;
	}

}
