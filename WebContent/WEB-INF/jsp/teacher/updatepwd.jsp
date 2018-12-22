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
<title>修改密码</title>
<style type="text/css">
		#regtable{line-height: 30px;}
		#regtable tr td{padding:4px;}
</style>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	function check(form) {
		var psd = $(":input[name='password']").val();
		var confirmpsd = $(":input[name='confirmpwd']").val();
		var newpsd = $(":input[name='newpwd']").val();
		var orignpwd = $(":input[type='hidden']").val();
		if(psd == ""){
			alert("原密码不能为空!");
			return false;
		}
		if(psd!= orignpwd){
			$("#tip").text("原密码错误!");
			$(":input[name='password']").val("");
			return false;
		}
		if (psd != confirmpsd) {
			alert("两次密码不相同!");
			return false;
		}

		if (newpsd == "") {
			alert("新密码不能为空!");
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
								href="<c:url value="/teacher/"/>">教师中心</a>
						</div>
						<div class="c_spacing"></div>
						<div class="u_form1">
							<div style="text-align: center">
								<table width="100%" border="0" cellpadding="5" cellspacing="0">
										<tr align="center">
											<td id="TabTitle0" class="titlemouseover">
												修改密码
											</td>
										</tr>
									</table>
								<form
									action="<%=request.getContextPath()%>/teacher/teacherOperate.do?m=updatePwd"
									method="post" onsubmit="return check(this)">
									<table id="regtable" class="border" >
										<tr>
											<td>原密码:</td>
											<td><input type="password" name="password" /><font id="tip" color="red"></font></td>
										</tr>
										<tr>
											<td>再次输入：</td>
											<td><input type="password" name="confirmpwd" /></td>
										</tr>
										<tr>
											<td>新密码：</td>
											<td><input type="password" name="newpwd" /></td>
										</tr>
									</table>
									<input type="hidden" value="${userEntity.password }" />
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
