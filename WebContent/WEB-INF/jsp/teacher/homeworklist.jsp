<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/pub/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/user.css" rel="stylesheet" type="text/css" />
<title>作业列表</title>
<script type="text/javascript">
function del(id) {
	if(id!=0){
		location='<c:url value="/admin/homework.do?m=del&id="/>'+id+"&titleId=<c:out value="${titleEntity.id}"/>";
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
			location='<c:url value="/admin/homework.do?m=del&ids="/>'+idstr+"&titleId=<c:out value="${titleEntity.id}"/>";;
		}
		else{
			alert("您还未选择");
		}
	}
} 

function check(form) {
	if (form.key.value == "") {
		alert("不能为空");
		return false;
	}
	return true;
}

function selectAll(obj) {
	var array = document.getElementsByName("hwId");
	if (array) {
		for (var i = 0; i < array.length; i++) {
			if (obj.checked) {
				array[i].checked = true;
			} else {
				array[i].checked = false;
			}
		}
	}
}

function setScore(id){
	var score = prompt("请输入作业分数","请在这里输入分数"); 
	if(score == ""){
		alert("分数不能为空!");
	}else{
		location='<c:url value="/teacher/homework.do?m=homeworkScore&id='+id+'&score='+score+'"/>';
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
									<table width="99%" border="0" cellpadding="0" cellspacing="1"
										bgcolor="#dae2e5">
										<tr>
											<td height="30" bgcolor="#ffffff" align="left"
												style="padding-left: 10px; font-weight: bold;">
												    作业题目：<c:out value="${titleEntity.title}" />
												  <span style="color: red;left: 340px;position: relative;">已完成人数:${endCtn}人&nbsp;&nbsp;&nbsp;&nbsp;总人数${totalCtn}人</span>
											</td>
										</tr>
									</table>
								</div>
								<div class="middle">
									<form action="<c:url value="/admin/homework.do"/>" method="get"
										style="margin: 0px;" onsubmit="return check(this)">
										<table width="99%" border="0" cellpadding="0" cellspacing="1"
											bgcolor="#dae2e5">
											<tr>
												<td height="30" bgcolor="#ffffff" align="center"><input
													type="hidden" name="m" value="list" /> 关键字:<input
													type="text" name="key" value="${key}" /> 用户名:<input
													type="text" name="username" value="${username}" /> <input
													type="hidden" name="titleId" value="${titleEntity.id}" />
													<input type="submit" value="搜索" /></td>
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
											<td width="20%" height="30" bgcolor="#e5edfa"><div
													align="center" class="STYLE3">用户名</div></td>
											<td width="30%" height="30" bgcolor="#e5edfa"><div
													align="center" class="STYLE3">标题</div></td>
											<td width="20%" height="30" bgcolor="#e5edfa"><div
													align="center" class="STYLE3">提交时间</div></td>
											<td width="20%" height="30" bgcolor="#e5edfa"><div
													align="center" class="STYLE3">操作选项</div></td>
										</tr>
										<c:choose>
											<c:when test="${not empty homeworkList}">
												<c:forEach items="${homeworkList}" var="hw" varStatus="vs">
													<tr>
														<td height="30" bgcolor="#FFFFFF" align="center"><input
															type="checkbox" name="hwId" value="${hw.id}" />&nbsp;<c:out
																value="${vs.index+1}" /></td>
														<td bgcolor="#FFFFFF" align="center"><c:out
																value="${hw.userEntity.username}" /></td>
														<td bgcolor="#FFFFFF" align="center"><c:out
																value="${hw.name}" /></td>
														<td bgcolor="#FFFFFF" align="center"><f:formatDate
																value="${hw.addtime}" pattern="yyyy-MM-dd HH:mm" /></td>
														<td bgcolor="#FFFFFF" align="center"><a
															href="javascript:del(${hw.id})">删除</a>&nbsp;&nbsp; <a
															target="_blank"
															href="<c:url value="/teacher/homework.do?m=download&id=${hw.id}"/>">下载</a>
														   <a href="javascript:void(0)" onclick="setScore('${hw.id}')">打分</a>
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="5" align="center" height="30"
														bgcolor="#ffffff">暂无记录</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</table>
									<p>
										<input type="checkbox" onclick="selectAll(this)" /> 全选 <input
											type="button" value="删除" class="shanchu" onclick="del(0)" />
										<input type="button" value="返回题目列表"
											onclick="location='<c:url value="/teacher/homework.do?m=titleList"/>';" />
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
