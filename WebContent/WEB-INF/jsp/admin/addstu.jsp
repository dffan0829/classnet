<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/pub/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理--<c:choose><c:when test="${empty user}">添加用户</c:when><c:otherwise>编辑用户</c:otherwise></c:choose></title>
<link href="<%=request.getContextPath() %>/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript">
function trim(str){
	return str.replace(/^\s+|\s+$/,"");
}
function check(form){
	if(form.username.value==0){
		alert("您还未输入用户名");
		return false;
	}
	if(trim(form.password.value)==""){
		alert("密码不能为空");
		return false;
	}
	if(trim(form.email.value)==""){
		alert("邮箱不能为空");
		return false;
	}
	return true;
}
</script>
</head>
<body>
<div class="content">
<jsp:include page="pub/top.jsp"></jsp:include>
<!--头部结束-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td class="left" valign="top">
<jsp:include page="pub/left.jsp"></jsp:include>
</td>
<td valign="top">
	<div class="right">
	<form action="<c:url value="/admin/student.do?m=doAddUser"/>" onsubmit="return check(this);" method="post"  style="margin:0">
	<table width="80%" border="0" cellpadding="0" cellspacing="1" bgcolor="#d1d5d8">
	  <tr>
		<td height="28" colspan="2" bgcolor="#c6dbf8" class="biaoti" style="padding:0;">
		<c:choose>
			<c:when test="${empty user}">添加用户</c:when>
			<c:otherwise>编辑用户</c:otherwise>
		</c:choose>
		</td>
	  </tr>
	  <tr>
		<td width="15%" height="28" align="right" bgcolor="#edf1f7">用户名：</td>
		<td height="28" bgcolor="#FFFFFF"><input type="text" name="username"  id="username"  value="${user.username}" maxlength="10"/><p>请输入用户名</p></td>
	  </tr>
	  <tr>
	  	<td width="15%" height="28" align="right" bgcolor="#edf1f7">密码：</td>
		<td height="28" bgcolor="#FFFFFF"><input type="password" name="password" id="password" value="${user.password}" maxlength="10"/><p>请输入密码</p></td>
	  </tr>
	  <tr>
	  	<td width="15%" height="28" align="right" bgcolor="#edf1f7">真实姓名：</td>
		<td height="28" bgcolor="#FFFFFF"><input type="text" name="realName" id="realName" value="${user.realName}" maxlength="10"/><p>请输入真实姓名</p></td>
	  </tr>
	   <tr>
	  	<td width="15%" height="28" align="right" bgcolor="#edf1f7">联系电话：</td>
		<td height="28" bgcolor="#FFFFFF"><input type="text" name="phoneNumber" id="phoneNumber" value="${user.phoneNumber}" maxlength="10"/><p>请输入联系电话</p></td>
	  </tr>
	  <tr>
	  	<td width="15%" height="28" align="right" bgcolor="#edf1f7">邮箱：</td>
		<td height="28" bgcolor="#FFFFFF"><input type="text" name="email" id="email" value="${user.email}"  maxlength="50"/><p>请输入邮箱</p></td>
	  </tr>
	  <input type="hidden" name="role" id="role" value="ROLE_ROLE_USER"/>
	</table>
	<div class="anniu">
	<p><input type="submit" value="提交" class="fabu" /> <input type="reset" value="返回" class="fabu" onclick="javascript:window.history.go(-1)"/></p>
	<input type="hidden" name="rowguid" value="${user.id}"/>
	</div>
	</form>
	</div>
	<br />
	<br />
</td>
</tr>
</table>
<jsp:include page="pub/foot.jsp"></jsp:include>
</div>
</body>
</html>
