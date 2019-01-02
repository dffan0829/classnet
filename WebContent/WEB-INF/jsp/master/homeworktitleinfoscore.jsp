<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/pub/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="UTF-8">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="<%=request.getContextPath()%>/css/default.css"
			rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath()%>/css/user.css"
			rel="stylesheet" type="text/css" />
		<title>会员中心--查看作业</title>
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
								您现在的位置：
								<a href="<c:url value="/"/>"><f:message key="site_name" />
								</a>&gt;&gt;
								<a href="<c:url value="/master/"/>">会员中心</a>
							</div>
							<div class="c_spacing"></div>
							<div class="u_form1">
								<div style="text-align: center">
									<table width="100%" border="0" cellpadding="0" cellspacing="0">
										<tr align="center">
											<td id="TabTitle0" class="titlemouseover">
												查看作业
											</td>
										</tr>
									</table>
									<form action="<c:url value="/master/homework.do?m=submit"/>" method="post" enctype="multipart/form-data" onsubmit="return check(this)">
									<table class="border" id="EgvContent" style="width: 100%;" border="0" cellpadding="0" cellspacing="1">
										<tr class="tdbg" align="center">
											<td height="25" width="20%" align="right" style="padding-right:8px">题目:</td>
											<td align="left" style="padding-left:8px">
	                							<c:out value="${entity.title}" />
	                						</td>
										</tr>
										<tr class="tdbg" align="center">
											<td height="25" align="right" style="padding-right:8px">发布时间:</td>
											<td align="left" style="padding-left:8px">
	                							<f:formatDate value="${entity.time}" pattern="yyyy-MM-dd HH:mm"/>
	                						</td>
										</tr>
										<tr class="tdbg" align="center">
											<td height="25" align="right" style="padding-right:8px">截止时间:</td>
											<td align="left" style="padding-left:8px">
	                							<f:formatDate value="${entity.endTime}" pattern="yyyy-MM-dd HH:mm"/>
	                						</td>
										</tr>
										<tr class="tdbg" align="center">
											<td height="25" align="right" style="padding-right:8px">提交时间:</td>
											<td align="left" style="padding-left:8px">
	                							<f:formatDate value="${entity.homeworkList[0].addtime}" pattern="yyyy-MM-dd HH:mm"/>
	                						</td>
										</tr>
										<tr class="tdbg" align="center">
											<td height="25" align="right" style="padding-right:8px">详细描述:</td>
											<td align="left" style="padding-left:8px;line-height: 22px">
	                							<c:out value="${entity.description}" escapeXml="false" />
	                						</td>
										</tr>
										<tr class="tdbg" align="center">
											<td height="25" align="right" style="padding-right:8px">作业:</td>
											<td align="left" style="padding-left:8px">
	                							<a target="_blank" href="<c:url value="/master/homework.do?m=download&id=${entity.homeworkList[0].id}"/>">下载</a>
	                						</td>
										</tr>
										<tr class="tdbg" align="center">
											<td height="25" align="right" style="padding-right:8px">教师打分:</td>
											<td align="left" style="padding-left:8px;line-height: 22px">
											 <c:if test="${empty entity.homeworkList[0].score }">
											 	暂未打分
											 </c:if>
											 <c:if test="${not empty entity.homeworkList[0].score }">
	                							<c:out value="${entity.homeworkList[0].score}" />
											 </c:if>
	                						</td>
										</tr>
										<tr class="tdbg" align="center">
											<td height="30" align="right" style="padding-right:8px"></td>
											<td align="left" style="padding-left:8px">
	                							<input type="button" value="返回" onclick="javascript:history.back(-1);"/>
	                						</td>
										</tr>
									</table>
									</form>
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
										<li id="menu_1" >
											<a href=#>信息管理</a>
										</li>
									</ul>
								</div>
								<!-- 我的控制菜单开结束 -->
								<div id="mg_user_right">
									<jsp:include page="left.jsp"/>
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
<script type="text/javascript">
<c:if test="${not empty message}">
alert('<c:out value="${message}"/>');
</c:if>
</script>
<% 
	if(session.getAttribute("message")!=null){
		session.removeAttribute("message");
	}
%>
	</body>
</html>
