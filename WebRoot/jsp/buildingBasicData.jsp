<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>建筑基本信息</title>

    <!-- BOOTSTRAP STYLES-->
    <link href="/GreenBuilding/css/bootstrap.css" rel="stylesheet"/>
    <!-- FONTAWESOME STYLES-->
    <link href="/GreenBuilding/css/font-awesome.css" rel="stylesheet"/>
    <!--CUSTOM BASIC STYLES-->
    <link href="/GreenBuilding/css/basic.css" rel="stylesheet"/>
    <!--CUSTOM MAIN STYLES-->
    <link href="/GreenBuilding/css/custom.css" rel="stylesheet"/>
    <!-- GOOGLE FONTS-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
	<script type="text/javascript">
		//var jzlx="";
		function save(){
			var jzmc = document.getElementById('jzmc').value;
			var jzdz = document.getElementById('jzdz').value;
			var jzlx = document.getElementById('jzlx').value;
			if(jzmc == ""){
				alert("请输入建筑名称！");
				return;
			}
			if(jzdz == ""){
				alert("请输入建筑地址！");
				return;
			}
			if(jzlx == ""){
				alert("请选择建筑类型！");
				return;
			}
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/saveBuildingBasicData",
	       		data: "jzmc="+jzmc+"&jzdz="+jzdz+"&jzlx="+jzlx,
	       		dataType:"json",
	        	success: function(data){
	        		if(data[0] == "0"){
	        			alert("建筑数据保存失败！");
	        		}else if(data[0] == "1"){
	        			alert("建筑数据保存成功！");
	        		}
	        		document.getElementById('jzmc').value = "";
	        		document.getElementById('jzdz').value = "";
	        		document.getElementById("jzlx").options[0].selected = true;
	        	},
	        	error: function(XMLResponse){
	        		alert("qError!");
	        	}	
	   	    });
		}
	</script>
</head>
<body>
	<div class="row" style="border:0px solid #F00;">
        <div class="col-md-12">
            <h1 class="page-head-line">建筑基本信息</h1>
            <h1 class="page-subhead-line"></h1>
            
        </div>     
    </div>
	<div style="border:0px solid #F90;width:100%;height:100%;">
         <table class="table table-striped table-bordered table-hover">
             <tr>
             	<td colspan="2" align="center">
             		<h3>建筑基本信息</h3>
             	</td>
             </tr>
             <tr>
             	<td align="right">
             		建筑名称：
             	</td>
             	<td>
             		<input id="jzmc" type="text" style="width:500px;"></input>
             	</td>
             </tr>
             <tr>
             	<td align="right">
             		所在地址：
             	</td>
             	<td>
             		<input id="jzdz" type="text" style="width:600px;"></input>
             	</td>
             </tr>
             <tr>
             	<td align="right">
             		建筑类型：
             	</td>
             	<td>
             		<select id="jzlx" onchange="jzlx=this.value">
			  			<option value=""></option>
			  			<option value="1">居住建筑</option>
			  			<option value="2">公共建筑</option>
			  			<option value="3">具有居住和公共功能的单体建筑</option>
			  		</select>
             		
             	</td>
             </tr>
         </table>
    </div>
    <div style="border:0px solid #F90;height:30px;float:right;">
    	<input type="button" style="width:65px;height:25px;" onclick="save();" value="保存"></input>
    </div>
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="/GreenBuilding/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="/GreenBuilding/js/bootstrap.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="/GreenBuilding/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="/GreenBuilding/js/custom.js"></script>
<script src="/GreenBuilding/js/ajax.js"></script>
<script src="/GreenBuilding/js/jquery-1.2.3.js"></script>

</body>
</html>