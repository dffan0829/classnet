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
<title>作业详情</title>
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
								<form action="<c:url value="/admin/homework.do?m=doAddTitle"/>"
									method="post" style="margin: 0px;"
									onsubmit="return check(this)">
									<table width="80%" border="0" cellpadding="0" cellspacing="1"
										bgcolor="#d1d5d8">
										<tr>
											<td height="28" colspan="2" bgcolor="#c6dbf8" class="biaoti"
												style="padding: 0;">作业题目</td>
										</tr>
										<tr>
											<td width="15%" height="28" align="right" bgcolor="#edf1f7"><span>*</span>标题：</td>
											<td height="28" bgcolor="#FFFFFF"><c:out
													value="${homeWorkTitleEntity.title}" /></td>
										</tr>
										<tr>
											<td width="15%" height="28" align="right" bgcolor="#edf1f7">描述：</td>
											<td height="28" bgcolor="#FFFFFF"><c:out
													value="${homeWorkTitleEntity.description}"
													escapeXml="false" /></td>
										</tr>
									</table>
									<div class="anniu">
										<p>
											<input type="button" value="返回" class="fabu"
												onclick="javascript:history.back(-1);" />
										</p>
									</div>
								</form>
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
