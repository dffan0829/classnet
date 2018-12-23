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
<title>考勤查看</title>
<script type="text/javascript">
	
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
								<table width="100%" border="0" cellpadding="5" cellspacing="0">
									<tr align="center">
										<td id="TabTitle0" class="titlemouseover">考勤查看</td>
									</tr>
								</table>
								<!-- 根据班级进行查询 -->
								<form action="<%=request.getContextPath()%>/teacher/teacherOperate.do?m=querySignIn" method="post">
									<select name="grade">
										<c:forEach items="${gradeList}" var="grade">
										    <c:choose>
												<c:when test="${key == grade.classId}">
													<option value="${grade.classId }" selected="selected">${grade.className }</option>
												</c:when>
												<c:otherwise>
													<option value="${grade.classId }">${grade.className }</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
									<input type="submit" value="提交" />
								</form>
								<table width="99%" border="0" cellpadding="0" cellspacing="1"
									bgcolor="#dae2e5">
									<tr>
										<td width="5%" height="30" bgcolor="#e5edfa"><div
												align="center" class="STYLE3">ID</div></td>
										<td width="10%" height="30" bgcolor="#e5edfa"><div
												align="center" class="STYLE3">学号</div></td>
										<td width="10%" height="30" bgcolor="#e5edfa"><div
												align="center" class="STYLE3">学生姓名</div></td>
										<td width="13%" height="30" bgcolor="#e5edfa"><div
												align="center" class="STYLE3">班级名称</div></td>
										<td width="14%" height="30" bgcolor="#e5edfa"><div
												align="center" class="STYLE3">签到时间</div></td>
										<td width="20%" height="30" bgcolor="#e5edfa"><div
												align="center" class="STYLE3">签到地点</div></td>
									</tr>
									<c:choose>
										<c:when test="${not empty signlst}">
											<c:forEach items="${signlst}" var="hw" varStatus="vs">
												<tr>
													<td height="30" bgcolor="#FFFFFF" align="center"><c:out
															value="${vs.index+1}" /></td>
													<td bgcolor="#FFFFFF" align="center"><c:out
															value="${hw.stuno}" /></td>
													<td bgcolor="#FFFFFF" align="center"><c:out
															value="${hw.stuname}" /></td>
													<td bgcolor="#FFFFFF" align="center"><c:out
															value="${hw.classname}" /></td>
													<td bgcolor="#FFFFFF" align="center"><f:formatDate
															value="${hw.time}" pattern="yyyy-MM-dd HH:mm" /></td>
													<td bgcolor="#FFFFFF" align="center"><c:out
															value="${hw.address}" /></td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="6" align="center" height="30" bgcolor="#ffffff">暂无记录</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</table>
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
