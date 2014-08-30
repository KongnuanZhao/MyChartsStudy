<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@page import="tools.*"%>
<%@page import="net.sf.json.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>CPI比例</title>
    <script src="./js/esl.js"></script>
     <script src="./js/pie.js"></script>
     <script src="./js/pie1.js"></script>
     <script src="./js/tab2.js"></script>
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
    
    <br/></br>
    <div class="menu">
<ul>
<li><a href="#" onmouseover="easytabs('1', '1');" onfocus="easytabs('1', '1');"   title="" id="tablink1">食品类</a></li>
<li><a href="#" onmouseover="easytabs('1', '2');" onfocus="easytabs('1', '2');"   title="" id="tablink2">娱乐教育文化用品及服务类 </a></li>
<li><a href="#" onmouseover="easytabs('1', '3');" onfocus="easytabs('1', '3');"   title="" id="tablink3">交通和通信类</a></li>
<li><a href="#" onmouseover="easytabs('1', '4');" onfocus="easytabs('1', '4');"   title="" id="tablink4">医疗保健和个人用品类 </a></li>
<li><a href="#" onmouseover="easytabs('1', '5');" onfocus="easytabs('1', '5');"   title="" id="tablink5">家庭设备用品及维修服务类 </a></li>
<li><a href="#" onmouseover="easytabs('1', '6');" onfocus="easytabs('1', '6');"   title="" id="tablink6">居住类 </a></li>
<li><a href="#" onmouseover="easytabs('1', '7');" onfocus="easytabs('1', '7');"   title="" id="tablink7">衣着类 </a></li>
<li><a href="#" onmouseover="easytabs('1', '8');" onfocus="easytabs('1', '8');"   title="" id="tablink8">烟酒类 </a></li>

</ul>
</div>
<!--Start Tabcontent 1 -->
<div id="tabcontent1">
  <div id="main1" style="height:400px;width:85%;border:1px solid #ccc;padding :10px"></div>
</div>

<!--End Tabcontent 1-->

<!--Start Tabcontent 2-->
<div id="tabcontent2">
 <div id="main2" style="height:400px;width:85%;border:1px solid #ccc;padding :10px"></div>
</div>
<!--End Tabcontent 2-->
 <!--Start Tabcontent 3-->
<div id="tabcontent3">
 <div id="main3" style="height:400px;width:85%;border:1px solid #ccc;padding :10px"></div>
</div>
<!--End Tabcontent 3-->
<!--Start Tabcontent 4-->
<div id="tabcontent4">
 <div id="main4" style="height:400px;width:85%;border:1px solid #ccc;padding :10px"></div>
</div>
<!--End Tabcontent 4-->
<!--Start Tabcontent 5-->
<div id="tabcontent5">
 <div id="main2" style="height:400px;width:85%;border:1px solid #ccc;padding :10px"></div>
</div>
<!--End Tabcontent 5-->
<!--Start Tabcontent 6-->
<div id="tabcontent6">
 <div id="main2" style="height:400px;width:85%;border:1px solid #ccc;padding :10px"></div>
</div>
<!--End Tabcontent 6-->
<!--Start Tabcontent 7-->
<div id="tabcontent7">
 <div id="main2" style="height:400px;width:85%;border:1px solid #ccc;padding :10px"></div>
</div>
<!--End Tabcontent 7-->
<!--Start Tabcontent 8-->
<div id="tabcontent8">
 <div id="main2" style="height:400px;width:85%;border:1px solid #ccc;padding :10px"></div>
</div>
<!--End Tabcontent 8-->  
    
    
    <div id ="bottom" style="text-align:right"><a href="./index.html"><img src="img/图标2.png" title="返回首页"></img></a></div> 
</body>
</html>