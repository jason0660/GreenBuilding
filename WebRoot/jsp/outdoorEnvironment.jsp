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
    <link href="/GreenBuilding/css/tab.css" rel="stylesheet" type="text/css" >
    <!-- GOOGLE FONTS-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
	<script type="text/javascript">
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
		}
		
		function saveData(){
			jzid = document.getElementById('jzmc').value;
			var blmqfsbdf,yjzmgwrgfdf,shjzlbzdf,fsdf,fydf,wxdf,fy1df,zymjdf,tyfsfsxsdf;
			var swhjdf;
			var tdlydf=0;
			var jtssyggfwdf=0;
			var cdsjycdstdf=0; 
			if(jzid == ""){
				alert("请选择建筑名称！");
				return;
			}
			
			if(document.getElementById("checkbox_blmqfsb").checked)
			    blmqfsbdf=2;
			else
				blmqfsbdf=0;
			
			if(document.getElementById("checkbox_yjzmgwrgf").checked)
			    yjzmgwrgfdf=2;
			else
				yjzmgwrgfdf=0;
			
			if(document.getElementById("checkbox_shjzlbz").checked)
			    shjzlbzdf=4;
			else
				shjzlbzdf=0;
			
			if(document.getElementById("checkbox_fs").checked)
			    fsdf=2;
			else
				fsdf=0;
			
			if(document.getElementById("checkbox_fy").checked)
			    fydf=1;
			else
				fydf=0;
			
			if(document.getElementById("checkbox_wx").checked)
			    wxdf=2;
			else
				wxdf=0;
			
			if(document.getElementById("checkbox_fy1").checked)
			    fy1df=1;
			else
				fy1df=0;
			
			var radio_zymj=document.getElementsByName("radio_zymj");
			for(var i=0;i<radio_zymj.length;i++){
				if(radio_zymj[i].checked==true){
					switch(radio_zymj[i].value)
					{
					case "1":
						zymjdf=1;
						break;
					case "2":
						zymjdf=2;
						break;
					default:
						zymjdf=0;
						break;
					}
				}
			}
			
			if(document.getElementById("checkbox_tyfsfsxs").checked)
			    tyfsfsxsdf=2;
			else
				tyfsfsxsdf=0;
			
			swhjdf = blmqfsbdf + yjzmgwrgfdf + shjzlbzdf + fsdf + fydf + wxdf + fy1df + zymjdf + tyfsfsxsdf;
			
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/saveQ1Data",
	       		data: "jzid="+jzid+"&tdlydf="+tdlydf+"&swhjdf="+swhjdf+"&jtssyggfwdf="+jtssyggfwdf+"&cdsjycdstdf="+cdsjycdstdf,
	       		dataType:"json",
	        	success: function(data){
	        		if(data[0] == "0"){
	        			alert("室外环境得分保存失败！");
	        		}else if(data[0] == "1"){
	        			alert("室外环境得分保存成功！");
	        		}
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
            <h1 class="page-head-line">室外环境</h1>
            <!-- <h1 class="page-subhead-line"></h1> -->      
        </div>     
    </div>
	<!-- <div class="tabs" style="border:0px solid #F60;margin:5px 0px; width:100%; height:100%;background: #FFF;">		             
        <div class="panels" style="border:0px solid #F60;width:100%; height:100%;background: #FFF;">
            <div data-tabname="tab2" class="panel-item" style="padding:0px 0px;background: #FFF;"> -->
            	<div style="border:0px solid #F00;">
			    	<table>
			    		<tr>
			    			<td>
			    				<h5><b>建筑名称：</b></h5>
			    			</td>
			    			<td>
			    				<select id="jzmc" onchange="jzid=this.value">
					 				<option value=""></option>
					 		    </select>
			    			</td>
			    		</tr>
			    	</table>
			    </div>
            	<table border="0" class="table table-bordered" style="width:100%;height:100%; background: #FFF;" >
					<tr style="height:5px">
		             	<td style="vertical-align: middle;width:15%;">
		             		<b>建筑及照明设计避免产生光污染</b>
		             	</td>		             
		             	<td colspan="2" align="left">
	             			<input type="checkbox" id="checkbox_blmqfsb">玻璃幕墙可见光反射比不大于0.2</input><br/>
	             			<input type="checkbox" id="checkbox_yjzmgwrgf">室外夜景照明光污染的限制符合现行行业标准《城市夜景照明设计规范》JGJ/T 163的规定</input>
		             	</td>
		             </tr>
		             <tr style="height:5px">
		             	<td style="vertical-align: middle;width:15%;">
		             		<b>场地内环境噪声</b>
		             	</td>
		             	<td colspan="2">
		             		<input type="checkbox" id="checkbox_shjzlbz">符合现行国家标准《声环境质量标准》GB3096的有关规定</input>
		             	</td>
		             </tr>
		             <tr style="height:5px">
		             	<td rowspan="2" style="vertical-align: middle;width:15%;">
		             		<b>场地内风环境</b>
		             	</td>
		             	<td style="vertical-align: middle;width:15%;">
		             		冬季典型风速和风向条件下
		             	</td>
		             	<td>
		             		<input type="checkbox" id="checkbox_fs">建筑物周围人行区风速小于5m/s，且室外风速放大系数小于2</input><br/>
		             		<input type="checkbox" id="checkbox_fy">除迎风第一排建筑外，建筑迎风面与背风面表面风压差不大于5Pa</input>
		             	</td>
		             </tr>
		             <tr style="height:2px">
		             	<td style="vertical-align: middle;width:15%;">
		             		过渡季、夏季典型风速和风向条件下
		             	</td>
		             	<td>
		             		<input type="checkbox" id="checkbox_wx">场地内人活动区不出现涡旋或无风区</input><br/>
		             		<input type="checkbox" id="checkbox_fy1">50%以上可开启外窗室内外表面的风压差大于0.5Pa</input>
		             	</td>
		             </tr>
		             <tr style="height:5px">
		             	<td style="vertical-align: middle;width:15%;">
		             		<b>热岛强度</b>
		             	</td>
		             	<td colspan="2">
		             		<input type="radio" name="radio_zymj" value="1">红线范围内户外活动场地有乔木、构建物遮荫措施面积达到10%</input><br/>
		             		<input type="radio" name="radio_zymj" value="2">红线范围内户外活动场地有乔木、构建物遮荫措施面积达到20%</input><br/>
		             		<input type="checkbox" id="checkbox_tyfsfsxs">超过70%的道路路面、建筑屋面的太阳辐射反射系数不小于0.4</input>
		             	</td>
		             </tr>
				</table>
				<div style="border:0px solid #F90;height:30px;float:right;">
			    	<input type="button" style="width:65px;height:25px;" onclick="saveData();" value="保存"></input>
			    </div>
            <!-- </div>
        </div>
    </div> -->
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