<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@page import="tools.*"%>
<%@page import="net.sf.json.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <script src="js/esl.js"></script>
     <link href="./css/page.css" rel="stylesheet" type="text/css"/>
     <script type="text/javascript" src="./asset/js/jquery.min.js"></script>
     <script type="text/javascript" src="./asset/js/menu-js.js"></script> 
</head>

<body>
     <div id ="select" ><div id="header">
<div id="nav" class="nav">
<ul>
  <li id="mainlevel_01" class="first-crl mainlevel">
  <a class="nav-a"   href="./index.html">首页</a> 
  </li>
  <li id="mainlevel_02" class="mainlevel">
  <a class="nav-a">价格分析</a> 
  <div id="sub_02">
  <ol>
    <li><a href="./datazoom1.jsp" target="_blank">价格走势</a></li>
    <li><a href="./form.jsp" target="_blank">价格对比</a></li>
    <li><a href="./map2.jsp" target="_blank">全国商品价格</a></li>
    </ol><span class="nav-img"><img src="./img/pic5_2.png"/> </span></div></li>
  <li id="mainlevel_03" class="mainlevel">
  <a class="nav-a">居民价格消费指数</a> 
  <div id="sub_03">
  <ol>
    <li><a href="./form2.jsp" target="_blank">同比环比</a></li>
    <li><a href="./pie7.jsp" target="_blank">CPI比例</a></li>
    <li><a href="./map13.jsp" target="_blank">各省月度CPI</a></li>
    </ol><span class="nav-img"><img src="./img/pic6.png"/> </span></div></li>
  <li id="mainlevel_04" class="mainlevel">
  <a class="nav-a" href="./map11.jsp" target="_blank">商品进出口情况</a> </li>
  <li id="mainlevel_05" class="mainlevel">
  <a class="nav-a" href="./map9.jsp" target="_blank">各农作物产地</a> </li>
  <li id="mainlevel_07" class="mainlevel">
  <a class="nav-a" href="./predict.jsp" target="_blank">价格预测</a> </li>
   <li id="mainlevel_08" class="end-crl mainlevel">
   <a class="nav-a" href="#">关于更多</a> </li>
  </ul></div>
  </div><!-- end of the header --></div>

