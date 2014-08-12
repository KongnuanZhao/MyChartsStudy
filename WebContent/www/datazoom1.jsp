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
</head>

<body style="text-align:center">
   <div id ="select" ><div id ="smenu">
	<ul>
    	<li><a href="./index.html" target="_blank">首页</a></li>
        <li><a href="./datazoom1.jsp" target="_blank">价格走势</a></li>
        <li><a href="./form.jsp" target="_blank">价格对比</a></li>
        <li><a href="./pie7.jsp" target="_blank">CPI比例</a></li>
        <li><a href="./map2.jsp" target="_blank">全国商品价格</a></li>
        <li><a href="./form2.jsp" target="_blank">居民消费指数</a></li>
        <li><a href="./map11.jsp" target="_blank">商品进出口</a></li>
        <li><a href="./map9.jsp" target="_blank">各农作物产地</a></li>
        <li><a href="#" target="_blank">价格预测</a></li>
    </ul>
</div></div>
     <div id="main" style="height:400px;width:80%;border:1px solid #ccc;padding :10px"></div>
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
            'echarts/chart/map' : './js/echarts-map'
        }
    });
    
    // Step:4 require echarts and use it in the callback.
    require(
        [
            'echarts',
            'echarts/chart/bar',
            'echarts/chart/line',
          
        ],
        function (ec) {
            //--- 折柱 ---
            var myChart = ec.init(document.getElementById('main'));
            myChart.setOption({
            	title : {
                    text: '各商品平均价格走势',
                   // subtext: '纯属虚构'
                },
            	tooltip : {
                trigger: 'axis'
            },
            legend: {
            	//selectedMode:'single',
            	orient: 'vertical',
            	x: 'right',
            	y:'center',
                data:<%=jsTest.stringArray(jsTest.SelectGoodsname())%>,
                selected: {
                	<% for(int i=1;i<jsTest.SelectGoodsname().length;i++){%>
                	   <%=jsTest.SelectGoodsname()[i]%> : false,
                  <%}%>
                }
            },
            toolbox: {
                show : true,
                x:'center',
                feature : {
                    mark : {show: true},
                    dataZoom : {show: true},
                    dataView : {show: true},
                    magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            dataZoom : {
                show : true,
                realtime : true,
                start : 1,
                end : 10
            },
            xAxis : [
                {
                    type : 'category',
                    boundaryGap : false,
                    data : <%=jsTest.Arraylistjson(jsTest.SelectDate())%>
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                      <% for(int i=0;i<jsTest.SelectGoodsname().length;i++){%>
                {
                    name:'<%=jsTest.SelectGoodsname()[i]%>',
                    type:'line',
                    data:<%=jsTest.ArraylistFjson(jsTest.SelectPrice(jsTest.SelectGoodsname()[i]))%>
                },
                <%}%>
               
            ]
            	
            });
            
         
        }
    );
    </script>
</body>
</html>