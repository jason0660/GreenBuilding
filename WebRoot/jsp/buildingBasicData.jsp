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
			
			var L = document.getElementById('L').value;
			var R = document.getElementById('R').value;
			var H = document.getElementById('H').value;
			var BR = document.getElementById('BR').value;
			var AR = document.getElementById('AR').value;
			var B1R = document.getElementById('B1R').value;
			var ALLR = document.getElementById('ALLR').value;
			var ALLGR = document.getElementById('ALLGR').value;

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
			
			if(L == ""){
				alert("请输入楼层数！");
				return;
			}
			
			if(R == ""){
				alert("请输入居住用地面积！");
				return;
			}
			
			if(H == ""){
				alert("请输入住宅户数！");
				return;
			}
			
			/*if(BR == ""){
				alert("请输入地下建筑面积！");
				return;
			}*/
			
			if(AR == ""){
				alert("请输入地上建筑面积！");
				return;
			}
			
			/*if(B1R == ""){
				alert("请输入地下一层建筑面积！");
				return;
			}*/
			
			if(ALLR == ""){
				alert("请输入总用地面积！");
				return;
			}
			
			if(ALLGR == ""){
				alert("请输入总绿地面积！");
				return;
			}
			
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/saveBuildingBasicData",
	       		data: "jzmc="+jzmc+"&jzdz="+jzdz+"&jzlx="+jzlx+"&L="+L+"&R="+R+"&H="+H+"&BR="+BR+"&AR="+AR+"&B1R="+B1R+"&ALLR="+ALLR+"&ALLGR="+ALLGR,
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
	        		document.getElementById('L').value;
					document.getElementById('R').value = "";
					document.getElementById('H').value = "";
					document.getElementById('BR').value = "";
					document.getElementById('AR').value = "";
					document.getElementById('B1R').value = "";
					document.getElementById('ALLR').value = "";
					document.getElementById('ALLGR').value = "";
	        	},
	        	error: function(XMLResponse){
	        		alert("qError!");
	        	}	
	   	    });
		}
	</script>
</head>
<body style="border:0px solid #F00;width:99%;">
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
    <div>
    	<table class="table table-striped table-bordered table-hover">
    		<tr>
             	<td align="right">
             		楼层数：
             	</td>
             	<td>
             		<input id="L" type="text" style="width:100%;"></input>
             	</td>
             	<td align="right">
             		居住用地面积：
             	</td>
             	<td>
             		<input id="R" type="text" style="width:100%;"></input>
             	</td>
             	<td align="right">
             		住宅户数：
             	</td>
             	<td>
             		<input id="H" type="text" style="width:100%;"></input>
             	</td>
             	<td align="right">
             		地下建筑面积：
             	</td>
             	<td>
             		<input id="BR" type="text" style="width:100%;"></input>
             	</td>
             </tr>
             <tr>
             	<td align="right">
             		地上建筑面积：
             	</td>
             	<td>
             		<input id="AR" type="text" style="width:100%;"></input>
             	</td>
             	<td align="right">
             		地下一层建筑面积：
             	</td>
             	<td>
             		<input id="B1R" type="text" style="width:100%;"></input>
             	</td>
             	<td align="right">
             		总用地面积：
             	</td>
             	<td>
             		<input id="ALLR" type="text" style="width:100%;"></input>
             	</td>
             	<td align="right">
             		总绿地面积：
             	</td>
             	<td>
             		<input id="ALLGR" type="text" style="width:100%;"></input>
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