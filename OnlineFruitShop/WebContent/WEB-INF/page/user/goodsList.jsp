<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.henu.model.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.henu.pagination.*"%>
<%@ include file="/WEB-INF/page/taglibs/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品列表</title>
<style>
body {
	margin: 0px;
	width: 100%;
	height: 100%;
}

a {
	text-decoration: none;
	color: black;
}

li {
	list-style: none;
}

.header {
	height: 30%;
}

.header>div {
	height: 100px;
	float: left;
}

.logo {
	margin-left: 10%;
	line-height: 6;
}

.section {
	margin-left: 12%;
}

.section>div {
	margin-left: 30px;
	float: left;
	line-height: 2;
	margin-top: 7%;
	height: 30px;
	cursor: pointer;
}

.section>div:hover {
	background: #EAEAEA;
}

.tools {
	float: right !important;
	line-height: 6;
	margin-right: 10%;
}

.main {
	min-height: 700px;
	/*background: #9ACD32;*/
	clear: both;
	border-top: 1px #808080 solid;
}

.cate {
	width: 90%;
	margin-left: 5%;
	margin-top: 50px;
}

ul.category>li {
	float: left;
	width: 5%;
	cursor: pointer;
	text-align: center;
}

ul.key {
	margin-left: 1%;
}

ul.key>li {
	float: left;
	width: 5%;
	margin-top: 1%;
	cursor: pointer;
}

.pro {
	width: 90%;
	margin-left: 5%;
	border-top: 1px solid #808080;
	margin-top: 60px;
}

.pro li {
	float: left;
	width: 24%;
	/* margin-right: 1%; */
	margin-top: 20px;
	text-align: left;
}

.pro li img {
	width: 93%;
}
</style>
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script
	src="http://apps.bdimg.com/libs/jquery-lazyload/1.9.5/jquery.lazyload.js"></script>
<script>
	$(function() {
		$("img").lazyload({
			placeholder : "images/loading.gif",
			effect : "fadeIn"
		});
	});
</script>
</head>
<body>
	<%
		List<Goods> goodsList = (List<Goods>) request.getAttribute("goodsList");
	%>
	<%
		Pagination pagination = (Pagination) request.getAttribute("pagination");
	%>
	<div class="header">
		<div class="logo">服装市场</div>
		<div class="section">
			<div>
				<a href="${ctx}/index">&nbsp;首页&nbsp; 
			</div>

			<c:forEach items="${fns:getDictsByType('category')}" var="dict">
				<div>
					&nbsp;<a href="${ctx}/goods/list/${dict.key}">${dict.value}</a>&nbsp;
				</div>
			</c:forEach>
		</div>
		<div class="tools">
			<input type="text" value="外套" /> <span> <i>搜索</i>
			</span>
		</div>
	</div>
	<div class="main">
		<div class="cate">
			<ul class="key">
				<li style="color: #9ACD32;">关键字</li>
				<li>秋冬新品</li>
				<li>商场同款</li>
				<li>修身夹克</li>
				<li>潮流卫衣</li>
				<li>牛仔衬衫</li>
				<li>温暖毛衣</li>
				<li>修身西服</li>
				<li>秋冬风衣</li>
				<li>毛呢大衣</li>
				<li>羽绒服</li>
				<li>束脚裤</li>
				<li>九分裤</li>
				<li>夹克</li>
				<li>单西</li>
				<li>棉衣</li>
				<li>马甲</li>
				<li>T恤</li>
				<li>工装裤</li>
			</ul>
		</div>
		<div style="clear: both;"></div>
		<div class="pro">
			<ul style="margin-left: 1%;">
				<%
					for (Goods goods : goodsList) {
				%>
				<li><a
					href="<%=request.getContextPath()%>/goods/detail/<%=goods.getId()%>">
						<img src="<%=request.getContextPath()%>/<%=goods.getThumbnail()%>">
				</a>
					<div>
						<span class="name"><%=goods.getGoodsName()%></span> <span
							class="name">￥<font><%=goods.getPrice()%></font></span> <a
							href="<%=request.getContextPath()%>/goods/<%=goods.getId()%>" />
					</div></li>
				<%
					}
				%>
				<ul>
		</div>
		<div style="clear: both;"></div>

		<div class="pagination">
			<span> <%
 	if (!pagination.isFirstPage() && pagination.getPageCount() > 1) {
 %> <a id="pre"
				href="<%=request.getContextPath()%>/userManager/list?currentPage=<%=pagination.getCurrentPage() - 1%>">上一页</a>
				<%
					} else {
				%> <font>上一页</font> <%
 	}
 %> <font id="current"><%=pagination.getCurrentPage()%></font> <font>/</font>
				<font id="total"><%=pagination.getPageCount()%></font> <%
 	if (!pagination.isLastPage() && pagination.getPageCount() > 1) {
 %> <a id="next"
				href="<%=request.getContextPath()%>/userManager/list?currentPage=<%=pagination.getCurrentPage() + 1%>">下一页</a>
				<%
					} else {
				%> <font>下一页</font> <%
 	}
 %>
			</span>
		</div>
	</div>

</body>
</html>