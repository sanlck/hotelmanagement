
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>酒店管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
   <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
   <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
   <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="${ctx}/css/login/login.css"></link>
  </head>
  <body>
	  <div class="container">
        <div class="form row">
            <div class="form-horizontal col-md-offset-3" id="login_form">
                <h3>用户登录</h3>
                <form id="form1" class="form-horizontal" action="${ctx}/Login/tomain.do" method="post" onsubmit="return check()">
                <div class="col-md-9">
                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i>
                        <input class="form-control required" type="text" placeholder="用户名" id="userName" name="userName" autofocus="autofocus" maxlength="20"/>
                    </div>
                    <div class="form-group">
                            <i class="fa fa-lock fa-lg"></i>
                            <input class="form-control required" type="password" placeholder="密码" id="passWord" name="passWord" maxlength="8"/>
                    </div>
                    <div class="form-group" >
                    	<p class="message"></p>
                    </div>
                  
                    <div class="form-group col-md-offset-9">
                        <button type="button" onclick="$('#form1').submit()" class="btn btn-success pull-right">登录</button>
                    </div>
                </div>
            	</form>
            	
            </div>
        </div>
    </div>
    <script type="text/javascript">
	    function check()
		{
			var userName = $("#userName").val();
			var passWord = $("#passWord").val();
			if(userName==null||userName.trim()==""){
				$(".message").html("用户名不能为空 !");
				return false;
			}else{
				if(passWord==null||passWord.trim()==""){
					$(".message").html("密码不能为空 !");
					return false;
				}else{
					return true;
				}
			}	
		}
	</script>
</body>
</html>
