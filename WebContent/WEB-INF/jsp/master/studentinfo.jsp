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
<title>教师中心</title>
<style type="text/css">
		#regtable{line-height: 30px;}
		#regtable tr td{padding:4px;}
</style>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	function check(form) {
		var username = $(":input[name='username']").val();
		var realname = $(":input[name='realname']").val();
		var phoneNumber = $(":input[name='phoneNumber']").val();
		var email = $(":input[name='email']").val();
		if(username == ""){
			alert("用户名不能为空!");
			return false;
		}
		if(realname == ""){
			alert("真实姓名不能为空!");
			return false;
		}
		
		 if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(phoneNumber))){ 
			  alert("不是完整的11位手机号或者正确的手机号前七位"); 
			  return false; 
		} 
		
		 if(!/^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/.test(email)){
			  alert("不是正确的邮箱格式!"); 
			  return false; 
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
								href="<c:url value="/master/"/>">学生中心</a>
						</div>
						<div class="c_spacing"></div>
						<div class="u_form1">
							<div style="text-align: center">
								<table width="100%" border="0" cellpadding="5" cellspacing="0">
									<tr align="center">
										<td id="TabTitle0" class="titlemouseover">学生信息</td>
									</tr>
								</table>
								<form action="<%=request.getContextPath()%>/master/student.do?m=updateInfo"
									method="post" onsubmit="return check(this)">
									<table width="100%" border="0" cellpadding="5" cellspacing="1" id="regtable"
										class="border" style="text-align: left; line-height: 30px;">
										<tr>
											<td align="right" width="20%">用户名:</td>
											<td align="left"><input name="username" readonly="readonly"
												value="${userEntity.username}" /></td>
										</tr>
										<tr>
											<td align="right" width="20%">学生姓名:</td>
											<td align="left"><input name="realName"
												value="${userEntity.realName}" /></td>
										</tr>
										<tr>
											<td align="right" width="20%">联系电话:</td>
											<td align="left"><input name="phoneNumber"
												value="${userEntity.phoneNumber}" /></td>
										</tr>
										<tr>
											<td align="right">邮箱:</td>
											<td align="left"><input name="email"
												value="${userEntity.email}" /></td>
										</tr>
										<input type="hidden" name="id" value="${userEntity.id}" />
									</table>
									<input type="submit" value="提交" />
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
