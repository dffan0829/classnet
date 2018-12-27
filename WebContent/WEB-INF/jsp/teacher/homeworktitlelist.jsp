<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/pub/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=request.getContextPath()%>/css/default.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/user.css" rel="stylesheet"
	type="text/css" />
<title>题目列表</title>
<script type="text/javascript">
function selectAll(obj){
	var array = document.getElementsByName("hwId");
	if(array){
		for(var i=0;i<array.length;i++){
			if(obj.checked){
				array[i].checked=true;
			}
			else{
				array[i].checked=false;
			}
		}
	}
}
function check(form){
	if(form.key.value==""){
		alert("不能为空");
		return false;
	}
	return true;
}
function del(id){
	if(id!=0){
		location='<c:url value="/teacher/homework.do?m=del&id="/>'+id+"&titleId=<c:out value="${titleEntity.id}"/>";
	}
	else{
		var array = document.getElementsByName("hwId");
		var idstr="";
		for(var i=0;i<array.length;i++){
			if(array[i].checked){
				idstr+=array[i].value+",";
			}
		}
		if(idstr){
			location='<c:url value="/teacher/homework.do?m=del&ids="/>'+idstr+"&titleId=<c:out value="${titleEntity.id}"/>";;
		}
		else{
			alert("您还未选择");
		}
	}
}
</script>
</head>
<body>
	<div class="wrap">
		<!--头部定义开始-->
		<div id="header" class="main">
			<jsp:include page="/WEB-INF/jsp/pub/header.jsp"></jsp:include>
		</div>
		<!--头部定义结束-->
		<div id="center_all" class="main">
			<div id="main_bg">
				<div id="main_right">
					<div id="main_right_box">
						<div class="r_navigation">
							您现在的位置： <a href="<c:url value="/"/>"><f:message
									key="site_name" /> </a>&gt;&gt; <a
								href="<c:url value="/teacher/"/>">教师中心</a>
						</div>
						<div class="c_spacing"></div>
						<div class="u_form1">
							<div style="text-align: center">
								<div class="middle">
									<form action="<c:url value="/teacher/homework.do"/>" method="get"
										style="margin: 0px;" onsubmit="return check(this)">
										<table width="99%" border="0" cellpadding="0" cellspacing="1"
											bgcolor="#dae2e5">
											<tr>
												<td height="30" bgcolor="#ffffff" align="center"><input
													type="hidden" name="m" value="titleList" /> 题目关键字:<input
													type="text" name="key" value="${key}" /> <input
													type="submit" value="搜索" /> <input type="button"
													value="添加题目"
													onclick="location='<c:url value="/teacher/homework.do?m=addTitle"/>'" />
												</td>
											</tr>
										</table>
									</form>
								</div>
								<div id="c01">
									<table width="99%" border="0" cellpadding="0" cellspacing="1"
										bgcolor="#dae2e5">
										<tr>
											<td width="10%" height="30" bgcolor="#e5edfa"><div
													align="center" class="STYLE3">ID</div></td>
											<td width="30%" height="30" bgcolor="#e5edfa"><div
													align="center" class="STYLE3">题目名称</div></td>
											<td width="20%" height="30" bgcolor="#e5edfa"><div
													align="center" class="STYLE3">发布日期</div></td>
										    <td width="20%" height="30" bgcolor="#e5edfa"><div
													align="center" class="STYLE3">截止日期</div></td>
											<td width="20%" height="30" bgcolor="#e5edfa"><div
													align="center" class="STYLE3">操作选项</div></td>
										</tr>
										<c:choose>
											<c:when test="${not empty homeworktitleList}">
												<c:forEach items="${homeworktitleList}" var="hw"
													varStatus="vs">
													<tr>
														<td height="30" bgcolor="#FFFFFF" align="center"><input
															type="checkbox" name="hwId" value="${hw.id}" />&nbsp;<c:out
																value="${vs.index+1}" /></td>
														<td bgcolor="#FFFFFF" align="center"><a
															href="<c:url value="/teacher/homework.do?m=list&titleId=${hw.id}"/>"><c:out
																	value="${hw.title}" /></a></td>
														<td bgcolor="#FFFFFF" align="center"><f:formatDate
																value="${hw.time}" pattern="yyyy-MM-dd HH:mm" /></td>
														<td bgcolor="#FFFFFF" align="center"><f:formatDate
																value="${hw.endTime}" pattern="yyyy-MM-dd HH:mm" /></td>
														<td bgcolor="#FFFFFF" align="center"><a
															href="<c:url value="/teacher/homework.do?m=editTitle&id=${hw.id}"/>">修改</a>&nbsp;&nbsp;
															<a href="javascript:del(${hw.id})">删除</a>&nbsp;&nbsp; <a
															href="<c:url value="/teacher/homework.do?m=titleDetail&id=${hw.id}"/>">详细</a>&nbsp;&nbsp;
															<a
															href="<c:url value="/teacher/homework.do?m=list&titleId=${hw.id}"/>">查看作业</a>
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="4" align="center" height="30"
														bgcolor="#ffffff">暂无记录</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</table>
									<p>
										<input type="checkbox" onclick="selectAll(this)" /> 全选 <input
											type="button" value="删除" class="shanchu" onclick="del(0)" />
									</p>
								</div>
								<br /> <br />
							</div>
						</div>
					</div>
				</div>
				<!-- 我的控制菜单开始 -->
				<div id="main_left">
					<dl>
						<dt></dt>
						<dd>
							<div id="mg_user_left">
								<ul>
									<li id="menu_1"><a href=#>信息管理</a></li>
								</ul>
							</div>
							<!-- 我的控制菜单开结束 -->
							<div id="mg_user_right">
								<jsp:include page="left.jsp" />
							</div>
							<div class="clearbox"></div>
							<!-- 用户快捷导航结束 -->
						</dd>
					</dl>
					<div class="clearbox"></div>
				</div>
				<div class="clearbox"></div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/jsp/pub/footer.jsp"></jsp:include>
	</div>
</body>
</html>
