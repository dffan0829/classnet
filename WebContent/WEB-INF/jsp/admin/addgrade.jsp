<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/pub/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理--<c:choose><c:when test="${empty grade}">添加班级</c:when><c:otherwise>编辑班级</c:otherwise></c:choose></title>
<link href="<%=request.getContextPath() %>/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript">
function trim(str){
	return str.replace(/^\s+|\s+$/,"");
}
function check(form){
	if(form.menuId.value==0){
		alert("您还未选择新闻栏目");
		return false;
	}
	if(trim(form.title.value)==""){
		alert("新闻标题不能为空");
		return false;
	}
	if(trim(form.author.value)==""){
		alert("作者不能为空");
		return false;
	}
	<c:if test="${not empty grade}">
		form.action="<c:url value="/admin/news/news.do?m=doedit"/>";
	</c:if>
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
	<form action="<c:url value="/admin/grade.do?m=doAddGrade"/>" method="post"  style="margin:0">
	<table width="80%" border="0" cellpadding="0" cellspacing="1" bgcolor="#d1d5d8">
	  <tr>
		<td height="28" colspan="2" bgcolor="#c6dbf8" class="biaoti" style="padding:0;">
		<c:choose>
			<c:when test="${empty grade}">添加班级</c:when>
			<c:otherwise>编辑班级</c:otherwise>
		</c:choose>
		</td>
	  </tr>
	  <tr>
		<td width="15%" height="28" align="right" bgcolor="#edf1f7">班级编号：</td>
		<td height="28" bgcolor="#FFFFFF"><input type="text" name="classid"  id="classid"  value="${grade.classId}" maxlength="10"/><p>请输入班级编号</p></td>
	  </tr>
	  <tr>
	  	<td width="15%" height="28" align="right" bgcolor="#edf1f7">班级名称：</td>
		<td height="28" bgcolor="#FFFFFF"><input type="text" name="classname" id="classname" value="${grade.className}" maxlength="10"/><p>请输入班级名称</p></td>
	  </tr>
	  <tr>
	  	<td width="15%" height="28" align="right" bgcolor="#edf1f7">班级人数：</td>
		<td height="28" bgcolor="#FFFFFF"><input type="text" name="classnum" id="classnum" value="${grade.classNum}" maxlength="10"/><p>请输入班级人数</p></td>
	  </tr>
	  <tr>
	  	<td width="15%" height="28" align="right" bgcolor="#edf1f7">选择教师：</td>
		<td height="28" bgcolor="#FFFFFF">
			<select name="teacherid">
			  <c:forEach items="${teacherlst}" var="teacher" varStatus="vs">
			   	 <option value="${teacher[0]}">${teacher[1] }</option>
			  </c:forEach>
			</select>
			<p>请选择教师</p>
		</td>
	  </tr>
	</table>
	<div class="anniu">
	<p><input type="submit" value="提交" class="fabu" /> <input type="reset" value="重置" class="fabu" /></p>
	<input type="hidden" name="rowguid" value="${grade.rowGuid}"/>
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
