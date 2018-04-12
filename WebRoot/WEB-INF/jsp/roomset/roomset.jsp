<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	
<!--   <link rel="stylesheet" href="${ctx}/css/roomset/roomset.css" type="text/css"></link> -->
  <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.css" type="text/css"></link>
  <link rel="stylesheet" href="${ctx}/css/page.css" type="text/css"></link>
  <link href="${ctx}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">  <!-- start 响应式布局要添加的 -->
  <script src="${ctx}/bootstrap/js/jquery-3.1.1.min.js"></script>
  <script src="${ctx}/bootstrap/js/bootstrap.js"></script>
  <script type="text/javascript" src="${ctx}/js/page.js"></script>
   <style>
   
   .container{
     margin-top: 10px;
   }
   
    .labelroomnumber{
      position: relative;
      font-size: 17px;
      float: left;
      margin-top: 15px;
    }
    
    .textone{
    margin-top:12px;
    }
    
    .rightOne{
    margin-right: 50px;
    font-size:16px;
    }
    
    .table th,.table td{
       text-align: center; 
    }
    
    .theadone{
     background-color: #CAE1FF;
    }
    
    .dgvone{
      margin-top: 12px;
    }
    
    .roomnumberwidth{
      width:70%;
    }
    
  	/*
  	.edit_del{
  		border: 0px solid transparent !important;
  	}
  	*/
  	
  </style>
  
 </head>
  
 
  <body>
  <div class="container" style="height:630px;overflow-x:auto;">
    <div class="span5">
	    <div class="row-fluid">
		    <form action="${ctx}/RoomSet/tolist.do" method="post" style="float: left;">
			   <input id="txtnameid" name="txtname" class="textone roomnumberwidth" style="border-radius:0px; border-top-left-radius:4px; border-bottom-left-radius:4px;height:26px;" type="text" placeholder="请输入房间号" value="${txtname}">
			   <div class="input-append">  
			      <button type="submit" class="btn btn-success  btn-small textone" style="margin-left:-5px;height:26px;width: 45px;">搜索</button>
			   </div>
		    </form>
	    </div>
    </div>
    <div class="span6">
      <div class="row-fluid">
       <div class="span3">
         <button class="btn btn-info btn-small textone" type="button" onclick="addfunction()"><li class="icon-plus icon-white"></li>新增</button>
       </div>
       <div class="span3">
         <button class="btn btn-danger btn-small textone" type="button" onclick="deletesfunction()"><li class="icon-remove icon-white"></li>批量删除</button>
       </div>
      </div>
    </div>
    <br>
    <div class="dgvone">
       <table class="table table-condensed table-bordered table-striped table-hover" id="tableid">
	      <thead class="theadone">
	        <tr>
	          <th rowspan="2">选择</th>
	          <th rowspan="2">房间号</th>
	          <th rowspan="2">客房等级</th>
	          <th rowspan="2">房态</th>
	          <th rowspan="2">床位数</th>
	          <th rowspan="2">标准客房/天</th>
	          <th colspan="4">钟点房价设置</th>
	          <th rowspan="2">操作</th>
	        </tr>
	        <tr>
	          <th >标准房价/小时</th>
	          <th >时长限制(小时)</th>
	          <th >首段时长(小时)</th>
	          <th >首段价格</th>
	        </tr>
	      </thead>
	      <tbody id="tbody" >
	        <c:forEach items="${list.result}" var="item">		       
		        <tr>
		          <td><input type="checkbox" name="id" value="${item.id}"></td>
		          <td>${item.roomNumber}</td>
		          <td>${item.guestRoomLevelName}</td>
		          <td>${item.roomName}</td>
		          <td>${item.roomAmount}</td>
		          <td>￥${item.standardPriceDay}</td>
		          <td>￥${item.standardPrice}</td>
		          <td>${item.maxDuration}</td>
		          <td>${item.firstDuration}</td>
		          <td>￥${item.firstPrice}</td>	
	        	  <td class="edit_del">
		          	<button class="btn btn-warning btn-small" type="button" onclick="updatefunction(${item.id})">修改</button>
		          	<button class="btn btn-danger btn-small" type="button" onclick="deletefunction(${item.id})">删除</button>
		          </td>          
		        </tr>	    
	        </c:forEach>
	      </tbody>
	    </table>
    </div>
    <div class="span11">
      <div class="row-fluid">
        <div class="tcdPageCode" style="text-align:center;"></div>
      </div>
    </div>
  </div>
  
 
 
 
 
 <script type="text/javascript">
   function addfunction(){
     parent.document.getElementById('Mainid').src='${ctx}/RoomSet/toadd.do';
   }
   //修改按钮 
   function updatefunction(item_id){
	    var chk_value=item_id;	  		  	
	  	if(chk_value!=""){			
			   parent.document.getElementById("Mainid").src='${ctx}/RoomSet/toupdate.do?id='+chk_value;
		}
  }
   //批量删除按钮
   function deletesfunction(){
   var chk_value=[];
	  	$('input[name="id"]:checked').each(function(){
	  		chk_value.push($(this).val());
	  	});
	  	if(chk_value!=""&& chk_value.length>1){
		  	var flag=window.confirm("注意：您确定要永久删除该信息吗?");
			     if(flag){
			  	  parent.document.getElementById("Mainid").src='${ctx}/RoomSet/delete.do?id='+chk_value;
		  	}
	  	}else{
	  		alert("请选择多条数据进行删除");
	  	}
  }
  //删除按钮 
   function deletefunction(item_id){
	   var chk_value=item_id;
	  	if(chk_value!=""){
		  	var flag=window.confirm("注意：您确定要永久删除该信息吗?");
		     if(flag){
		  	  parent.document.getElementById("Mainid").src='${ctx}/RoomSet/delete.do?id='+chk_value;
		  	}
	  	}
	  }
  
  /* function selectFunction(){
    var tbody = document.getElementById("tbody");
    var name=document.getElementById("txtnameid").value;
    var i=0;
    
    $("#tbody").empty();                              //删除所有行
    $.ajax({                                                      
          cache:false,                                             //是否使用缓存提交 如果为TRUE 会调用浏览器的缓存 而不会提交
          type: "POST",                                           //上面3行都是必须要的
          url: '${ctx}/RoomSet/fuzzyfind.do',       //地址 type 带参数
          data:"txtname="+name,                         // IDCardValue 自定义的。相当于name把值赋予给 他可以在servlet 获取
//        dataType:"json",                                       // json 数据类型提交 
          async:false,  
          success: function (result) {  
            for (var key in result) { 
                i++;               
                var item = result[key];
                var tr = tbody.insertRow(-1); //FireFox必须使用-1这个参数
               
                var tdcheckbox = tr.insertCell(-1);
                var tdroomNumber = tr.insertCell(-1);
                var tdguestRoomLevelName = tr.insertCell(-1);
                var tdroomName = tr.insertCell(-1);
                var tdroomAmount = tr.insertCell(-1);
                var tdstandardPriceDay = tr.insertCell(-1);
                var tdstandardPrice = tr.insertCell(-1);
                var tdmaxDuration = tr.insertCell(-1);
                var tdfirstDuration = tr.insertCell(-1);
                var tdfirstPrice = tr.insertCell(-1);
                
                tdcheckbox.innerHTML = "<input type='checkbox' name='id' value='"+item.id+"'>";
                tdroomNumber.innerHTML = item.roomNumber;
                tdguestRoomLevelName.innerHTML = item.guestRoomLevelName;
                tdroomName.innerHTML =item.roomName;
                tdroomAmount.innerHTML =item.roomAmount;
                tdstandardPriceDay.innerHTML ="￥"+item.standardPriceDay;
                tdstandardPrice.innerHTML ="￥"+item.standardPrice;
                tdmaxDuration.innerHTML =item.maxDuration;
                tdfirstDuration.innerHTML =item.firstDuration;
                tdfirstPrice.innerHTML ="￥"+item.firstPrice;
            }
            if(i==0){
              alert("很抱歉！没有查找到你要找的数据");
            }               
          },
          error: function(data) {
           
           }
      });
   } */
   
   
   
   /* 分页要用的 */
   $(".tcdPageCode").createPage({
     pageCount:${list.totalPage},
     current:${list.currentPage},
     backFn:function(p){
     var txtname=document.getElementById("txtnameid").value;
     location.href="${ctx}/RoomSet/tolist.do?currentPage="+p+"&txtname="+txtname;
     }
   });
  
 </script>
   
  </body>
</html>
