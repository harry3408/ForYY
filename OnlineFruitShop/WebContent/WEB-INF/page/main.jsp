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
					&nbsp;<a href="goods/list/man">${dict.value}</a>&nbsp;
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
						<span class="name">针织衫长袖女</span> <span class="name">￥<font>299.00</font></span>
						<i></i>
					</div></li>
				<li><a href="#"><img
						src="./static/image/indexPictures/hot/2.jpg" /> </a>
					<div>
						<span class="name">女装修身简约长袖中长款风衣</span> <span class="name">￥<font>249.00</font></span>
						<i></i>
					</div></li>
				<li><a href="#"><img
						src="./static/image/indexPictures/hot/3.jpg" /> </a>
					<div>
						<span class="name">伊芙丽2017冬装</span> <span class="name">￥<font>399.00</font></span>
						<i></i>
					</div></li>
				<li><a href="#"><img
						src="./static/image/indexPictures/hot/4.jpg" /> </a>
					<div>
						<span class="name">思莱德秋季新款纯棉</span> <span class="name">￥<font>77.00</font></span>
						<i></i>
					</div></li>
				<li><a href="#"><img
						src="./static/image/indexPictures/hot/5.jpg" /> </a>
					<div>
						<span class="name">休闲男修身翻领T恤</span> <span class="name">￥<font>195.00</font></span>
						<i></i>
					</div></li>
				<li><a href="#"><img
						src="./static/image/indexPictures/hot/6.jpg" /> </a>
					<div>
						<span class="name">纯棉男士短袖T恤</span> <span class="name">￥<font>124.50</font></span>
						<i></i>
					</div></li>
				<li><a href="#"><img
						src="./static/image/indexPictures/hot/7.jpg" /> </a>
					<div>
						<span class="name">羊毛混纺男呢子大衣</span> <span class="name">￥<font>345.30</font></span>
						<i></i>
					</div></li>
				<li><a href="#"><img
						src="./static/image/indexPictures/hot/8.jpg" /> </a>
					<div>
						<span class="name">白鸭绒轻羽绒</span> <span class="name">￥<font>348.00</font></span>
						<i></i>
					</div></li>

			</ul>
			<div class="clear" style="clear: both;"></div>
			
			<ul v-for="goodsListByType in mainGoodsList">
				<h3>{{goodsListByType.categoryValue}}</h3>

				<li v-for="goods in goodsListByType.data"><a href="<%=request.getContextPath()%>/goods/detail/{{goods.id}}"><img
						src="<%=request.getContextPath()%>/{{goods.thumbnail}}"/> </a>
					<div>
						<span class="name">{{goods.goodsName}}</span> <span class="name">￥<font>{{goods.price}}</font></span>
					</div></li>
			</ul>
		</div>
	</div>

	<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	<script src="${ctxStatic}/js/vue.js"></script>
	<script
		src="http://apps.bdimg.com/libs/jquery-lazyload/1.9.5/jquery.lazyload.js"></script>
	<script src="http://responsiveslides.com/responsiveslides.min.js"></script>
	<script type="text/javascript">
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
					$.ajax({
						url : location.origin + '/OnlineFruitShop/goods/main',
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