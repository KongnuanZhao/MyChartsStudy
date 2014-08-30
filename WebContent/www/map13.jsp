<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@page import="tools.*"%>
<%@page import="net.sf.json.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>各省月度CPI</title>
    <script src="js/esl.js"></script>
     <link href="./css/page.css" rel="stylesheet" type="text/css"/>
     <script type="text/javascript" src="./asset/js/jquery.min.js"></script>
     <script type="text/javascript" src="./asset/js/menu-js.js"></script> 
</head>

<body>
     <div id ="select" >
     <div id="header">
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
<%
    JSONTest jsTest=new JSONTest();
    String []cities=new String[]{"北京","天津","河北","山西","内蒙古","辽宁","吉林","黑龙江","上海","江苏","浙江","安徽","福建","江西","山东","河南","湖北","湖南","广东","广西","海南","重庆","四川","贵州","云南","西藏","陕西","甘肃","青海","宁夏","新疆"};
    %>

<br/><br/>
     <div id="main"></div>
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
            	 timeline:{
            	        data:[
            	            '2013-06-01', '2013-07-01', '2013-08-01', '2013-09-01', '2013-10-01','2013-11-01','2013-12-01',
                        { name:'2013-12-01', symbol:'emptyStar6', symbolSize:8 },
                        '2014-01-01', '2014-02-01', '2014-03-01', '2014-04-01', '2014-05-01','2014-06-01',
                        { name:'2014-06-01', symbol:'star6', symbolSize:8 }
            	        ],
            	        label : {
            	            formatter : function(s) {
            	                return s.slice(0, 7);
            	            }
            	        },
            	        autoPlay : true,
            	        playInterval : 1000
            	    },
            	    options:[
            	        {
            	            title : {
            	                'text':'2013年6月全国居民消费指数',
            	                'subtext':'数据来自国家统计局'
            	            },
            	            tooltip : {'trigger':'item'},
            	            toolbox : {
            	                'show':true, 
            	                'feature':{
            	                    'mark':{'show':true},
            	                    'dataView':{'show':true,'readOnly':false},
            	                    'restore':{'show':true},
            	                    'saveAsImage':{'show':true}
            	                }
            	            },
            	            dataRange: {
            	            	min: 99,
            	                max : 105,
            	                text:['高','低'],           // 文本，默认为数值文本
            	                calculable : true,
            	                x: 'left',
            	                color: ['orangered','yellow','lightskyblue']
            	            },
            	            series : [
            	                {
            	                    'name':'GDP',
            	                    'type':'map',
            	                   'data' : [<%for(int i=0;i<31;i++){%>
            	                               {name:'<%=cities[i]%>',value: <%=jsTest.SelectMonthCPI(14)[i]%>},
            	                            <%}%>
            	                            ]
            	                } ,
            	                { 
                    	            title : {'text':'2013年7月全国居民消费指数'},
                    	            series : [
                    	                {
                    	                	'data' : [<%for(int i=0;i<31;i++){%>
         	                               {name:'<%=cities[i]%>',value: <%=jsTest.SelectMonthCPI(13)[i]%>},
         	                            <%}%>]
               	                        }
                    	            ]
                    	        },
                    	        {
                    	            title : {'text':'2013年8月全国居民消费指数'},
                    	            series : [
                    	                {'data' : [<%for(int i=0;i<31;i++){%>
        	                               {name:'<%=cities[i]%>',value: <%=jsTest.SelectMonthCPI(12)[i]%>},
           	                            <%}%>]
        								}
                    	            ]
                    	        },
                    	        {
                    	            title : {'text':'2013年9月全国居民消费指数'},
                    	            series : [
                    	                {'data' : [<%for(int i=0;i<31;i++){%>
        	                               {name:'<%=cities[i]%>',value: <%=jsTest.SelectMonthCPI(11)[i]%>},
           	                            <%}%>]
           	                            }
                    	            ]
                    	        },{
                    	            title : {'text':'2013年10月全国居民消费指数'},
                    	            series : [
                    	                {'data' :[ <%for(int i=0;i<31;i++){%>
        	                               {name:'<%=cities[i]%>',value: <%=jsTest.SelectMonthCPI(10)[i]%>},
           	                            <%}%>]
           	                            }
                    	            ]
                    	        },
                    	        {
                    	            title : {'text':'2013年11月全国居民消费指数'},
                    	            series : [
                    	                {'data' :[ <%for(int i=0;i<31;i++){%>
        	                               {name:'<%=cities[i]%>',value: <%=jsTest.SelectMonthCPI(9)[i]%>},
           	                            <%}%>]
           	                            }
                    	            ]
                    	        },
                    	        {
                    	            title : {'text':'2013年12月全国居民消费指数'},
                    	            series : [
                    	                {'data' : [<%for(int i=0;i<31;i++){%>
        	                               {name:'<%=cities[i]%>',value: <%=jsTest.SelectMonthCPI(8)[i]%>},
           	                            <%}%>]
           	                            }
                    	            ]
                    	        },
                    	        {
                    	            title : {'text':'2014年1月全国居民消费指数'},
                    	            series : [
                    	                {'data' : [<%for(int i=0;i<31;i++){%>
        	                               {name:'<%=cities[i]%>',value: <%=jsTest.SelectMonthCPI(7)[i]%>},
           	                            <%}%>]
           	                            }
                    	            ]
                    	        },
                    	        {
                    	            title : {'text':'2014年2月全国居民消费指数'},
                    	            series : [
                    	                {'data' : [<%for(int i=0;i<31;i++){%>
        	                               {name:'<%=cities[i]%>',value: <%=jsTest.SelectMonthCPI(6)[i]%>},
           	                            <%}%>]
           	                            }
                    	            ]
                    	        },
                    	        {
                    	            title : {'text':'2014年3月全国居民消费指数'},
                    	            series : [
                    	                {'data' :[ <%for(int i=0;i<31;i++){%>
        	                               {name:'<%=cities[i]%>',value: <%=jsTest.SelectMonthCPI(5)[i]%>},
           	                            <%}%>]
           	                            }
                    	            ]
                    	        },
                    	        {
                    	            title : {'text':'2014年4月全国居民消费指数'},
                    	            series : [
                    	                {'data' : [<%for(int i=0;i<31;i++){%>
        	                               {name:'<%=cities[i]%>',value: <%=jsTest.SelectMonthCPI(4)[i]%>},
           	                            <%}%>]
           	                            }
                    	            ]
                    	        },
                    	        {
                    	            title : {'text':'2014年5月全国居民消费指数'},
                    	            series : [
                    	                {'data' :[ <%for(int i=0;i<31;i++){%>
        	                               {name:'<%=cities[i]%>',value: <%=jsTest.SelectMonthCPI(3)[i]%>},
           	                            <%}%>]
           	                            }
                    	            ]
                    	        },{
                    	            title : {'text':'2014年6月全国居民消费指数'},
                    	            series : [
                    	                {'data' :[ <%for(int i=0;i<31;i++){%>
        	                               {name:'<%=cities[i]%>',value: <%=jsTest.SelectMonthCPI(2)[i]%>},
           	                            <%}%>]
           	                            }
                    	            ]
                    	        }
            	           
            	            ]
            	        },
            	        
            	    ]
            	    });
        }
    );
    </script>
</body>
</html>