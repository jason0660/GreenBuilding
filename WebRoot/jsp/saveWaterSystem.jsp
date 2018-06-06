<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>

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
		
		function checkClickJsysde(obj){
			document.getElementById("checkbox_jsysde1").checked=false;
			document.getElementById("checkbox_jsysde2").checked=false;
			document.getElementById("checkbox_jsysde3").checked=false;
			obj.checked=true;
		}
		
		function checkClickYsdgsyl(obj){
			document.getElementById("checkbox_ysdgsyl1").checked=false;
			document.getElementById("checkbox_ysdgsyl2").checked=false;
			obj.checked=true;
		}
		
		function saveData(){
			jzid = document.getElementById('jzmc').value;
			var jsysdedf=0,bmgwlscsdf=0,ysdgsyldf=0,ysjlzzdf=0,gyysjscsdf=0;
			var jsxtdf=0;
			var jsqjysbdf=0;
			var fctsylydf=0;
			 
			if(jzid == ""){
				alert("请选择建筑名称！");
				return;
			}
			
			if(document.getElementById("checkbox_jsysde1").checked)
			    jsysdedf=4;
			if(document.getElementById("checkbox_jsysde2").checked)
			    jsysdedf=7;
			if(document.getElementById("checkbox_jsysde3").checked)
			    jsysdedf=10;
			
			
			if(document.getElementById("checkbox_bmgwlscs1").checked)
			    bmgwlscsdf += 1;
			if(document.getElementById("checkbox_bmgwlscs2").checked)
			    bmgwlscsdf += 1;
			if(document.getElementById("checkbox_bmgwlscs3").checked)
			    bmgwlscsdf += 5;
			    
			if(document.getElementById("checkbox_ysdgsyl1").checked)
			    ysdgsyldf=3;
			if(document.getElementById("checkbox_ysdgsyl2").checked)
			    ysdgsyldf=8;
			    
			if(document.getElementById("checkbox_ysjlzz1").checked)
			    ysjlzzdf += 2;
			if(document.getElementById("checkbox_ysjlzz2").checked)
			    ysjlzzdf += 4;
			    
			if(document.getElementById("checkbox_gyysjscs1").checked)
			    gyysjscsdf += 2;
			if(document.getElementById("checkbox_gyysjscs2").checked)
			    gyysjscsdf += 2;
			
			jsxtdf = jsysdedf + bmgwlscsdf + ysdgsyldf + ysjlzzdf + gyysjscsdf;
			
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/saveQ3Data",
	       		data: "jzid="+jzid+"&jsxtdf="+jsxtdf+"&jsqjysbdf="+jsqjysbdf+"&fctsylydf="+fctsylydf,
	       		dataType:"json",
	        	success: function(data){
	        		if(data[0] == "0"){
	        			alert("节水系统得分保存失败！");
	        		}else if(data[0] == "1"){
	        			alert("节水系统得分保存成功！");
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
            <h1 class="page-head-line">节水系统</h1>
            <!-- <h1 class="page-subhead-line"></h1> -->      
        </div>     
    </div>	             
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
           	<td style="vertical-align: middle;width:40%;">
           		<b>建筑平均日用水量满足现行国家标准《民用建筑节水设计标准》GB 50555中的节水用水定额要求</b>
           	</td>		             
           	<td colspan="2" align="left">
          		<input type="checkbox" id="checkbox_jsysde1" onclick="checkClickJsysde(this);">达到节水用水定额的上限值要求</input><br/>
           		<input type="checkbox" id="checkbox_jsysde2" onclick="checkClickJsysde(this);">达到节水用水定额的上限值与下限值的平均值要求</input><br/>
           		<input type="checkbox" id="checkbox_jsysde3" onclick="checkClickJsysde(this);">达到节水用水定额的下限值要求</input>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td style="vertical-align: middle;width:40%;">
           		<b>采取有效措施避免管网漏损</b>
           	</td>		             
           	<td colspan="2" align="left">
          		<input type="checkbox" id="checkbox_bmgwlscs1">选用密封良好的阀门、设备，使用耐腐蚀、耐久性能好的管材、管件</input><br/>
           		<input type="checkbox" id="checkbox_bmgwlscs2">室外埋地管道采取有效措施避免管网漏损</input><br/>
           		<input type="checkbox" id="checkbox_bmgwlscs3">设计阶段根据水平衡测试的要求安装分级计量水表；运行阶段提供用水量计量情况和管网漏损检测、整改报告</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:40%;">
           		<b>给水系统无超压出流现象</b>
           	</td>
           	<td>
           		<input type="checkbox" id="checkbox_ysdgsyl1" onclick="checkClickYsdgsyl(this);">用水点供水压力不大于0.30MPa</input><br/>
           		<input type="checkbox" id="checkbox_ysdgsyl2" onclick="checkClickYsdgsyl(this);">用水点供水压力不大于0.20MPa，且不小于用水器具要求的最低工作压力</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:40%;">
           		<b>设置用水计量装置</b>
           	</td>
           	<td colspan="2" align="left">
          		<input type="checkbox" id="checkbox_ysjlzz1">按使用用途，对厨房、卫生间、绿化、空调系统、游泳池、景观等用水分别设置用水计量装置，统计用水量</input><br/>
           		<input type="checkbox" id="checkbox_ysjlzz2">按付费或管理单元，分别设置用水计量装置，统计用水量</input>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td rowspan="2" style="vertical-align: middle;width:40%;">
           		<b>公共浴室采取节水措施</b>
           	</td>
           	<td>
           		<input type="checkbox" id="checkbox_gyysjscs1">采用 带恒温控制和温度显示功能的冷热水混合淋浴器</input><br/>
           		<input type="checkbox" id="checkbox_gyysjscs2">设置用者付费的设施</input>
           	</td>
        </tr>
    </table>
	<div style="border:0px solid #F90;height:30px;float:right;">
    	<input type="button" style="width:65px;height:25px;" onclick="saveData();" value="保存"></input>
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

<script>	
  	document.body.addEventListener('click', function(ev){
  		var tt = ev.target;
  		if (!tt || tt.className !== 'tab-label') return;
  		var es = tt.previousElementSibling.getAttribute('data-tabname');
  		[].forEach.call(document.querySelectorAll('.panel-item[data-tabname]'), function(e){
  			if (e.getAttribute('data-tabname') === es) 
  				e.classList.remove('hidden');
  			else
  				e.classList.add('hidden');
  		});
  	}, true)
</script>

</body>
</html>