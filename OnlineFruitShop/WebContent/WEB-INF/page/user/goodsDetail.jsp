<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.henu.model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.henu.pagination.*" %>
<%@ include file="/WEB-INF/page/taglibs/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品详情</title>
	<style>
		body {
			margin: 0px;
		    width: 100%;
		    height: 100%;
		}
		a {
			text-decoration: none;
			color:black;
		}
		li {
			list-style: none;
			border-bottom: 1px solid gray;
		}
		.header {
		    height: 100px;
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
		.nav {
		    margin-top: 5%;
		    background: yellow;
		    width: 16%;
		    margin-left: 10%;
		    margin-bottom: 1%;
		}
		.detail {
		    width: 75%;
		    margin: 0 auto;
		    background: #32BECD;
		}
		.thumbnail {
		    background: #E4E4E4;
		    height: 500px;
		    width: 500px;
		    float: left;
		}
		.info {
		    /*background: #D8BFD8;*/
		    margin-left: 4%;
		    float: left;
		    width: 48%;
		}
		h2 {
			opacity: 0.8;
		}
		.info>div {
		    margin-top: 60px;
		}
		.info>div>font {
		    color: #43C323;
		    font-family: serif;
		}
		.info>div>span {
		    margin-left: 9%;
		}
		input[type="submit"] {
		    height: 40px;
		    width: 33%;
		    border: 1px #F4F3EE solid;
		    border-radius: 7px;
		    font-size: 24px;
		    color: #008080;
		    margin-left: 20%;
		    cursor: pointer;
		}
		input[type="submit"]:hover{
				background: #AFAFAA;	
		}
		.buyCount>span>font:hover {
			color: red;
			cursor: pointer;
		}
		.pull-left {
			    width: 34px;
    			text-align: center;
		}
		.comment {
		    clear: both;
		    /*background: #CED4C2;;*/
		    width: 75%;
		    margin:auto;
		    min-height: 50px;
		    margin-top: 90px;
		}
		.title {
		    height: 40px;
		    background: #DCDCD5;
		    font-size: 16pt;
		    line-height: 2;
		    /* margin-left: 1%; */
		}
		.title>span{
			display: block; 
		    background: #DCDCD5;
		    height: 40px;
		    width: 12%;
		    float: left;
		    text-align: center;
		}
		.title>span:hover{
			background: #F7F7F7 !important;
			cursor: pointer;
		}
		.left {
			float: left;
			height: 133px;
		}
		.right {
    		height: 133px;
    		padding-top: 3px;

		}
		.right>p{
			    margin-left: 11%;
			        width: 87%
		}
		.img>img{
			width: 100%;
		}
	</style>
	<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	<script src="http://apps.bdimg.com/libs/jquery-lazyload/1.9.5/jquery.lazyload.js"></script>
	<script>
		$(function() {
		          $("img").lazyload({ 
		          placeholder : "images/loading.gif",
		                 effect: "fadeIn"
		           });  
		      });
	</script>
</head>
<body class="wrapper">
	<div class="header">
		<div class="logo">服装市场</div>
		<div class="section">
			<div><a href="${ctx}/index">&nbsp;首页&nbsp;</div>

			<c:forEach items="${fns:getDictsByType('category')}" var="dict">
				<div>
					&nbsp;<a href="${ctx}/goods/list/man">${dict.value}</a>&nbsp;
				</div>
			</c:forEach>

			<div>
				<a href="${ctx}/admin/tradeAnalysis">管理中心 </a>
			</div>
		</div>
		<div class="tools">
			<input type="text" value=""/>
			<span>
				<i>搜索</i>
			</span>
		</div>
	</div>
	<div class="main">
		<div class="nav">
			<a>首页</a> &gt;
			<a><!-- {{goods.type | category_filter}} --><%
			%></a> &gt;
			<a>{{goods.goodsName}}</a>
		</div>
		
		<div class="detail">
			<div class="thumbnail">
				<img style="height: 500px;" src="<%=request.getContextPath()%>/{{goods.getThumbnail}}">
			</div>
			<div class="info">
				<h2>{{goods.goodsName}}</h2>
				<div class="price">
					<font>促销价</font>
					<span>￥{{goods.price}}</span>
				</div>
				<div class="stock">
					<font>库&nbsp;存</font>
					<span>{{goods.stock}}</span>
				</div>
				<div class="buyCount">
					<font>数&nbsp;量</font>
					<span>
						<font id="minus">-</font>
							<input class="pull-left" id="count" type="tel" value="1" disabled="disabled">
						<font id="plus">+</font>
					</span>
				</div>
				<div class="totalPrice">
					<font>总&nbsp;价</font>
					<span>
						￥{{goods.price}}
					</span>
				</div>
				<div class="">
					<input type="hidden" id="gid" value="{{goods.id}}">
					<input type="submit" value="立即购买"/>
				</div>
			</div>
		</div>
		<div class="clear" style="clear:both;"></div>
		<div class="comment">
			<div class="title">
				<span>商品简介</span>
				<span>顾客评论(10)</span>
			</div>
			<div class="content" style="display:none;">
				<ul style="margin-left: -2%;">
					<li style="border-bottom: 1px #808080 solid;">
						<div class="left">
							<p>15846550</p>
						</div>
						<div class="right">
							<p style="max-height: 72px;overflow: hidden;word-wrap: break-word;">内容 :尺码标准，面料柔软穿着舒服，版型修身，做工精细，适合初秋穿，吊牌是柒牌！</p>
							<p>2014-10-16 03:20:00</p>
						</div>
					</li>
					<div style="clear:both;"></div>
					<li>
						<div class="left">
							
							<p>1jigin0</p>
						</div>
						<div class="right">
							<p>内容 穿过一段时间，还是很喜欢，容易打理，上班休闲都 可以，显年轻，漂亮耐穿，挺不错的一件衣服！</p>
							<p>2014-11-25 06:13:09</p>
						</div>
					</li>
					<div style="clear:both;"></div>
					<li>
						<div class="left">
							<p>tgse65242</p>
						</div>
						<div class="right">
							<p>内容 第一次买，还是很满意的，没有最大号了，拿小了一号也能穿。哒！</p>
							<p>2015-10-08 14:53:22</p>
						</div>
					</li>
					<div style="clear:both;"></div>
					<li>
						<div class="left">
							<p>659840</p>
						</div>
						<div class="right">
							<p>内容 包装有些简陋，不过衣服不皱，穿上很有型！价格挺便宜的！！</p>
							<p>2016-10-08 16:53:29</p>
						</div>
					</li>
					<div style="clear:both;"></div>
					<li>
						<div class="left">
							<p>586852130</p>
						</div>
						<div class="right">
							<p>内容 衣服的版型不错，就是有点薄！</p>
							<p>2016-11-09 15:53:29</p>
						</div>
					</li>
					<div style="clear:both;"></div>
					<li>
						<div class="left">
							<p>198528540</p>
						</div>
						<div class="right">
							<p>内容 比较修身面料好做工好颜色正！</p>
							<p>2016-02-24 09:53:29</p>
						</div>
					</li>
					<div style="clear:both;"></div>
					<li>
						<div class="left">
							
							<p>1sadf630</p>
						</div>
						<div class="right">
							<p>内容 很棒的卖家，已经是老客户了！赞赞赞！！</p>
							<p>2016-02-24 09:53:29</p>
						</div>
					</li>
					<div style="clear:both;"></div>
					<li>
						<div class="left">
							<p>592868630</p>
						</div>
						<div class="right">
							<p>内容 还不错，LG穿着蛮合身的！</p>
							<p>2016-09-23 09:53:29</p>
						</div>
					</li>
					<div style="clear:both;"></div>
				</ul>
			</div>
			<div class="img" v-for="detailImage in goods.imageList">
				<img src="<%=request.getContextPath()%>/{{detailImage}}" >
							<br /> <br />
			</div>
		</div>
	</div>
	<script src="${ctxStatic}/js/vue.js"></script>
	<script type="text/javascript">
		var CATEGORY = JSON.parse("${fns:getDictsByTypeForJson('category')}");
		var GOODS = "${goods}";
		
		var wrapperVue = new Vue({
			el : ".wrapper",
			data : {
				goods:{},
			},
			methods : {
 			},
			filters: {
               category_filter: function (value) {
                    for (var i in CATEGORY) {
                        if (value == CATEGORY[i]['key']) {
                            return CATEGORY[i]['value'];
                        }
                    }
                    return '其它';
                }
			},
			ready: function() {
				console.log("tset");
				this.goods = GOODS;
			}
		});
	</script>
</body>
</html>