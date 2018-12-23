package com.hyitclassnet.action.student;

import java.util.Date;
import java.util.List;
import java.util.UUID;

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
import com.hyitclassnet.dao.SignInDao;
import com.hyitclassnet.dao.StudentDao;
import com.hyitclassnet.entities.Grade;
import com.hyitclassnet.entities.SignIn;
import com.hyitclassnet.entities.StudentInfoEntities;

public class StudentAction extends DispatchAction {

	private SignInDao signInDao;
	private StudentDao studentDao;
	private UserDao userDao;
	private GradeDao gradeDao;

	public void setGradeDao(GradeDao gradeDao) {
		this.gradeDao = gradeDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	public void setSignInDao(SignInDao signInDao) {
		this.signInDao = signInDao;
	}

	public ActionForward updatePwd(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String loginUser = WebUtil.getLoginUser();
		UserEntity userEntity = userDao.getUser(loginUser);
		String pwd = request.getParameter("newpwd");
		if (userEntity != null) {
			userEntity.setPassword(pwd);
			userDao.update_(userEntity);
		}
		request.getRequestDispatcher("/master/").forward(request, response);
		return null;
	}

	public ActionForward toUpdatePwd(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String loginUser = WebUtil.getLoginUser();
		UserEntity userEntity = userDao.getUser(loginUser);
		request.setAttribute("userEntity", userEntity);
		return mapping.findForward("updatepwd");
	}

	public ActionForward updateInfo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		int id = WebUtil.getInteger(request, "id");
		String username = request.getParameter("username");
		String realName = request.getParameter("realName");
		String phoneNumber = request.getParameter("phoneNumber");
		String email = request.getParameter("email");

		UserEntity entity = userDao.selectById(UserEntity.class, id);
		if (entity != null) {
			entity.setUsername(username);
			entity.setRealName(realName);
			entity.setPhoneNumber(phoneNumber);
			entity.setEmail(email);
			userDao.update_(entity);
		}

		request.getRequestDispatcher("/master/").forward(request, response);
		return null;
	}

	public ActionForward toUpdateInfo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String loginUser = WebUtil.getLoginUser();
		UserEntity userEntity = userDao.getUser(loginUser);
		request.setAttribute("userEntity", userEntity);
		// 自定义查询
		DetachedCriteria dc = DetachedCriteria.forClass(Grade.class);
		dc.add(Restrictions.eq("teacherId", userEntity.getId()));
		Grade grade = gradeDao.uniqueResult(dc);
		request.setAttribute("grade", grade);

		return mapping.findForward("updateinfo");
	}

	public ActionForward signIn(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String flag = request.getParameter("flag");
		String loginUser = WebUtil.getLoginUser();
		UserEntity userEntity = userDao.getUser(loginUser);
		// 点击签到
		if ("true".equals(flag)) {
			StudentInfoEntities StudentInfoEntities = studentDao.selectById(StudentInfoEntities.class,
					userEntity.getFkid());

			// 判断是否重复签到
			boolean f = signInDao.duplicateSignIn(StudentInfoEntities.getStuNo());
			if (f) {
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("<script>alert('当天已经签到!不可重复签到!');history.go(-1)</script>");
				return null;
			}

			Grade grade = gradeDao.selectById(Grade.class, StudentInfoEntities.getClassno());

			SignIn signIn = new SignIn();
			signIn.setStuno(StudentInfoEntities.getStuNo());
			signIn.setStuname(userEntity.getRealName());
			signIn.setClassname(grade.getClassName());
			signIn.setClassno(grade.getClassId());
			signIn.setRowguid(UUID.randomUUID().toString());
			signIn.setTime(new Date());
			signIn.setAddress("淮阴工学院");

			signInDao.save_(signIn);
		}
		StudentInfoEntities studentInfoEntities = studentDao.selectById(StudentInfoEntities.class,
				userEntity.getFkid());
		DetachedCriteria dc = DetachedCriteria.forClass(SignIn.class);
		dc.add(Restrictions.eq("stuno", studentInfoEntities.getStuNo()));
		request.setAttribute("singinlst", signInDao.findByExample(dc));
		return mapping.findForward("signinlst");
	}
}
