package com.hyitclassnet.action.teacher;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.upload.FormFile;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.BeanUtils;

import com.classnet.dao.UserDao;
import com.classnet.entity.NewsEntity;
import com.classnet.entity.UserEntity;
import com.classnet.form.NewsForm;
import com.classnet.util.WebUtils;
import com.classnet.util.page.WebUtil;
import com.hyitclassnet.dao.GradeDao;
import com.hyitclassnet.dao.SignInDao;
import com.hyitclassnet.dao.StudentDao;
import com.hyitclassnet.entities.Grade;
import com.hyitclassnet.entities.SignIn;
import com.hyitclassnet.entities.StudentInfoEntities;

public class TeacherAction extends DispatchAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String path;
	private String type;
	private Integer filesize = 1024 * 1024;
	private StudentDao studentDao;
	private UserDao userDao;
	private GradeDao gradeDao;
	private SignInDao signInDao;
	
	public void setSignInDao(SignInDao signInDao) {
		this.signInDao = signInDao;
	}
	public void setGradeDao(GradeDao gradeDao) {
		this.gradeDao = gradeDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getFilesize() {
		return filesize;
	}

	public void setFilesize(Integer filesize) {
		this.filesize = filesize;
	}

	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	
	public ActionForward updatePwd(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String loginUser = WebUtil.getLoginUser();
		UserEntity userEntity = userDao.getUser(loginUser);
		String pwd = request.getParameter("newpwd");
		if(userEntity!=null){
			userEntity.setPassword(pwd);
			userDao.update_(userEntity);
		}
		request.getRequestDispatcher("/teacher/").forward(request, response);
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
		if(entity!=null){
			entity.setUsername(username);
			entity.setRealName(realName);
			entity.setPhoneNumber(phoneNumber);
			entity.setEmail(email);
			userDao.update_(entity);
		}
		
		request.getRequestDispatcher("/teacher/").forward(request, response);
		return null;
	}
	
	
	public ActionForward toUpdateInfo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String loginUser = WebUtil.getLoginUser();
		UserEntity userEntity = userDao.getUser(loginUser);
		request.setAttribute("userEntity", userEntity);
		//自定义查询
		DetachedCriteria dc = DetachedCriteria.forClass(Grade.class);
		dc.add(Restrictions.eq("teacherId", userEntity.getId()));
		Grade grade =  gradeDao.uniqueResult(dc);
		request.setAttribute("grade", grade);
		
		return mapping.findForward("updateinfo");
	}
	
	public ActionForward toExcelImport(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("import");
	}
	
	public ActionForward del(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String rowguid = request.getParameter("id");
		StudentInfoEntities studentInfoEntities = studentDao.selectById(StudentInfoEntities.class, rowguid);
		studentDao.delete_(studentInfoEntities);

		@SuppressWarnings("unchecked")
		List<StudentInfoEntities> lst = studentDao.findByExample("from StudentInfoEntities");
		request.setAttribute("stulst", lst);
		return mapping.findForward("stulst");
	}
	
	public ActionForward doExcelImport(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("----excel import");
		String loginUser = WebUtil.getLoginUser();
		UserEntity userEntity = userDao.getUser(loginUser);

		try {
			NewsForm newsForm = (NewsForm) form;
			NewsEntity entity = new NewsEntity();
			BeanUtils.copyProperties(newsForm, entity);
			FormFile file = newsForm.getImgFile();
			XSSFWorkbook wb = new XSSFWorkbook(file.getInputStream());
			Sheet sheet = wb.getSheetAt(0);
			int rowNum = sheet.getLastRowNum() + 1;
			List<StudentInfoEntities> list = new ArrayList<StudentInfoEntities>();
			for (int i = 0; i < rowNum; i++) {
				Row row = sheet.getRow(i);
				if (row == null) {
				    continue;
				}
				int cellNum = row.getLastCellNum();
				StudentInfoEntities entities = new StudentInfoEntities();
				for (int j = 0; j < cellNum; j++) {
					Cell cell = row.getCell(j);
					if (cell == null) {
					    continue;
					}
					switch (j) {// 通过列数来判断对应插如的字段
					case 0:
						entities.setStuName(cell.getStringCellValue());
						break;
					case 1:
						entities.setGender(cell.getStringCellValue());
						break;
					case 2:
						entities.setStuNo((int) cell.getNumericCellValue());
						break;
					case 3:
						entities.setAddress(cell.getStringCellValue());
						break;
					case 4:
						entities.setStuTel(String.valueOf((int) cell.getNumericCellValue()));
						break;
					case 5:
						entities.setEmail(cell.getStringCellValue());
						break;

					}
				}
				entities.setClassno(userEntity.getFkid());
				list.add(entities);
			}
			studentDao.exportStuInfo(list);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		@SuppressWarnings("unchecked")
		List<StudentInfoEntities> lst = studentDao.findByExample("from StudentInfoEntities");
		request.setAttribute("stulst", lst);
		
		return mapping.findForward("stulst");
	}
	
	@SuppressWarnings("unchecked")
	public ActionForward querySignIn(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//查询所有的班级用于条件查询
		DetachedCriteria dc1 = DetachedCriteria.forClass(Grade.class);
		request.setAttribute("gradeList", gradeDao.findByExample(dc1));

		
		DetachedCriteria dc = DetachedCriteria.forClass(SignIn.class);
		String key = request.getParameter("grade");
		if (!WebUtils.isEmpty(key)) {
			key = new String(key.getBytes("ISO8859-1"), "utf-8");
			dc.add(Restrictions.eq("classno", Integer.parseInt(key)));
			request.setAttribute("key", key);
		}
		List<SignIn> sininlst = signInDao.findByExample(dc);
		request.setAttribute("signlst", sininlst);
		
		return mapping.findForward("signlst");
	}
}
