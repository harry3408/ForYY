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
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

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

.header>div {
	float: left;
}

.logo {
	margin-left: 10%;
	line-height: 5;
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
	margin-top:1%;
	margin-right: 10%;
}

.main {
	min-height: 700px;
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
	margin-top: 20px;
	text-align: left;
}

.pro li img {
	width: 93%;
}
</style>
</head>
<body class="wrapper">
	<div class="header">
		<div class="logo">
			<a href=""></a>服装市场
		</div>
		<div class="section">
			<div><a href="${ctx}/index">&nbsp;首页&nbsp;</a></div>

			<c:forEach items="${fns:getDictsByType('category')}" var="dict">
				<div>
					&nbsp;<a href="<%=request.getContextPath()%>/goods/list/${dict.key}">${dict.value}</a>&nbsp;
				</div>
			</c:forEach>

			<div>
				<a href="admin/tradeAnalysis">管理中心 </a>
			</div>
		</div>
		<div class="tools">
			<input type="text" /> <span> <i>搜索</i>
			</span> <span style="float: right; margin-right: -20%; color: #45A8BF;"
				id="location">定位中！</span>
		</div>
	</div>

	<div class="clear" style="clear: both;"></div>
	<hr />
	<div style="margin-left:30px;">
		<ul>
			<c:forEach items="${goodsList}" var="goods">
				<li
					style="float: left; margin-left: 10px; font-weight: bolder; border: 1px solid red;margin-top:10px;"><a
					href="<%=request.getContextPath()%>/goods/detail/${goods.id}"><img
						src="<%=request.getContextPath()%>/${goods.thumbnail}" /> </a>
					<div style="margin-top: 10px;">
						<span style="font-family: Heiti SC;">${goods.goodsName}</span><br />
						<span><font style="color: red; font-size: 21px;">￥${goods.price}</font></span>
					</div>
					<div class="clear" style="clear: both;"></div></li>
			</c:forEach>
			<div class="clear" style="clear: both;"></div>
		</ul>
	</div>

	<div class="pagination" style="margin-left:45%;">
    	<%Pagination pagination = (Pagination)request.getAttribute("pagination");
    	String category = (String) request.getAttribute("category");
    	%>
		<div class="pagination">
			<span>
			<%if(!pagination.isFirstPage() && pagination.getPageCount() > 1){ %>
				<a id="pre" href="<%=request.getContextPath()%>/goods/list/<%=category%>?currentPage=<%=pagination.getCurrentPage()-1%>">上一页</a><%}else{ %>
				<font>上一页</font>
			<%} %>
				<font id="current"><%=pagination.getCurrentPage() %></font>
				<font>/</font>
				<font id="total"><%=pagination.getPageCount() %></font>
			<%if (!pagination.isLastPage() && pagination.getPageCount() > 1 ) {%>
				<a id="next" href="<%=request.getContextPath()%>/goods/list/<%=category%>?currentPage=<%=pagination.getCurrentPage()+1%>">下一页</a><%}else{ %>
				<font>下一页</font>
			<%} %>
			</span>
		</div>
    </div>
	<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	<script src="${ctxStatic}/js/vue.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script type="text/javascript">
		var PAGINATION = '${pagination}';
		var TEST = '${test}';

		var wrapperVue = new Vue({
			el : ".wrapper",
			data : {
				testData : 1,
				pagination : {},
			},
			methods : {
				load : function() {
					this.getGoodsForMain();
				},
			},
			ready : function() {
				var _self = this;
				_self.pagination = PAGINATION;
				console.log(PAGINATION);
				console.log(TEST);
				console.log(_self.pagination["pageCount"]);
			},
		});
	</script>
</body>
</html>