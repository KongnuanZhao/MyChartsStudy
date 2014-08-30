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
    <script type="text/javascript">
    require.config({
        paths:{ 
            echarts:'./js/echarts',
            'echarts/chart/map' : './js/echarts-map'
        }
    });

      //动态加载echarts，在回掉函数中使用，要注意保持按需加载结构定义图表路径

        require(

        [

            'echarts',

            'echarts/chart/map'

        ],

        function (ec) {

            var myChart=ec.init(document.getElementById('main'));

            //option主要是图标的一些设置，这不是这篇文章的重点，关于具体的设置可以参考官方的文档说明文档

option= {
		 title : {
		        text: '2014全国GDP（亿元）',
		        subtext: '数据来自国家统计局'
		    },
		    tooltip : {
		        trigger: 'item'
		    },
		    legend: {
		        x:'right',
		        selectedMode:false,
		        data:['北京','上海','广东']
		    },
		    dataRange: {
		        orient: 'horizontal',
		        min: 0,
		        max: 55000,
		        text:['高','低'],           // 文本，默认为数值文本
		        splitNumber:0
		    },
		    toolbox: {
		        show : true,
		        orient: 'vertical',
		        x:'right',
		        y:'center',
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: false}
		        }
		    },

		    series : [
		              {
		                  name: '2011全国GDP分布',
		                  type: 'map',
		                  mapType: 'china',
		                  mapLocation: {
		                      x: 'left'
		                  },
		                  selectedMode : 'multiple',
		                  itemStyle:{
		                      normal:{label:{show:true}},
		                      emphasis:{label:{show:true}}
		                  },
		                  data:[
		                      {name:'西藏', value:605.83},
		                      {name:'青海', value:1670.44},
		                      {name:'宁夏', value:2102.21},
		                      {name:'海南', value:2522.66},
		                      {name:'甘肃', value:5020.37},
		                      {name:'贵州', value:5701.84},
		                      {name:'新疆', value:6610.05},
		                      {name:'云南', value:8893.12},
		                      {name:'重庆', value:10011.37},
		                      {name:'吉林', value:10568.83},
		                      {name:'山西', value:11237.55},
		                      {name:'天津', value:11307.28},
		                      {name:'江西', value:11702.82},
		                      {name:'广西', value:11720.87},
		                      {name:'陕西', value:12512.3},
		                      {name:'黑龙江', value:12582},
		                      {name:'内蒙古', value:14359.88},
		                      {name:'安徽', value:15300.65},
		                      {name:'北京', value:16251.93, selected:true},
		                      {name:'福建', value:17560.18},
		                      {name:'上海', value:19195.69, selected:true},
		                      {name:'湖北', value:19632.26},
		                      {name:'湖南', value:19669.56},
		                      {name:'四川', value:21026.68},
		                      {name:'辽宁', value:22226.7},
		                      {name:'河北', value:24515.76},
		                      {name:'河南', value:26931.03},
		                      {name:'浙江', value:32318.85},
		                      {name:'山东', value:45361.85},	                    
		                      {name:'江苏', value:49110.27},
		                      {name:'广东', value:53210.28, selected:true}
		                  ]
		              },
		              {
		                  name:'2011全国GDP对比',
		                  type:'pie',
		                  roseType : 'area',
		                  tooltip: {
		                      trigger: 'item',
		                      formatter: "{a} <br/>{b} : {c} ({d}%)"
		                  },
		                  center: [document.getElementById('main').offsetWidth - 250, 225],
		                  radius: [30, 120],
		                  data:[
		                      {name: '北京', value: 16251.93},
		                      {name: '上海', value: 19195.69},
		                      {name: '广东', value: 53210.28}	                 
		                  ]
		              }
		          ],    
		          animation: false
};
              //以下的这段代码主要是用来处理用户的选择，应用场景是可以做地图的交互，比如点击地图上的某一个省，获取相应的省的指标变化等。
             //需要特别注意的是，如果需要点击某一省作地图的操作交互的话，还需要为series属性的每一项添加一个selectedMode属性，这里的属性值为 'single'即单选，也可多选
var ecConfig= require('echarts/config');
myChart.on(ecConfig.EVENT.MAP_SELECTED,function (param) {
    var selected=param.selected;
   var mapSeries=option.series[0];
    var data= [];
    var legendData= [];
    var name;
    for (var p=0,len=mapSeries.data.length; p<len; p++) {
        name=mapSeries.data[p].name;
        mapSeries.data[p].selected=selected[name];
        if (selected[name]) {
           // alert(name); //这里只是简单的做一个事例说明，弹出用户所选的省，如需做其他的扩展，可以在这里边添加相应的操作 
            data.push({
                name: name,
                value: mapSeries.data[p].value
            });
           
            legendData.push(name);
        }
    }
    option.legend.data = legendData;
    option.series[1].data = data;
    myChart.setOption(option);
    
}

);   
myChart.setOption(option);

}
);

    </script>
</body>
</html>