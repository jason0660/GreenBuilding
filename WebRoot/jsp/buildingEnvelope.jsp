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
		
		function checkClickTmbfkqmjbl(obj){
			document.getElementById("checkbox_tmbfkqmjbl1").checked=false;
			document.getElementById("checkbox_tmbfkqmjbl2").checked=false;
			obj.checked=true;
		}
		
		function checkClickWckkqmjbl(obj){
			document.getElementById("checkbox_wckkqmjbl1").checked=false;
			document.getElementById("checkbox_wckkqmjbl2").checked=false;
			obj.checked=true;
		}
		
		function checkClick_Tmbfkqmjbl(obj){
			document.getElementById("checkbox_tmbfkqmjbl3").checked=false;
			document.getElementById("checkbox_tmbfkqmjbl4").checked=false;
			obj.checked=true;
		}
		
		function checkClick_Tmbfkqmjbl(obj){
			document.getElementById("checkbox_wckkqmjbl3").checked=false;
			document.getElementById("checkbox_wckkqmjbl4").checked=false;
			obj.checked=true;
		}
		
		function checkClickWhjgrgxnzb(obj){
			document.getElementById("checkbox_whjgrgxnzb1").checked=false;
			document.getElementById("checkbox_whjgrgxnzb2").checked=false;
			obj.checked=true;
		}
		
		function checkClickGnkt(obj){
			document.getElementById("checkbox_gnkt1").checked=false;
			document.getElementById("checkbox_gnkt2").checked=false;
			obj.checked=true;
		}
		
		function saveData(){
			jzid = document.getElementById('jzmc').value;
			var yhsjdf=0,tmbfkqmjbldf=0,wckkqmjbldf=0,tmbfkqmjbl_df=0,wckkqmjbl_df=0,tmbfkqmjbl_wckkqmjbldf=0,whjgrgxnzbdf=0,gnktdf=0;
			var jzywhjgdf;
			var gntfyktdf=0;
			var zmydqdf=0;
			var nlzhlydf=0; 
			if(jzid == ""){
				alert("请选择建筑名称！");
				return;
			}
			
			var radio_yhsj=document.getElementsByName("radio_yhsj");
			for(var i=0;i<radio_yhsj.length;i++){
				if(radio_yhsj[i].checked==true){
					switch(radio_yhsj[i].value)
					{
					case "1":
						yhsjdf=3;
						break;
					case "2":
						yhsjdf=0;
						break;
					default:
						yhsjdf=0;
						break;
					}
				}
			}
			
			if(document.getElementById("checkbox_tmbfkqmjbl1").checked)
			    tmbfkqmjbldf=4;
			if(document.getElementById("checkbox_tmbfkqmjbl2").checked)
			    tmbfkqmjbldf=6;
			
			if(document.getElementById("checkbox_wckkqmjbl1").checked)
			    wckkqmjbldf=4;
			if(document.getElementById("checkbox_wckkqmjbl2").checked)
			    wckkqmjbldf=6;
			
			if(document.getElementById("checkbox_tmbfkqmjbl3").checked)
			    tmbfkqmjbl_df=4;
			if(document.getElementById("checkbox_tmbfkqmjbl4").checked)
			    tmbfkqmjbl_df=6;
			    
			if(document.getElementById("checkbox_wckkqmjbl3").checked)
			    wckkqmjbl_df=4;
			if(document.getElementById("checkbox_wckkqmjbl4").checked)
			    wckkqmjbl_df=6;
			    
			tmbfkqmjbl_wckkqmjbldf = (tmbfkqmjbl_df + wckkqmjbl_df)/2;
			
			if(document.getElementById("checkbox_whjgrgxnzb1").checked)
			    whjgrgxnzbdf=5;
			if(document.getElementById("checkbox_whjgrgxnzb2").checked)
			    whjgrgxnzbdf=10;
			    
			if(document.getElementById("checkbox_gnkt1").checked)
			    gnktdf=5;
			if(document.getElementById("checkbox_gnkt2").checked)
			    gnktdf=10;
			
			jzywhjgdf = yhsjdf + tmbfkqmjbldf + wckkqmjbldf + tmbfkqmjbl_wckkqmjbldf + whjgrgxnzbdf + gnktdf;
			
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/saveQ2Data",
	       		data: "jzid="+jzid+"&jzywhjgdf="+jzywhjgdf+"&gntfyktdf="+gntfyktdf+"&zmydqdf="+zmydqdf+"&nlzhlydf="+nlzhlydf,
	       		dataType:"json",
	        	success: function(data){
	        		if(data[0] == "0"){
	        			alert("建筑与围护结构得分保存失败！");
	        		}else if(data[0] == "1"){
	        			alert("建筑与围护结构得分保存成功！");
	        		}
	        	},
	        	error: function(XMLResponse){
	        		alert("qError!");
	        	}	
	   	    });
		}
	</script>
