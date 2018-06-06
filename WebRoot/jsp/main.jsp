<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
		var jzlx="";
		var jzid = "";
		
		function getBuilding(){
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/getBuilding",
	       		data: "",
	       		dataType:"json",
	        	success: function(data){
				    var buildingId=data[0];
	        		var buildingName=data[1];
	        		for(i=0;i<buildingId.length;i++){
	        			$("#jzmc").append("<option value='"+buildingId[i]+"'>"+buildingName[i]+"</option>");
	        		}
	        	},
	        	error: function(XMLResponse){
	        		alert("qError!");
	        	}	
	   		});
	   		document.getElementById("detailScore").style.display="none";
		}
		
		function showScore(buildingId){
			jzid = buildingId;
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/getBuildingData",
	       		data: "jzid="+jzid,
	       		dataType:"json",
	        	success: function(data){
				    var buildingId=data[0];
	        		var buildingName=data[1];
	        		document.getElementById("buildingName").innerHTML=data[1];
	        		document.getElementById("buildingAddress").innerHTML=data[2];
	        		if(data[3]=="1")
	        			document.getElementById("buildingNature").innerHTML="居住建筑";
	        		if(data[3]=="2")
	        			document.getElementById("buildingNature").innerHTML="公共建筑";
	        		if(data[3]=="3")
	        			document.getElementById("buildingNature").innerHTML="具有居住和公共功能的单体建筑";
	        		if(data[4]=="0")
	        			document.getElementById("buildingLevel").innerHTML="未达标";
	        		if(data[4]=="1")
	        			document.getElementById("buildingLevel").innerHTML="一星级";
	        		if(data[4]=="2")
	        			document.getElementById("buildingLevel").innerHTML="二星级";
	        		if(data[4]=="3")
	        			document.getElementById("buildingLevel").innerHTML="三星级";
	        	},
	        	error: function(XMLResponse){
	        		alert("qError!");
	        	}	
	   		});
	   		document.getElementById("detailScore").style.display="none";
		}
		
		function showDetailScore(jzid){
			document.getElementById("detailScore").style.display="block";
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/getDesignEvaluate",
	       		data: "jzid="+jzid,
	       		dataType:"json",
	        	success: function(data){
	        		document.getElementById("jdyswhjdf").innerHTML=data[0];
	        		document.getElementById("jnynylydf").innerHTML=data[1];
	        		document.getElementById("jsyszylydf").innerHTML=data[2];
	        		document.getElementById("jcyclzylydf").innerHTML=data[3];
	        		document.getElementById("snhjzldf").innerHTML=data[4];
	        	},
	        	error: function(XMLResponse){
	        		alert("qError!");
	        	}	
	   		});
		}
	</script>
</head>
<body onload="getBuilding();" style="border:0px solid #F00;width:99%;">
	<div class="row" style="border:0px solid #F00;">
        <div class="col-md-12">
            <h1 class="page-head-line">绿色建筑设计评估管理</h1>
            <h1 class="page-subhead-line"></h1>
            
        </div>     
    </div>
    <div style="border:0px solid #F90;float:left;width:65%">
    	<div style="border:0px solid #F00;">
	    	<table>
	    		<tr>
	    			<td>
	    				<h5><b>建筑名称：</b></h5>
	    			</td>
	    			<td>
	    				<select id="jzmc" onchange="showScore(this.value);">
			 				<option value=""></option>
			 		    </select>
	    			</td>
	    		</tr>
	    	</table>
	    </div>
    	<table border="1" class="table table-bordered" style="width:100%">
    		<tr>
    			<td>
    				绿色建筑设计评估得分
    			</td>
    		</tr>
    		<tr>
    			<td>
    				<table border="1">
    					<tr>
    						<td width="300px" align="center" style="font-weight: bold;">
    							建筑名称
    						</td>
    						<td width="480px" align="center" style="font-weight: bold;">
    							建筑地址
    						</td>
    						<td width="290px" align="center" style="font-weight: bold;">
    							建筑性质
    						</td>
    						<td width="120px" align="center" style="font-weight: bold;">
    							评价等级
    						</td>
    						<td width="120px" align="center" style="font-weight: bold;">
    							操作
    						</td>
    					</tr>
    					
    					<tr align="center">
    						<td id="buildingName"></td>
    						<td id="buildingAddress"></td>
    						<td id="buildingNature"></td>
    						<td id="buildingLevel"></td>
    						<td><input type="button" onclick="showDetailScore(jzid)" value="详细得分"/></td>
    					</tr>
    					
    				</table>
    			</td>
    		</tr>
    	</table>
    	<div id="detailScore" style="display:none;">
    		<table border="1" class="table table-bordered">
    			<tr>
					<td width="180px" align="center" style="font-weight: bold;">
						节地与室外环境评分
					</td>
					<td width="180px" align="center" style="font-weight: bold;">
						节能与能源利用评分
					</td>
					<td width="180px" align="center" style="font-weight: bold;">
						节水与水资源利用评分
					</td>
					<td width="180px" align="center" style="font-weight: bold;">
						节材与材料资源利用评分
					</td>
					<td width="180px" align="center" style="font-weight: bold;">
						室内环境质量评分
					</td>
				</tr>
				<tr>
					<td id="jdyswhjdf" align="center"></td>
					<td id="jnynylydf" align="center"></td>
					<td id="jsyszylydf" align="center"></td>
					<td id="jcyclzylydf" align="center"></td>
					<td id="snhjzldf" align="center"></td>
				</tr>
    		</table>
    		
    	</div>
    </div>
	<div style="border:0px solid #F90;float:right;">
         <img width="550px" src="/GreenBuilding/img/main.jpg"/>
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


</body>
</html>