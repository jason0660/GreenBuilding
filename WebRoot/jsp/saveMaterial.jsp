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
		
		function checkClickJzxt(obj){
			document.getElementById("checkbox_jzxt1").checked=false;
			document.getElementById("checkbox_jzxt2").checked=false;
			obj.checked=true;
		}
		
		function checkClickYtlsjhsbl(obj){
			document.getElementById("checkbox_ytlsjhsbl1").checked=false;
			document.getElementById("checkbox_ytlsjhsbl2").checked=false;
			obj.checked=true;
		}
		
		function checkClickTjyzxythsj(obj){
			document.getElementById("checkbox_tjyzxythsj1").checked=false;
			document.getElementById("checkbox_tjyzxythsj2").checked=false;
			obj.checked=true;
		}
		
		function checkClickRrp(obj){
			document.getElementById("checkbox_rrp1").checked=false;
			document.getElementById("checkbox_rrp2").checked=false;
			document.getElementById("checkbox_rrp3").checked=false;
			obj.checked=true;
		}
		
		function checkClickRpc(obj){
			document.getElementById("checkbox_rpc1").checked=false;
			document.getElementById("checkbox_rpc2").checked=false;
			document.getElementById("checkbox_rpc3").checked=false;
			obj.checked=true;
		}
		
		function saveData(){
			jzid = document.getElementById('jzmc').value;
			var jzxtdf=0,ddjcxgdf=0,ytlsjhsbldf=0,tjyzxythsjdf=0,rrpdf=0,rpcdf=0,zthdxsjdf=0;
			var jcsjdf=0;
			var clxydf=0;
			 
			if(jzid == ""){
				alert("请选择建筑名称！");
				return;
			}
			
			if(document.getElementById("checkbox_jzxt1").checked)
			    jzxtdf=3;
			if(document.getElementById("checkbox_jzxt2").checked)
			    jzxtdf=9;
			
			var radio_ddjcxg=document.getElementsByName("radio_ddjcxg");
			for(var i=0;i<radio_ddjcxg.length;i++){
				if(radio_ddjcxg[i].checked==true){
					var checkedRadio=true;
				}
			}
			if(!checkedRadio)
			{
				alert("请选择对地基基础、结构体系、结构构件进行优化设计，达到节材效果情况。");
				return;
			}
			else
			{
				for(var i=0;i<radio_ddjcxg.length;i++){
					if(radio_ddjcxg[i].checked==true){
						switch(radio_ddjcxg[i].value)
						{
						case "1":
							ddjcxgdf=5;
							break;
						case "2":
							ddjcxgdf=0;
							break;
						}
					}
				}
			}
			
			if(document.getElementById("checkbox_ytlsjhsbl1").checked)
			    ytlsjhsbldf = 6;
			if(document.getElementById("checkbox_ytlsjhsbl2").checked)
			    ytlsjhsbldf = 10;
			    
			if(document.getElementById("checkbox_tjyzxythsj1").checked)
			    tjyzxythsjdf=3;
			if(document.getElementById("checkbox_tjyzxythsj2").checked)
			    tjyzxythsjdf=8;
			    
			if(document.getElementById("checkbox_rrp1").checked)
			    rrpdf = 3;
			if(document.getElementById("checkbox_rrp2").checked)
			    rrpdf = 4;
			if(document.getElementById("checkbox_rrp3").checked)
			    rrpdf = 5;
			    
			if(document.getElementById("checkbox_rpc1").checked)
			    rpcdf = 3;
			if(document.getElementById("checkbox_rpc2").checked)
			    rpcdf = 4;
			if(document.getElementById("checkbox_rpc3").checked)
			    rpcdf = 5;
			    
			if(document.getElementById("checkbox_zthdxsj1").checked)
			    zthdxsjdf += 3;
			if(document.getElementById("checkbox_zthdxsj2").checked)
			    zthdxsjdf += 3;
			
			jcsjdf = jzxtdf + ddjcxgdf + ytlsjhsbldf + tjyzxythsjdf + rrpdf + rpcdf + zthdxsjdf;
			
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/saveQ4Data",
	       		data: "jzid="+jzid+"&jcsjdf="+jcsjdf+"&clxydf="+clxydf,
	       		dataType:"json",
	        	success: function(data){
	        		if(data[0] == "0"){
	        			alert("节材设计得分保存失败！");
	        		}else if(data[0] == "1"){
	        			alert("节材设计得分保存成功！");
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
            <h1 class="page-head-line">节材设计</h1>
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
           	<td style="vertical-align: middle;width:30%;">
           		<b>择优选用建筑形体，根据国家标准《建筑抗震设计规范》GB50011-2010规定的建筑形体规则</b>
           	</td>		             
           	<td colspan="2" align="left">
          		<input type="checkbox" id="checkbox_jzxt1" onclick="checkClickJzxt(this);">建筑形体不规则</input><br/>
           		<input type="checkbox" id="checkbox_jzxt2" onclick="checkClickJzxt(this);">建筑形体规则</input>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td style="vertical-align: middle;width:30%;">
           		<b>对地基基础、结构体系、结构构件进行优化设计，达到节材效果情况</b>
           	</td>		             
           	<td colspan="2" align="left">
          		<input type="radio" name="radio_ddjcxg" value="1">满足</input><br/>
           		<input type="radio" name="radio_ddjcxg" value="2">不满足</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td rowspan="2" style="vertical-align: middle;width:30%;">
           		<b>土建工程与装修工程一体化设计</b>
           	</td>
           	<td style="vertical-align: middle;width:20%;">
           		住宅建筑土建与装修一体化设计的户数比例
           	</td>
           	<td>
           		<input type="checkbox" id="checkbox_ytlsjhsbl1" onclick="checkClickYtlsjhsbl(this);">达到30%</input><br/>
           		<input type="checkbox" id="checkbox_ytlsjhsbl2" onclick="checkClickYtlsjhsbl(this);">达到100%</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:20%;">
           		土建与装修一体化设计情况
           	</td>
           	<td colspan="2" align="left">
          		<input type="checkbox" id="checkbox_tjyzxythsj1" onclick="checkClickTjyzxythsj(this);">公共建筑公共部位土建与装修一体化设计</input><br/>
           		<input type="checkbox" id="checkbox_tjyzxythsj2" onclick="checkClickTjyzxythsj(this);">所有部位均土建与装修一体化设计</input>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td style="vertical-align: middle;width:30%;">
           		<b>公共建筑中可变换功能的室内空间采用可重复使用的隔断（墙）</b>
           	</td>
           	<td style="vertical-align: middle;width:20%;">
           		可重复使用隔断（墙）比例Rrp
           	</td>
           	<td>
           		<input type="checkbox" id="checkbox_rrp1" onclick="checkClickRrp(this);">30%≤Rrp＜50%</input><br/>
           		<input type="checkbox" id="checkbox_rrp2" onclick="checkClickRrp(this);">50%≤Rrp＜80%</input><br/>
           		<input type="checkbox" id="checkbox_rrp3" onclick="checkClickRrp(this);">Rrp≥80%</input>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td style="vertical-align: middle;width:30%;">
           		<b>采用工业化生产的预制构件情况</b>
           	</td>
           	<td style="vertical-align: middle;width:20%;">
           		预制构件用量比例Rpc
           	</td>
           	<td>
           		<input type="checkbox" id="checkbox_rpc1" onclick="checkClickRpc(this);">15%≤Rpc＜30%</input><br/>
           		<input type="checkbox" id="checkbox_rpc2" onclick="checkClickRpc(this);">30%≤Rpc＜50%</input><br/>
           		<input type="checkbox" id="checkbox_rpc3" onclick="checkClickRpc(this);">Rpc≥50%</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:30%;">
           		<b>采用整体化定型设计的厨房、卫浴间情况</b>
           	</td>
           	<td colspan="2" align="left">
          		<input type="checkbox" id="checkbox_zthdxsj1">采用整体化定型设计的厨房</input><br/>
           		<input type="checkbox" id="checkbox_zthdxsj2">采用整体化定型设计的卫浴间</input>
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