</head>
<body onload="getBuilding();">
	<div class="row" style="border:0px solid #F00;">
        <div class="col-md-12">
            <h1 class="page-head-line">建筑与围护结构</h1>
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
           	<td style="vertical-align: middle;width:15%;">
           		<b>结合场地自然条件，对建筑的体形、朝向、楼距、窗墙比等进行优化设计</b>
           	</td>		             
           	<td colspan="2" align="left">
          		<input type="radio" name="radio_yhsj" value="1">是</input><br/>
           		<input type="radio" name="radio_yhsj" value="2">否</input>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td rowspan="3" style="vertical-align: middle;width:15%;">
           		<b>外墙、玻璃幕墙的可开启部分能使建筑获得良好的通风</b>
           	</td>
           	<td style="vertical-align: middle;width:25%;">
           		设玻璃幕墙且不设外窗的建筑
           	</td>
           	<td>
           		<input type="checkbox" id="checkbox_tmbfkqmjbl1" onclick="checkClickTmbfkqmjbl(this);">玻璃幕墙透明部分可开启面积比例达到5%</input><br/>
           		<input type="checkbox" id="checkbox_tmbfkqmjbl2" onclick="checkClickTmbfkqmjbl(this);">玻璃幕墙透明部分可开启面积比例达到10%</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:25%;">
           		设外窗且不设玻璃幕墙的建筑
           	</td>
           	<td>
           		<input type="checkbox" id="checkbox_wckkqmjbl1" onclick="checkClickWckkqmjbl(this);">外窗可开启面积比例达到30%</input><br/>
           		<input type="checkbox" id="checkbox_wckkqmjbl2" onclick="checkClickWckkqmjbl(this);">外窗可开启面积比例达到35%</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:25%;">
           		设玻璃幕墙和外窗的建筑
           	</td>
           	<td>
           		<input type="checkbox" id="checkbox_tmbfkqmjbl3" onclick="checkClick_Tmbfkqmjbl(this);">玻璃幕墙透明部分可开启面积比例达到5%</input><br/>
           		<input type="checkbox" id="checkbox_tmbfkqmjbl4" onclick="checkClick_Tmbfkqmjbl(this);">玻璃幕墙透明部分可开启面积比例达到10%</input><br/>
           		<input type="checkbox" id="checkbox_wckkqmjbl3" onclick="checkClick_Wckkqmjbl(this);">外窗可开启面积比例达到30%</input><br/>
           		<input type="checkbox" id="checkbox_wckkqmjbl4" onclick="checkClick_Wckkqmjbl(this);">外窗可开启面积比例达到35%</input>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td rowspan="2" style="vertical-align: middle;width:15%;">
           		<b>围护结构热工性能指标优于国家现行有关建筑节能设计标准</b>
           	</td>
           	<td style="vertical-align: middle;width:25%;">
           		围护结构热工性能指标比国家现行有关建筑节能设计标准规定的提高幅度
           	</td>
           	<td>
           		<input type="checkbox" id="checkbox_whjgrgxnzb1" onclick="checkClickWhjgrgxnzb(this);">达到5%</input><br/>
           		<input type="checkbox" id="checkbox_whjgrgxnzb2" onclick="checkClickWhjgrgxnzb(this);">达到10%</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:25%;">
           		供暖空调全年计算负荷降低幅度
           	</td>
           	<td>
           		<input type="checkbox" id="checkbox_gnkt1" onclick="checkClickGnkt(this);">达到5%</input><br/>
           		<input type="checkbox" id="checkbox_gnkt2" onclick="checkClickGnkt(this);">达到10%</input>
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