<a href="./mix3.jsp">点此查看省市级价格分布情况</a>
<br/><br/>
     <div id="main" style="height:400px;width:80%;border:1px solid #ccc;padding :10px"></div>
     <div id ="bottom" style="text-align:right"><a href="./index.html"><img src="img/图标2.png" title="返回首页"></img></a></div>
    <script type="text/javascript">
    
    require.config({
        paths:{ 
            echarts:'./js/echarts',
            'echarts/chart/bar' : './js/echarts-map',
            'echarts/chart/line': './js/echarts-map',
            'echarts/chart/map' : './js/echarts-map'
        }
    });
    require(
        [
            'echarts',
            'echarts/chart/bar',
            'echarts/chart/line',
            'echarts/chart/map'
        ],
        function (ec) {
            var myChart = ec.init(document.getElementById('main'));
            myChart.setOption({
            	    title : {
            	        text: '全国商品价格',
            	        subtext: '信息来自 中国统计网',
            	        x:'center'
            	    },
            	    tooltip : {
            	        trigger: 'item'
            	    },
            	    legend: {
            	    	selectedMode:'single',
            	        orient: 'vertical',
            	        x:'right',
            	        data : ['精瘦肉','五花肉','排骨','鲜牛肉','鲜羊肉','鸡蛋','芹菜','大白菜','油菜','黄瓜','白萝卜','胡萝卜','青萝卜','茄子','西红柿','土豆','青辣椒','卷心菜','芸豆','蒜苔']
            	    },
            	    dataRange: {
            	        min: 0,
            	        max: 2500,
            	        x: 'left',
            	        y: 'bottom',
            	        text:['高','低'],           // 文本，默认为数值文本
            	        calculable : true
            	    },
            	    toolbox: {
            	        show : true,
            	        orient : 'vertical',
            	        x: 'top',
            	        y: 'right',
            	        feature : {
            	            mark : {show: true},
            	            dataView : {show: true, readOnly: false},
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    series : [
            	        {
            	            name: '精瘦肉',
            	            type: 'map',
            	            mapType: 'china',
            	            roam: true,
            	            itemStyle:{
            	                normal:{label:{show:true}},
            	                emphasis:{label:{show:true}}
            	            },
            	            data:[
            	                {name: '北京',value: Math.round(Math.random()*1000)},
            	                {name: '天津',value: Math.round(Math.random()*1000)},
            	                {name: '上海',value: Math.round(Math.random()*1000)},
            	                {name: '重庆',value: Math.round(Math.random()*1000)},
            	                {name: '河北',value: Math.round(Math.random()*1000)},
            	                {name: '河南',value: Math.round(Math.random()*1000)},
            	                {name: '云南',value: Math.round(Math.random()*1000)},
            	                {name: '辽宁',value: Math.round(Math.random()*1000)},
            	                {name: '黑龙江',value: Math.round(Math.random()*1000)},
            	                {name: '湖南',value: Math.round(Math.random()*1000)},
            	                {name: '安徽',value: Math.round(Math.random()*1000)},
            	                {name: '山东',value: Math.round(Math.random()*1000)},
            	                {name: '新疆',value: 1000},
            	                {name: '江苏',value: Math.round(Math.random()*1000)},
            	                {name: '浙江',value: Math.round(Math.random()*1000)},
            	                {name: '江西',value: Math.round(Math.random()*1000)},
            	                {name: '湖北',value: Math.round(Math.random()*1000)},
            	                {name: '广西',value: Math.round(Math.random()*1000)},
            	                {name: '甘肃',value: Math.round(Math.random()*1000)},
            	                {name: '山西',value: Math.round(Math.random()*1000)},
            	                {name: '内蒙古',value: Math.round(Math.random()*1000)},
            	                {name: '陕西',value: Math.round(Math.random()*1000)},
            	                {name: '吉林',value: Math.round(Math.random()*1000)},
            	                {name: '福建',value: Math.round(Math.random()*1000)},
            	                {name: '贵州',value: Math.round(Math.random()*1000)},
            	                {name: '广东',value: Math.round(Math.random()*1000)},
            	                {name: '青海',value: Math.round(Math.random()*1000)},
            	                {name: '西藏',value: Math.round(Math.random()*1000)},
            	                {name: '四川',value: Math.round(Math.random()*1000)},
            	                {name: '宁夏',value: Math.round(Math.random()*1000)},
            	                {name: '海南',value: Math.round(Math.random()*1000)},
            	                {name: '台湾',value: Math.round(Math.random()*1000)},
            	                {name: '香港',value: Math.round(Math.random()*1000)},
            	                {name: '澳门',value: Math.round(Math.random()*1000)}
            	            ]
            	        },
            	        {
            	            name: '五花肉',
            	            type: 'map',
            	            mapType: 'china',
            	            itemStyle:{
            	                normal:{label:{show:true}},
            	                emphasis:{label:{show:true}}
            	            },
            	            data:[
            	                {name: '北京',value: Math.round(Math.random()*1000)},
            	                {name: '天津',value: Math.round(Math.random()*1000)},
            	                {name: '上海',value: Math.round(Math.random()*1000)},
            	                {name: '重庆',value: Math.round(Math.random()*1000)},
            	                {name: '河北',value: Math.round(Math.random()*1000)},
            	                {name: '安徽',value: Math.round(Math.random()*1000)},
            	                {name: '新疆',value: 1000},
            	                {name: '浙江',value: Math.round(Math.random()*1000)},
            	                {name: '江西',value: Math.round(Math.random()*1000)},
            	                {name: '山西',value: Math.round(Math.random()*1000)},
            	                {name: '内蒙古',value: Math.round(Math.random()*1000)},
            	                {name: '吉林',value: Math.round(Math.random()*1000)},
            	                {name: '福建',value: Math.round(Math.random()*1000)},
            	                {name: '广东',value: Math.round(Math.random()*1000)},
            	                {name: '西藏',value: Math.round(Math.random()*1000)},
            	                {name: '四川',value: Math.round(Math.random()*1000)},
            	                {name: '宁夏',value: Math.round(Math.random()*1000)},
            	                {name: '香港',value: Math.round(Math.random()*1000)},
            	                {name: '澳门',value: Math.round(Math.random()*1000)}
            	            ]
            	        },
            	        {
            	            name: '排骨',
            	            type: 'map',
            	            mapType: 'china',
            	            itemStyle:{
            	                normal:{label:{show:true}},
            	                emphasis:{label:{show:true}}
            	            },
            	            data:[
            	                {name: '北京',value: Math.round(Math.random()*1000)},
            	                {name: '天津',value: Math.round(Math.random()*1000)},
            	                {name: '上海',value: Math.round(Math.random()*1000)},
            	                {name: '广东',value: Math.round(Math.random()*1000)},
            	                {name: '台湾',value: Math.round(Math.random()*1000)},
            	                {name: '香港',value: Math.round(Math.random()*1000)},
            	                {name: '澳门',value: Math.round(Math.random()*1000)}
            	            ]
            	        }
            	    ]
            	
            	});
        }
    );
    </script>
</body>
</html>