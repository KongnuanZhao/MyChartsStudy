<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@page import="tools.*"%>
<%@page import="net.sf.json.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>居民消费指数</title>
</head>
  <link href="./css/page.css" rel="stylesheet" type="text/css"/> 
  <link rel="stylesheet" href="./css/bootstrap.css" type="text/css">
    <script type="text/javascript" src="./js/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="./js/zebra_datepicker.js"></script>
    <script type="text/javascript" src="./js/core.js"></script>
   
 
<body>
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

<%
    JSONTest jsTest=new JSONTest();
    %> 
    
<form name="frm" action ="mix1.jsp" method="post" target="lineiframe"> 
请选择：
<select name="s1" onChange="redirec(document.frm.s1.options.selectedIndex)"> 
<option value="整体" selected>整体</option> 
<option value="食品类">食品类</option> 
<option value="烟酒及用品类">烟酒及用品类</option> 
<option value="衣着类">衣着类</option> 
<option value="家庭设备用品及维修服务类">家庭设备用品及维修服务类</option> 
<option value="医疗保健和个人用品类">医疗保健和个人用品类</option> 
<option value="交通和通讯类">交通和通讯类</option> 
<option value="娱乐教育文化用品及服务类">娱乐教育文化用品及服务类</option> 
<option value="居住类">居住类</option> 
</select> 

<select name="s2"> 
<option value="请选择" selected>请选择</option> 
</select> 
 <input type="submit" name="button">
</form> 

<br/>
 <iframe id="lineiframe" name="lineiframe" src="mix1.jsp" width="100%" height="520px"></iframe> 
<div id ="bottom" style="text-align:right"><a href="./index.html"><img src="img/图标2.png" title="返回首页"></img></a></div>
</body>

 <script type="text/javascript" src="./js/select_f.js"></script>
</html>