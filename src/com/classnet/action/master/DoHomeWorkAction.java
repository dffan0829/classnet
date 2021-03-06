package com.classnet.action.master;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.upload.FormFile;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;

import com.classnet.dao.HomeWorkTitleDao;
import com.classnet.dao.UserDao;
import com.classnet.dao.UserHomeWorkDao;
import com.classnet.entity.HomeWorkTitleEntity;
import com.classnet.entity.UserEntity;
import com.classnet.entity.UserHomeWorkEntity;
import com.classnet.form.UserHomeWorkForm;
import com.classnet.util.page.IPagination;
import com.classnet.util.page.SimplePagination;
import com.classnet.util.page.WebUtil;
import com.classnet.util.upload.UploadFileImpl;

public class DoHomeWorkAction extends DispatchAction{

	private String path;
	private int filesize = 1024*1024*100;
	private String type = "rar";
	private HomeWorkTitleDao homeWorkTitleDao;
	private UserHomeWorkDao userHomeWorkDao;
	private UserDao userDao;
	public void setUserHomeWorkDao(UserHomeWorkDao userHomeWorkDao) {
		this.userHomeWorkDao = userHomeWorkDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public void setHomeWorkTitleDao(HomeWorkTitleDao homeWorkTitleDao) {
		this.homeWorkTitleDao = homeWorkTitleDao;
	}
	@SuppressWarnings("unchecked")
	public ActionForward hw(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String loginUser = WebUtil.getLoginUser();
		UserEntity userEntity = userDao.getUser(loginUser);
		int page = WebUtil.getPage(request);
		int pageSize = 10;
		DetachedCriteria dc = DetachedCriteria.forClass(HomeWorkTitleEntity.class);
		IPagination pp = new SimplePagination(dc,Order.desc("id"),true,page,pageSize);
		pp.save(request);
		List<HomeWorkTitleEntity> homeworktitleList = pp.getPage();
		if(homeworktitleList!=null&&!homeworktitleList.isEmpty()){
			for(HomeWorkTitleEntity entity : homeworktitleList){
				System.out.println(entity.getTitle());
				boolean bln = userHomeWorkDao.findByUserIdAndTitleId(userEntity.getId(), entity.getId());
				if(bln){
					entity.setUsersubmit(1);
				}
			}
		}
		request.setAttribute("homeworktitleList", homeworktitleList);
		return mapping.findForward("hw");
	}
	public ActionForward titleDetail(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		int id = WebUtil.getInteger(request, "id");
		HomeWorkTitleEntity entity = homeWorkTitleDao.selectById(HomeWorkTitleEntity.class, id);
		if(entity==null){
			response.sendRedirect(request.getContextPath()+"/master/homework.do?m=hw");
			return null;
		}
		request.setAttribute("entity", entity);
		return mapping.findForward("homeworktitledetial");
	}
	
	public ActionForward titleScore(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		int id = WebUtil.getInteger(request, "id");
		HomeWorkTitleEntity entity = homeWorkTitleDao.selectById(HomeWorkTitleEntity.class, id);
		if(entity==null){
			response.sendRedirect(request.getContextPath()+"/master/homework.do?m=hw");
			return null;
		}
		request.setAttribute("entity", entity);
		return mapping.findForward("homeworktitlescore");
	}
	
	public ActionForward download(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		int id = WebUtil.getInteger(request, "id");
		UserHomeWorkEntity entity = userHomeWorkDao.selectById(UserHomeWorkEntity.class, id);
		if(entity!=null){
			HomeWorkTitleEntity titleEntity = entity.getTitle();
			File file = new File(path+"/homework/"+titleEntity.getId()+"/"+entity.getName());
			if(!file.exists()){
				response.setCharacterEncoding("utf-8");
				response.getWriter().write("该文件不存在");
				return null;
			}
			response.reset();
			response.setContentType("application/x-download");
			response.addHeader("Content-Disposition","attachment;filename=" + new String(entity.getName().getBytes(),"ISO8859-1")); 
			OutputStream out = response.getOutputStream();
			FileInputStream in = new FileInputStream(file);
			byte[] b = new byte[1024];
			int i = 0;
			while((i=in.read(b))>0){
				out.write(b,0,i);
			}
			out.flush();
			in.close();
			out.close();
		}
		return null;
	}
	
	public ActionForward submit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		UserHomeWorkForm userHomeWorkForm = (UserHomeWorkForm)form;
		HomeWorkTitleEntity titleEntity = homeWorkTitleDao.selectById(HomeWorkTitleEntity.class, userHomeWorkForm.getTitleId());
		
		//已到了截止时间 不能提交
		if(new Date().getTime() > titleEntity.getEndTime().getTime()){
			response.setCharacterEncoding("utf-8");
			response.getWriter().write("<script>alert('已过了截止时间!');history.go(-1);</script>");
			return null;
		}
		
		FormFile file = userHomeWorkForm.getWorkfile();
		if(titleEntity!=null&&file!=null&&file.getFileSize()>0){
			try{
				UserHomeWorkEntity entity = new UserHomeWorkEntity();
				UploadFileImpl uploadFile = new UploadFileImpl(path+"/homework/"+titleEntity.getId(),filesize,type,file);
				uploadFile.save();
				entity.setName(uploadFile.getFilename());
				entity.setAddtime(new Date());
				entity.setTitle(titleEntity);
				UserEntity user = userDao.getUser(WebUtil.getLoginUser());
				entity.setUserEntity(user);
				userHomeWorkDao.save_(entity);
			}catch(Exception e){
				//e.printStackTrace();
				request.getSession().setAttribute("message", e.getMessage());
				response.sendRedirect(request.getContextPath()+"/master/homework.do?m=titleDetail&id="+titleEntity.getId());
				return null;
			}
		}
		response.sendRedirect(request.getContextPath()+"/master/homework.do?m=hw");
		return null;
	}
	public void setPath(String path) {
		this.path = path;
	}
}
