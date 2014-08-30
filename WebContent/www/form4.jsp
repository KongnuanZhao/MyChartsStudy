<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@page import="tools.*"%>
<%@page import="net.sf.json.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品流通情况</title>
</head>
  <link href="./css/page.css" rel="stylesheet" type="text/css"/> 
   <link href="./css/bootstrap.css" rel="stylesheet" type="text/css"/> 
    <script type="text/javascript" src="./js/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="./js/zebra_datepicker.js"></script>
    <script type="text/javascript" src="./js/core.js"></script>    
     <script type="text/javascript" src="./asset/js/menu-js.js"></script>
 <!-- <script type="text/javascript" src="./asset/js/jquery.min.js"></script> -->
<body>
<div id ="select" ><div id="header">
<div id="nav" class="nav">
<ul>
  <li id="mainlevel_01" class="first-crl mainlevel">
  <a class="nav-a"   href="./index.html">首页</a> 
  </li>
  <li id="mainlevel_02" class="mainlevel">
  <a class="nav-a">价格预测</a> 
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
  <a class="nav-a" href="./form3.jsp" target="_blank">商品流通情况</a> </li>
  <li id="mainlevel_05" class="mainlevel">
  <a class="nav-a" href="./map9.jsp" target="_blank">各农作物产地</a> </li>
  <li id="mainlevel_07" class="mainlevel">
  <a class="nav-a" href="./form4.jsp" target="_blank">价格预测</a> </li>
   <li id="mainlevel_08" class="end-crl mainlevel">
   <a class="nav-a" href="#">关于更多</a> </li>
  </ul></div>
  </div><!-- end of the header --></div>

<%
    JSONTest jsTest=new JSONTest();
   // double [] temp =jsTest.SelectPrice();
    %>

  <form method="post" action ="predict.jsp" target="id_iframe">
    <%for(int k=0;k<jsTest.SelectGoodsname().length;k++) {
    if(k==0){%>
     <input type="radio"  name="colname" checked value="<%=jsTest.SelectGoodsname()[k]%>">
      <%=jsTest.SelectGoodsname()[k]%>
     <%}else{%>
       <input type="radio"  name="colname" value="<%=jsTest.SelectGoodsname()[k]%>"> 
  <%=jsTest.SelectGoodsname()[k]%>
  <%}}%>
  <input type="submit" name="button">
  </form>
            
 <br/>    
 <iframe frameborder="no" id="id_iframe" name="id_iframe" src="predict.jsp" width="100%" height="520px"></iframe> 
<div id ="bottom" style="text-align:right"><a href="./index.html"><img src="img/图标2.png" title="返回首页"></img></a></div>
</body>

</html>