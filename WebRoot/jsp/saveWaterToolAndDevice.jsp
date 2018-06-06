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
		
		function checkClickYsxldj(obj){
			document.getElementById("checkbox_ysxldj1").checked=false;
			document.getElementById("checkbox_ysxldj2").checked=false;
			obj.checked=true;
		}
		
		function checkClickJsgg(obj){
			document.getElementById("checkbox_jsgg1").checked=false;
			document.getElementById("checkbox_jsgg2").checked=false;
			document.getElementById("checkbox_jsgg3").checked=false;
			obj.checked=true;
		}
		
		function checkClickJsgg1_1(obj){
			if(document.getElementById("checkbox_jsgg1").checked==true)
				obj.checked=true;
		    else{
		    	alert("只有采用了节水灌溉系统才能勾选此项！");
		    	obj.checked=false;
		    }
		}
		
		function checkClickJslqjs(obj){
			document.getElementById("checkbox_jslqjs1").checked=false;
			document.getElementById("checkbox_jslqjs2").checked=false;
			document.getElementById("checkbox_jslqjs3").checked=false;
			obj.checked=true;
		}
		
		function checkClickQtjsjshcs(obj){
			document.getElementById("checkbox_qtjsjshcs1").checked=false;
			document.getElementById("checkbox_qtjsjshcs2").checked=false;
			obj.checked=true;
		}
		
		function saveData(){
			jzid = document.getElementById('jzmc').value;
			var ysxldjdf=0,jsggdf=0,jslqjsdf=0,qtjsjshcsdf=0;
			var jsxtdf=0;
			var jsqjysbdf=0;
			var fctsylydf=0;
			 
			if(jzid == ""){
				alert("请选择建筑名称！");
				return;
			}
			
			if(document.getElementById("checkbox_ysxldj1").checked)
			    ysxldjdf=5;
			if(document.getElementById("checkbox_ysxldj2").checked)
			    ysxldjdf=10;
			
			
			if(document.getElementById("checkbox_jsgg1").checked)
			    jsggdf += 7;
			if(document.getElementById("checkbox_jsgg2").checked)
			    jsggdf += 3;
			if(document.getElementById("checkbox_jsgg3").checked)
			    jsggdf += 10;
			    
			if(document.getElementById("checkbox_jslqjs1").checked)
			    jslqjsdf=6;
			if(document.getElementById("checkbox_jslqjs2").checked)
			    jslqjsdf=10;
			if(document.getElementById("checkbox_jslqjs3").checked)
			    jslqjsdf=10;
			    
			if(document.getElementById("checkbox_qtjsjshcs1").checked)
			    qtjsjshcsdf += 3;
			if(document.getElementById("checkbox_qtjsjshcs2").checked)
			    qtjsjshcsdf += 5;
			
			jsqjysbdf = ysxldjdf + jsggdf + jslqjsdf + qtjsjshcsdf;
			
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/saveQ3Data",
	       		data: "jzid="+jzid+"&jsxtdf="+jsxtdf+"&jsqjysbdf="+jsqjysbdf+"&fctsylydf="+fctsylydf,
	       		dataType:"json",
	        	success: function(data){
	        		if(data[0] == "0"){
	        			alert("节水器具与设备得分保存失败！");
	        		}else if(data[0] == "1"){
	        			alert("节水器具与设备得分保存成功！");
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
            <h1 class="page-head-line">节水器具与设备</h1>
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
           	<td style="vertical-align: middle;width:35%;">
           		<b>使用较高用水效率登记的卫生器具情况</b>
           	</td>		             
           	<td colspan="2" align="left">
           		<input type="checkbox" id="checkbox_ysxldj1" onclick="checkClickYsxldj(this);">用水效率等级达到三级</input><br/>
           		<input type="checkbox" id="checkbox_ysxldj2" onclick="checkClickYsxldj(this);">用水效率等级达到二级</input>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td style="vertical-align: middle;width:35%;">
           		<b>绿化灌溉采用节水灌溉方式情况</b>
           	</td>		             
           	<td colspan="2" align="left">
          		<input type="checkbox" id="checkbox_jsgg1" onclick="checkClickJsgg(this);">采用节水灌溉系统</input>&emsp;&emsp;&emsp;&emsp;
           		<input type="checkbox" id="checkbox_jsgg2" onclick="checkClickJsgg1_1(this);">设置土壤湿度感应器、雨天关闭装置等节水控制措施</input><br/>
           		<input type="checkbox" id="checkbox_jsgg3" onclick="checkClickJsgg(this);">种植无需永久灌溉植物</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:35%;">
           		<b>空调设备或系统采用节水冷却技术情况</b>
           	</td>
           	<td>
           		<input type="checkbox" id="checkbox_jslqjs1" onclick="checkClickJslqjs(this);">循环冷却水系统设置水处理措施；采取加大集水盘、设置平衡管或平衡水箱的方式，避免冷却水泵停泵是冷却水溢出</input><br/>
           		<input type="checkbox" id="checkbox_jslqjs2" onclick="checkClickJslqjs(this);">运行时，冷却塔的蒸发耗水量占冷却水补水量的比例不低于80%</input><br/>
           		<input type="checkbox" id="checkbox_jslqjs3" onclick="checkClickJslqjs(this);">采用无蒸发耗水量的冷却技术</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:35%;">
           		<b>除卫生器具、绿化灌溉和冷却塔外的其它用水采用节水技术或措施情况</b>
           	</td>
           	<td colspan="2" align="left">
          		<input type="checkbox" id="checkbox_qtjsjshcs1" onclick="checkClickQtjsjshcs(this);">其它用水中采用节水技术或措施的比例达到50%</input><br/>
           		<input type="checkbox" id="checkbox_qtjsjshcs2" onclick="checkClickQtjsjshcs(this);">其它用水中采用节水技术或措施的比例达到80%</input>
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