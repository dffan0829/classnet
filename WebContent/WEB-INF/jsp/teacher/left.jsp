<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/pub/include.jsp"%>
<div id="content_1">
	<ul>
		<li><a href="<c:url value="/teacher/" />"><img
				align="absmiddle"
				src="<f:message key="image_http_url"/>/images/article_add.gif"
				style="border: 0" />&nbsp;&nbsp;教师信息</a></li>
		<li><a href="<c:url value="/teacher/teacherOperate.do?m=toExcelImport" />"><img
				align="absmiddle"
				src="<f:message key="image_http_url"/>/images/article_add.gif"
				style="border: 0" />&nbsp;&nbsp;导入学生</a></li>
		<%-- <li><a href="<c:url value="/master/topic.do?m=addTopic" />"><img
				align="absmiddle"
				src="<f:message key="image_http_url"/>/images/article_add.gif"
				style="border: 0" />&nbsp;&nbsp;批改作业</a></li> --%>
		<li><a href="<c:url value="/teacher/teacherOperate.do?m=toUpdatePwd" />"><img
				align="absmiddle"
				src="<f:message key="image_http_url"/>/images/article_add.gif"
				style="border: 0" />&nbsp;&nbsp;修改密码</a></li> 
		<li><a href="<c:url value="/teacher/teacherOperate.do?m=toUpdateInfo" />"><img
				align="absmiddle"
				src="<f:message key="image_http_url"/>/images/article_add.gif"
				style="border: 0" />&nbsp;&nbsp;修改个人信息</a></li> 
		<li><a href="<c:url value="/teacher/homework.do?m=titleList" />"><img
				align="absmiddle"
				src="<f:message key="image_http_url"/>/images/article_add.gif"
				style="border: 0" />&nbsp;&nbsp;布置作业</a></li>
		<li><a href="<c:url value="/teacher/teacherOperate.do?m=querySignIn" />"><img
				align="absmiddle"
				src="<f:message key="image_http_url"/>/images/article_add.gif"
				style="border: 0" />&nbsp;&nbsp;考勤查看</a></li>
	</ul>
</div>