<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/pub/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课程网首页</title>
<link href="<%=request.getContextPath()%>/css/index.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="wrap">
		<!--头部定义开始-->
		<div id="header" class="main">
			<jsp:include page="/WEB-INF/jsp/pub/header.jsp"></jsp:include>
		</div>
		<!--头部定义结束-->
		<!--中部内容定义开始-->
		<div class="main">
			<!--右侧内容定义-->
			<div class="mainContent"></div>
			<!--侧边栏-->
			<div id="sideBar">
				<div class="left_box">
					<dl>
						<dt>
							<em>目录选项</em>
						</dt>
						<dd>
							<ul class="subjectList">
								<c:forEach items="${catogoryList}" var="ft">
									<li style="display: block; width: 100%;">
									 <a href="javascript:void(0);"><c:out value="${ft.categoryName}" /></a> 
										<ul style="display: none">
											<li style="width: 100%; padding-left: 30px;"><a href="##" style="background:none;padding-left:0px">教学内容</a></li>
											<li style="width: 100%; padding-left: 30px;">教学大纲</li>
											<li style="width: 100%; padding-left: 30px;">教学计划</li>
										</ul>
								     </li>
								</c:forEach>
								<div class="clearbox"></div>
							</ul>
						</dd>
					</dl>
				</div>
			</div>
			<div class="clearbox"></div>
		</div>
		<!--中部内容定义结束-->
		<div class="clearbox"></div>
	</div>
	<jsp:include page="/WEB-INF/jsp/pub/footer.jsp"></jsp:include>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
		$(".subjectList li").click(function() {
			$(this).find("ul").toggle();
		});
	</script>
</body>
</html>
