<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="include.jsp"%>
<link href="<%=request.getContextPath()%>/css/index.css"
	rel="stylesheet" type="text/css" />
<div id="header" class="main">
	<ul id="globalNav">
		<li id="topTabOn"><a href="<c:url value="/"/>"><span>网站首页</span></a></li>
		<c:forEach items="${catogoryList}" var="ft">
			<li><a href="<c:url value="/"/>"><span><c:out value="${ft.categoryName}" /></span></a></li>
		</c:forEach>
	</ul>
</div>
