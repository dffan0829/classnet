<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/pub/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理--用户管理</title>
<link href="<%=request.getContextPath() %>/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript">
function search(){
	var url = "<c:url value="/admin/grade.do?m=list"/>";
	var key = $("#key").val();
	if(key!=""){
		url+="&key="+key;
	}
	location=url;
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
	<div id="c01">
	<dl>
	<dt>班级名称:<input type="text" class="qidian" id="key" name="key" value="${key}"/> </dt>
	<dd>
		<input type="button" value="查询" class="chaxun" onclick="search()"/>
		<input type="button" value="添加班级" onclick="location='/classnet/admin/grade.do?m=addGrade'"/>
	</dd>
	</dl>
	  <table width="99%" border="0" cellpadding="0" cellspacing="1" bgcolor="#dae2e5">
	    <tr>
	      <td width="10%" height="30" bgcolor="#e5edfa" align="center">ID</td>
	      <td width="10%" height="30" bgcolor="#e5edfa" align="center">班级编号</td>
	      <td width="20%" height="30" bgcolor="#e5edfa" align="center">班级名称</td>
	      <td width="20%" height="30" bgcolor="#e5edfa" align="center">班级人数</td>
	      <td width="20%" height="30" bgcolor="#e5edfa" align="center">操作选项</td>
	    </tr>
		<c:choose>
		<c:when test="${not empty gradeList}">
		<c:forEach items="${gradeList}" var="grade" varStatus="vs">
		<tr>
	      <td height="30" bgcolor="#FFFFFF" align="center">
	        <c:out value="${vs.index+1}"/></td>
	      <td height="30" bgcolor="#FFFFFF" align="center"><c:out value="${grade.classId}"/></td>
	      <td height="30" bgcolor="#FFFFFF" align="center"><c:out value="${grade.className}"/></td>
	      <td height="30" bgcolor="#FFFFFF" align="center"><c:out value="${grade.classNum}"/></td>
	      <td width="10%" height="30" bgcolor="#FFFFFF" align="center">
	      		<a href="<c:url value="/admin/grade.do?m=delGrade&id=${grade.rowGuid}"/>">删除</a>
	      		<a href="<c:url value="/admin/grade.do?m=toUpdate&id=${grade.rowGuid}"/>">修改</a>
	      </td>
	    </tr>				
	    </c:forEach>
		</c:when>
		<c:otherwise>
		<tr>
			<td colspan="6" height="30" bgcolor="#ffffff" align="center">暂无数据</td>
		</tr>	
		</c:otherwise>
		</c:choose>
	  </table>
	  <jsp:include page="/WEB-INF/jsp/pub/page.jsp"></jsp:include>
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
