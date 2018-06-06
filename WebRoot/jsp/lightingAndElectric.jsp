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
		
		function checkClickZmglmd(obj){
			document.getElementById("checkbox_zmglmd1").checked=false;
			document.getElementById("checkbox_zmglmd2").checked=false;
			obj.checked=true;
		}
		
		function saveData(){
			jzid = document.getElementById('jzmc').value;
			var zmjnkzcsdf=0,zmglmddf=0,dtjnkzcsdf=0,sxbyqdf=0,sbfjdf=0;
			var jzywhjgdf=0;
			var gntfyktdf=0;
			var zmydqdf=0;
			var nlzhlydf=0; 
			if(jzid == ""){
				alert("请选择建筑名称！");
				return;
			}
			
			var radio_zmjnkzcs=document.getElementsByName("radio_zmjnkzcs");
			for(var i=0;i<radio_zmjnkzcs.length;i++){
				if(radio_zmjnkzcs[i].checked==true){
					switch(radio_zmjnkzcs[i].value)
					{
					case "1":
						zmjnkzcsdf=5;
						break;
					case "2":
						zmjnkzcsdf=0;
						break;
					default:
						zmjnkzcsdf=0;
						break;
					}
				}
			}
			
			if(document.getElementById("checkbox_zmglmd1").checked)
			    zmglmddf=4;
			if(document.getElementById("checkbox_zmglmd2").checked)
			    zmglmddf=8;
			
			var dtjnkzcs=document.getElementsByName("radio_dtjnkzcs");
			for(var i=0;i<dtjnkzcs.length;i++){
				if(dtjnkzcs[i].checked==true){
					switch(dtjnkzcs[i].value)
					{
					case "1":
						dtjnkzcsdf=3;
						break;
					case "2":
						dtjnkzcsdf=0;
						break;
					default:
						dtjnkzcsdf=0;
						break;
					}
				}
			}
			
			
			if(document.getElementById("checkbox_sxbyq").checked)
			    sxbyqdf+=3;
			if(document.getElementById("checkbox_sbfj").checked)
			    sbfjdf+=2;
			
			zmydqdf = zmjnkzcsdf + zmglmddf + dtjnkzcsdf + sxbyqdf + sbfjdf;
			
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/saveQ2Data",
	       		data: "jzid="+jzid+"&jzywhjgdf="+jzywhjgdf+"&gntfyktdf="+gntfyktdf+"&zmydqdf="+zmydqdf+"&nlzhlydf="+nlzhlydf,
	       		dataType:"json",
	        	success: function(data){
	        		if(data[0] == "0"){
	        			alert("照明与电气得分保存失败！");
	        		}else if(data[0] == "1"){
	        			alert("照明与电气得分保存成功！");
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
            <h1 class="page-head-line">照明与电气</h1>
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
           	<td style="vertical-align: middle;width:45%;">
           		<b>走廊、楼梯间、门厅、大堂、大空间、地下停车场等场所的照明系统采取分区、定时、感应灯节能控制措施</b>
           	</td>		             
           	<td colspan="2" align="left">
          		<input type="radio" name="radio_zmjnkzcs" value="1">满足</input><br/>
           		<input type="radio" name="radio_zmjnkzcs" value="2">不满足</input>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td style="vertical-align: middle;width:45%;">
           		<b>照明功率密度达到现行国家标准《建筑照明设计标准》GB 50034中的目标值规定</b>
           	</td>		             
           	<td colspan="2" align="left">
          		<input type="checkbox" id="checkbox_zmglmd1" onclick="checkClickZmglmd(this);">主要功能房间满足要求</input><br/>
           		<input type="checkbox" id="checkbox_zmglmd2" onclick="checkClickZmglmd(this);">所有区域均满足要求</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:45%;">
           		<b>合理选用电梯和自动扶梯，并采取电梯群控、扶梯自动启停等节能控制措施</b>
           	</td>
           	<td>
           		<input type="radio" name="radio_dtjnkzcs" value="1">满足</input><br/>
           		<input type="radio" name="radio_dtjnkzcs" value="2">不满足</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:45%;">
           		<b>合理选用节能型电气设备</b>
           	</td>
           	<td colspan="2" align="left">
          		<input type="checkbox" id="checkbox_sxbyq">三相配电变压器满足现行国家标准《三相配电变压器能效限定值及节能评价值》GB 20052的节能评价值要求</input><br/>
           		<input type="checkbox" id="checkbox_sbfj">水泵、风机等设备，及其他电气装置满足现行国家标准的节能评价要求</input>
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