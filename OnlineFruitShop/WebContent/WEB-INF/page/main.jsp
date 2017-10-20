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
<title>服装市场-漂亮每一天</title>
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
	width: 22%;
}

.main {
	min-height: 700px;
	/*background: #9ACD32;*/
	clear: both;
}

.rslides {
	position: relative;
	list-style: none;
	overflow: hidden;
	width: 100%;
	padding: 0;
	margin: 0;
}

.rslides li {
	-webkit-backface-visibility: hidden;
	position: absolute;
	display: none;
	width: 100%;
	height: 600px;
	left: 0;
	top: 0;
}

.rslides li:first-child {
	position: relative;
	display: block;
	float: left;
}

.rslides img {
	display: block;
	height: auto;
	float: left;
	width: 100%;
	border: 0;
}

.sec {
	width: 90%;
	margin-left: 5%;
	border-top: 1px solid #808080;
	margin-top: 60px;
}

.sec li {
	float: left;
	width: 24%;
	/* margin-right: 1%; */
	margin-top: 20px;
	text-align: left;
}

.sec li img {
	width: 93%;
}

.clear {
	/* border: 1px solid saddlebrown; */
	width: 90%;
	/* margin-top: 124px; */
	margin-left: 4%;
	margin-bottom: 52px;
}
</style>
</head>
<body class="wrapper">
	<div class="header">
		<div class="logo">
			<a href=""></a>服装市场
		</div>
		<div class="section">
			<div>&nbsp;首页&nbsp;</div>

			<c:forEach items="${fns:getDictsByType('category')}" var="dict">
				<div>
					&nbsp;<a href="goods/list/${dict.key}">${dict.value}</a>&nbsp;
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
	<div class="main">
		<div class="sec">

			<ul class="hot">
				<h3>新品热卖</h3>
				<li><a href="#"><img
						src="./static/image/indexPictures/hot/1.jpg" /> </a>
					<div>
						<span style="font-family: Heiti SC;">针织衫长袖女</span><br /> <span><font
							style="color: red; font-size: 21px;">￥151.00</font></span>
					</div></li>
				<li><a href="#"><img
						src="./static/image/indexPictures/hot/2.jpg" /> </a>
					<div>
						<span style="font-family: Heiti SC;">女装修身简约长袖中长款风衣</span><br /> <span><font
							style="color: red; font-size: 21px;">￥249.00</font></span>
					</div></li>
				<li><a href="#"><img
						src="./static/image/indexPictures/hot/3.jpg" /> </a>
					<div>
						<span style="font-family: Heiti SC;">伊芙丽2017冬装</span><br /> <span><font
							style="color: red; font-size: 21px;">￥399.00</font></span>
					</div></li>
				<li><a href="#"><img
						src="./static/image/indexPictures/hot/4.jpg" /> </a>
					<div>
						<span style="font-family: Heiti SC;">思莱德秋季新款纯棉</span><br /> <span><font
							style="color: red; font-size: 21px;">￥77.00</font></span>
					</div></li>
				<li><a href="#"><img
						src="./static/image/indexPictures/hot/5.jpg" /> </a>
					<div>
						<span style="font-family: Heiti SC;">休闲男修身翻领T恤</span><br /> <span><font
							style="color: red; font-size: 21px;">￥195.00</font></span>
					</div></li>
				<li><a href="#"><img
						src="./static/image/indexPictures/hot/6.jpg" /> </a>
					<div>
						<span style="font-family: Heiti SC;">纯棉男士短袖T恤</span><br /> <span><font
							style="color: red; font-size: 21px;">￥124.50</font></span>
					</div></li>
				<li><a href="#"><img
						src="./static/image/indexPictures/hot/7.jpg" /> </a>
					<div>
						<span style="font-family: Heiti SC;">羊毛混纺男呢子大衣</span><br /> <span><font
							style="color: red; font-size: 21px;">￥345.30</font></span> 
					</div></li>
				<li><a href="#"><img
						src="./static/image/indexPictures/hot/8.jpg" /> </a>
					<div>
						<span style="font-family: Heiti SC;">白鸭绒轻羽绒</span><br /> <span><font
							style="color: red; font-size: 21px;">￥348.00</font></span>
					</div></li>

			</ul>
			<div class="clear" style="clear: both;"></div>
			<ul v-for="goodsListByType in mainGoodsList">
				<h3>{{goodsListByType.categoryValue}}</h3>

				<li v-for="goods in goodsListByType.data"><a
					href="<%=request.getContextPath()%>/goods/detail/{{goods.id}}"><img
						src="<%=request.getContextPath()%>/{{goods.thumbnail}}" /> </a>
					<div>
						<span style="font-family: Heiti SC;">{{goods.goodsName}}</span><br /> <span><font
							style="color: red; font-size: 21px;">￥{{goods.price}}</font></span>
					</div>
					<div class="clear" style="clear: both;"></div></li>
				<div class="clear" style="clear: both;"></div>
			</ul>
		</div>
	</div>

	<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	<script src="${ctxStatic}/js/vue.js"></script>
	<script
		src="http://apps.bdimg.com/libs/jquery-lazyload/1.9.5/jquery.lazyload.js"></script>
	<script src="http://responsiveslides.com/responsiveslides.min.js"></script>
	<script type="text/javascript">

		function getRootPath() {
			//获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp  
			var curWwwPath = window.document.location.href;
			//获取主机地址之后的目录，如： uimcardprj/share/meun.jsp  
			var pathName = window.document.location.pathname;
			var pos = curWwwPath.indexOf(pathName);
			//获取主机地址，如： http://localhost:8083  
			var localhostPaht = curWwwPath.substring(0, pos);
			//获取带"/"的项目名，如：/uimcardprj  
			var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
			return (localhostPaht + projectName);
		}

		var wrapperVue = new Vue({
			el : ".wrapper",
			data : {
				testData : 1,
				mainGoodsList : [],
			},
			methods : {
				load : function() {
					this.getGoodsForMain();
				},
				getGoodsForMain : function() {
					var _self = this;
					console.log("patha:"+getRootPath());
					$.ajax({
						url : getRootPath() + '/goods/main',
						type : 'GET',
						success : function(result) {
							_self.testData = 5;
							_self.mainGoodsList = result;
						}
					});
				},
			},
			ready : function() {
				this.load();
			},
		});
	</script>
</body>
</html>