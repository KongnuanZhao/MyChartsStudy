<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@page import="tools.*"%>
<%@page import="net.sf.json.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <script src="./js/esl.js"></script>
     <link href="./css/page.css" rel="stylesheet" type="text/css"/> 
       <script src="./asset/js/jquery.min.js"></script>
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
    <li><a href="./map13.jsp">各省月度CPI</a></li>
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
     <div id="main"></div>
    <div id ="bottom" style="text-align:right"><a href="./index.html"><img src="img/图标2.png" title="返回首页"></img></a></div>
     <%
    JSONTest jsTest=new JSONTest();
    //double [] temp =jsTest.SelectPrice();
    %>
   


<script type="text/javascript">
require.config({
        paths:{ 
            echarts:'./js/echarts',
            'echarts/chart/bar' : './js/echarts-map',
            'echarts/chart/line': './js/echarts-map',
            'echarts/chart/map' : './js/echarts-map',
            //'echarts/util/mapData/params':'./util/mapData/params'
        }
    });


require(
        [
            'echarts',
            'echarts/chart/bar',
            'echarts/chart/line',
            'echarts/chart/map',
           // 'echarts/util/mapData/params'
        ],
        function (ec) {
            //--- 折柱 ---
//这个requie到底是require的什么？是里面的方法吧
        require('echarts/util/mapData/params').params.HK = {
                getGeoJson: function (callback) {
            $.getJSON('geoJson/潍坊.json',callback);
            }
        }
            var myChart = ec.init(document.getElementById('main'));
      
var option={
    title : {
        text : '大潍坊',
        subtext: '找你找的好辛苦',
        sublink: ''
    },
    tooltip : {
        trigger: 'item',
        formatter: '{b}<br/>{c} (p / km2)'
    },
    toolbox: {
        show : true,
        orient : 'vertical',
        x: 'right',
        y: 'center',
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    dataRange: {
        min: 800,
        max: 50000,
        text:['High','Low'],
        realtime: false,
        calculable : true,
        color: ['orangered','yellow','lightskyblue']
    },
    series : [
        {
            name: '大潍坊',
            type: 'map',
            mapType: 'HK', // 自定义扩展图表类型
            itemStyle:{
                normal:{label:{show:true}},
                emphasis:{label:{show:true}}
            },
            data:[
                {name: '安丘市', value: 20057.34},
                {name: '昌乐县', value: 15477.48},
                {name: '昌邑市', value: 31686.1},
                {name: '坊子区', value: 6992.6},
                {name: '高密市', value: 44045.49},
                {name: '寒亭区', value: 40689.64},
                {name: '奎文区', value: 37659.78},
                {name: '临朐县', value: 45180.97},
                {name: '青州市', value: 55204.26},
                {name: '寿光市', value: 21900.9},
                {name: '潍城区', value: 4918.26},
                {name: '诸城市', value: 5881.84}
                
            ],
          
            // 文本位置修正
            textFixed : {
                'Yau Tsim Mong' : [-10, 0]
            },
            // 文本直接经纬度定位
            geoCoord : {
                'Islands' : [113.95, 22.26]
            }
        }
]

}
            myChart.setOption(option);
            
        }
    );
</script>
</body>
</html>