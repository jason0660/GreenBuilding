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
		
		function checkClickRlm(obj){
			document.getElementById("checkbox_rlm1").checked=false;
			document.getElementById("checkbox_rlm2").checked=false;
			document.getElementById("checkbox_rlm3").checked=false;
			obj.checked=true;
		}
		
		function checkClickYbsjbl(obj){
			document.getElementById("checkbox_ybsjbl1").checked=false;
			document.getElementById("checkbox_ybsjbl2").checked=false;
			obj.checked=true;
		}
		
		function checkClickJzjg(obj){
			document.getElementById("checkbox_jzjg1").checked=false;
			document.getElementById("checkbox_jzjg2").checked=false;
			document.getElementById("checkbox_jzjg3").checked=false;
			
			document.getElementById("checkbox_rsb1").checked=false;
			document.getElementById("checkbox_rsb2").checked=false;
			document.getElementById("checkbox_rsb3").checked=false;
			document.getElementById("checkbox_rsb4").checked=false;
			
			document.getElementById("checkbox_gcylbl1").checked=false;
			document.getElementById("checkbox_gcylbl2").checked=false;
			
			document.getElementById("checkbox_hhjgrsb1").checked=false;
			document.getElementById("checkbox_hhjgrsb2").checked=false;
			document.getElementById("checkbox_hhjgrsb3").checked=false;
			document.getElementById("checkbox_hhjgrsb4").checked=false;
			
			document.getElementById("checkbox_hhjggcylbl1").checked=false;
			document.getElementById("checkbox_hhjggcylbl2").checked=false;
			
			obj.checked=true;
		}
		
		function checkClickRsb(obj){
			if(document.getElementById("checkbox_jzjg1").checked==true){
				document.getElementById("checkbox_rsb1").checked=false;
				document.getElementById("checkbox_rsb2").checked=false;
				document.getElementById("checkbox_rsb3").checked=false;
				document.getElementById("checkbox_rsb4").checked=false;
				
				document.getElementById("checkbox_hntsxcz1").checked=false;
				document.getElementById("checkbox_hntsxcz2").checked=false;
				
				obj.checked=true;
			}
			else{
				alert("只有勾选了‘混凝土结构’才能勾选此项！");
		    	obj.checked=false;
			}
		}
		
		function checkClickHntsxcz(obj){
			if(document.getElementById("checkbox_jzjg1").checked==true){
				document.getElementById("checkbox_rsb1").checked=false;
				document.getElementById("checkbox_rsb2").checked=false;
				document.getElementById("checkbox_rsb3").checked=false;
				document.getElementById("checkbox_rsb4").checked=false;
				
				document.getElementById("checkbox_hntsxcz1").checked=false;
				document.getElementById("checkbox_hntsxcz2").checked=false;
				
				obj.checked=true;
			}
			else{
				alert("只有勾选了‘混凝土结构’才能勾选此项！");
		    	obj.checked=false;
			}
		}
		
		function checkClickGcylbl(obj){
			if(document.getElementById("checkbox_jzjg2").checked==true){
				document.getElementById("checkbox_gcylbl1").checked=false;
				document.getElementById("checkbox_gcylbl2").checked=false;
				obj.checked=true;
			}
			else{
				alert("只有勾选了‘钢结构’才能勾选此项！");
		    	obj.checked=false;
			}
		}
		
		function checkClickHhjgRsb(obj){
			if(document.getElementById("checkbox_jzjg3").checked==true){
				document.getElementById("checkbox_hhjgrsb1").checked=false;
				document.getElementById("checkbox_hhjgrsb2").checked=false;
				document.getElementById("checkbox_hhjgrsb3").checked=false;
				document.getElementById("checkbox_hhjgrsb4").checked=false;
				
				document.getElementById("checkbox_hhjghntsxcz1").checked=false;
				document.getElementById("checkbox_hhjghntsxcz2").checked=false;
				
				obj.checked=true;
			}
			else{
				alert("只有勾选了‘混合结构’才能勾选此项！");
		    	obj.checked=false;
			}
		}
		
		function checkClickHhjgGcylbl(obj){
			if(document.getElementById("checkbox_jzjg3").checked==true){
				document.getElementById("checkbox_hhjggcylbl1").checked=false;
				document.getElementById("checkbox_hhjggcylbl2").checked=false;
				obj.checked=true;
			}
			else{
				alert("只有勾选了‘混合结构’才能勾选此项！");
		    	obj.checked=false;
			}
		}
		
		function checkClickHhjgHntsxcz(obj){
			if(document.getElementById("checkbox_jzjg3").checked==true){
				document.getElementById("checkbox_hhjgrsb1").checked=false;
				document.getElementById("checkbox_hhjgrsb2").checked=false;
				document.getElementById("checkbox_hhjgrsb3").checked=false;
				document.getElementById("checkbox_hhjgrsb4").checked=false;
				
				document.getElementById("checkbox_hhjghntsxcz1").checked=false;
				document.getElementById("checkbox_hhjghntsxcz2").checked=false;
				
				obj.checked=true;
			}
			else{
				alert("只有勾选了‘混合结构’才能勾选此项！");
		    	obj.checked=false;
			}
		}
		
		function checkClickGnjjzjgcl(obj){
			document.getElementById("checkbox_gnjjzjgcl1").checked=false;
			document.getElementById("checkbox_gnjjzjgcl2").checked=false;
			obj.checked=true;
		}
		
		function checkClickZzjzcykzlycl(obj){
			document.getElementById("checkbox_zzjzcykzlycl1").checked=false;
			document.getElementById("checkbox_zzjzcykzlycl2").checked=false;
			
			document.getElementById("checkbox_ggjzcykzlycl1").checked=false;
			document.getElementById("checkbox_ggjzcykzlycl2").checked=false;
			
			obj.checked=true;
		}
		
		function checkClickGgjzcykzlycl(obj){
			document.getElementById("checkbox_zzjzcykzlycl1").checked=false;
			document.getElementById("checkbox_zzjzcykzlycl2").checked=false;
			
			document.getElementById("checkbox_ggjzcykzlycl1").checked=false;
			document.getElementById("checkbox_ggjzcykzlycl2").checked=false;
			
			obj.checked=true;
		}
		
		function checkClickFqwjzcl(obj){
			document.getElementById("checkbox_fqwjzcl1").checked=false;
			document.getElementById("checkbox_fqwjzcl2").checked=false;
			document.getElementById("checkbox_fqwjzcl3").checked=false;
			obj.checked=true;
		}
		
		function saveData(){
			jzid = document.getElementById('jzmc').value;
			var rlmdf=0,ybhntdf=0,ybsjbldf=0,rsbdf=0,hntsxczdf=0,gcylbldf=0,hhjgrsb=0,hhjghntsxcz=0,hhjggcylbldf=0,gnjjzjgcldf=0,zzjzcykzlycldf=0,ggjzcykzlycldf=0,fqwjzcldf=0,zszxjzcldf=0;
			var jcsjdf=0;
			var clxydf=0;
			 
			if(jzid == ""){
				alert("请选择建筑名称！");
				return;
			}
			
			if(document.getElementById("checkbox_rlm1").checked)
			    rlmdf=6;
			if(document.getElementById("checkbox_rlm2").checked)
			    rlmdf=8;
			if(document.getElementById("checkbox_rlm3").checked)
			    rlmdf=10;
			
			var radio_ybhnt=document.getElementsByName("radio_ybhnt");
			for(var i=0;i<radio_ybhnt.length;i++){
				if(radio_ybhnt[i].checked==true){
					var checkedRadio=true;
				}
			}
			if(!checkedRadio)
			{
				alert("请选择现浇混凝土采用预拌混凝土情况。");
				return;
			}
			else
			{
				for(var i=0;i<radio_ybhnt.length;i++){
					if(radio_ybhnt[i].checked==true){
						switch(radio_ybhnt[i].value)
						{
						case "1":
							ybhntdf=10;
							break;
						case "2":
							ybhntdf=0;
							break;
						}
					}
				}
			}
			
			if(document.getElementById("checkbox_ybsjbl1").checked)
			    ybsjbldf = 3;
			if(document.getElementById("checkbox_ybsjbl2").checked)
			    ybsjbldf = 5;			
			    
			if(document.getElementById("checkbox_rsb1").checked)
			    rsbdf=4;
			if(document.getElementById("checkbox_rsb2").checked)
			    rsbdf=6;
			if(document.getElementById("checkbox_rsb3").checked)
			    rsbdf=8;
			if(document.getElementById("checkbox_rsb4").checked)
			    rsbdf=10;
			    
			if(document.getElementById("checkbox_hntsxcz1").checked)
			    hntsxczdf = 0;
			if(document.getElementById("checkbox_hntsxcz2").checked)
			    hntsxczdf = 10;		    
			
			if(document.getElementById("checkbox_gcylbl1").checked)
			    gcylbldf = 8;
			if(document.getElementById("checkbox_gcylbl2").checked)
			    gcylbldf = 10;
			    
			if(document.getElementById("checkbox_hhjgrsb1").checked)
			    hhjgrsbdf = 4;
			if(document.getElementById("checkbox_hhjgrsb2").checked)
			    hhjgrsbdf = 6;
			if(document.getElementById("checkbox_hhjgrsb3").checked)
			    hhjgrsbdf = 8;
			if(document.getElementById("checkbox_hhjgrsb4").checked)
			    hhjgrsbdf = 10;
			    
			if(document.getElementById("checkbox_hhjghntsxcz1").checked)
			    hhjghntsxczdf = 0;
			if(document.getElementById("checkbox_hhjghntsxcz2").checked)
			    hhjghntsxczdf = 10;			
			
			if(document.getElementById("checkbox_hhjggcylbl1").checked)
			    hhjggcylbldf = 8;
			if(document.getElementById("checkbox_hhjggcylbl2").checked)
			    hhjggcylbldf = 10;
			
			if(document.getElementById("checkbox_gnjjzjgcl1").checked)
			    gnjjzjgcldf = 5;
			if(document.getElementById("checkbox_gnjjzjgcl2").checked)
			    gnjjzjgcldf = 5;
			
			if(document.getElementById("checkbox_zzjzcykzlycl1").checked)
			    zzjzcykzlycldf = 8;
			if(document.getElementById("checkbox_zzjzcykzlycl2").checked)
			    zzjzcykzlycldf = 10;
			    
			if(document.getElementById("checkbox_ggjzcykzlycl1").checked)
			    ggjzcykzlycldf = 8;
			if(document.getElementById("checkbox_ggjzcykzlycl2").checked)
			    ggjzcykzlycldf = 10;   
			
			if(document.getElementById("checkbox_fqwjzcl1").checked)
			    fqwjzcldf = 3;
			if(document.getElementById("checkbox_fqwjzcl2").checked)
			    fqwjzcldf = 5;
			if(document.getElementById("checkbox_fqwjzcl3").checked)
			    fqwjzcldf = 5;
			
			if(document.getElementById("checkbox_zszxjzcl1").checked)
			    zszxjzcldf = 2;
			if(document.getElementById("checkbox_zszxjzcl2").checked)
			    zszxjzcldf = 2;
			if(document.getElementById("checkbox_zszxjzcl3").checked)
			    zszxjzcldf = 1;
			
			clxydf = rlmdf + ybhntdf + ybsjbldf + rsbdf + hntsxczdf + gcylbldf + (hhjgrsb + hhjghntsxcz + hhjggcylbldf)/2 + gnjjzjgcldf + zzjzcykzlycldf + ggjzcykzlycldf + fqwjzcldf + zszxjzcldf;
			
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/saveQ4Data",
	       		data: "jzid="+jzid+"&jcsjdf="+jcsjdf+"&clxydf="+clxydf,
	       		dataType:"json",
	        	success: function(data){
	        		if(data[0] == "0"){
	        			alert("材料选用得分保存失败！");
	        		}else if(data[0] == "1"){
	        			alert("材料选用得分保存成功！");
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
            <h1 class="page-head-line">材料选用</h1>
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
           	<td style="vertical-align: middle;width:25%;">
           		<b>选用本地生产的建筑材料情况</b>
           	</td>
           	<td style="vertical-align: middle;width:15%;">
           		施工现场500km以内生产的建筑材料重量占建筑材料总重量的比例Rlm
           	</td>		             
           	<td colspan="3" align="left">
          		<input type="checkbox" id="checkbox_rlm1" onclick="checkClickRlm(this);">60%≤Rlm＜70%</input><br/>
           		<input type="checkbox" id="checkbox_rlm2" onclick="checkClickRlm(this);">70%≤Rlm＜90%</input><br/>
           		<input type="checkbox" id="checkbox_rlm3" onclick="checkClickRlm(this);">Rrp≥90%</input>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td style="vertical-align: middle;width:25%;">
           		<b>现浇混凝土采用预拌混凝土情况</b>
           	</td>		             
           	<td colspan="4" align="left">
          		<input type="radio" name="radio_ybhnt" value="1">满足</input><br/>
           		<input type="radio" name="radio_ybhnt" value="2">不满足</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:25%;">
           		<b>建筑砂浆采用预拌砂浆情况</b>
           	</td>
           	<td style="vertical-align: middle;width:15%;">
           		建筑砂浆采用预拌砂浆的比例
           	</td>
           	<td colspan="3">
           		<input type="checkbox" id="checkbox_ybsjbl1" onclick="checkClickYbsjbl(this);">达到50%</input><br/>
           		<input type="checkbox" id="checkbox_ybsjbl2" onclick="checkClickYbsjbl(this);">达到100%</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td rowspan="6" style="vertical-align: middle;width:25%;">
           		<b>合理采用高强建筑结构材料情况</b>
           	</td>
           	<td rowspan="2" style="vertical-align: middle;width:15%;">
           		<input type="checkbox" id="checkbox_jzjg1" onclick="checkClickJzjg(this);">混凝土结构</input>
           	</td>
           	<td style="vertical-align: middle;width:15%;">
           		400MPa级及以上受力普通钢筋的比例Rsb
           	</td>
           	<td colspan="3" align="left">
          		<input type="checkbox" id="checkbox_rsb1" onclick="checkClickRsb(this);">30%≤Rsb＜50%</input><br/>
           		<input type="checkbox" id="checkbox_rsb2" onclick="checkClickRsb(this);">50%≤Rsb＜70%</input><br/>
           		<input type="checkbox" id="checkbox_rsb3" onclick="checkClickRsb(this);">70%≤Rsb＜85%</input><br/>
           		<input type="checkbox" id="checkbox_rsb4" onclick="checkClickRsb(this);">Rsb≥85%</input>
           	</td>
        </tr>
        <tr>
           	<td style="vertical-align: middle;width:20%;">
           		混凝土竖向承重结构采用强度等级不小于C50混凝土用量占竖向承重结构中混凝土总量的比例
           	</td>
           	<td colspan="4">
           		<input type="checkbox" id="checkbox_hntsxcz1" onclick="checkClickHntsxcz(this);">未达到50%</input><br/>
           		<input type="checkbox" id="checkbox_hntsxcz2" onclick="checkClickHntsxcz(this);">达到50%</input>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td style="vertical-align: middle;width:20%;">
           		<input type="checkbox" id="checkbox_jzjg2" onclick="checkClickJzjg(this);">钢结构</input>
           	</td>
           	<td style="vertical-align: middle;width:15%;">
           		Q345及以上高强钢材用量占钢材总量的比例
           	</td>
           	<td>
           		<input type="checkbox" id="checkbox_gcylbl1" onclick="checkClickGcylbl(this);">达到50%</input><br/>
           		<input type="checkbox" id="checkbox_gcylbl2" onclick="checkClickGcylbl(this);">达到70%</input>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td rowspan="3" style="vertical-align: middle;width:15%;">
           		<input type="checkbox" id="checkbox_jzjg3" onclick="checkClickJzjg(this);">混合结构</input>
           	</td>
           	<td rowspan="2" style="vertical-align: middle;">
           		混凝土结构部分
           	</td>
           	<td style="vertical-align: middle;width:20%;">
           		400MPa级及以上受力普通钢筋的比例Rsb
           	</td>
           	<td align="left">
          		<input type="checkbox" id="checkbox_hhjgrsb1" onclick="checkClickHhjgRsb(this);">30%≤Rsb＜50%</input><br/>
           		<input type="checkbox" id="checkbox_hhjgrsb2" onclick="checkClickHhjgRsb(this);">50%≤Rsb＜70%</input><br/>
           		<input type="checkbox" id="checkbox_hhjgrsb3" onclick="checkClickHhjgRsb(this);">70%≤Rsb＜85%</input><br/>
           		<input type="checkbox" id="checkbox_hhjgrsb4" onclick="checkClickHhjgRsb(this);">Rsb≥85%</input>
           	</td>
        </tr>
        <tr>
           	<td style="vertical-align: middle;width:20%;">
           		混凝土竖向承重结构采用强度等级不小于C50混凝土用量占竖向承重结构中混凝土总量的比例
           	</td>
           	<td colspan="2">
           		<input type="checkbox" id="checkbox_hhjghntsxcz1" onclick="checkClickHhjgHntsxcz(this);">未达到50%</input><br/>
           		<input type="checkbox" id="checkbox_hhjghntsxcz2" onclick="checkClickHhjgHntsxcz(this);">达到50%</input>
           	</td>
        </tr>
        <tr>
           	<td style="vertical-align: middle;">
           		钢结构部分
           	</td>
           	<td style="vertical-align: middle;width:20%;">
           		Q345及以上高强钢材用量占钢材总量的比例
           	</td>
           	<td colspan="3">
           		<input type="checkbox" id="checkbox_hhjggcylbl1" onclick="checkClickHhjgGcylbl(this);">达到50%</input><br/>
           		<input type="checkbox" id="checkbox_hhjggcylbl2" onclick="checkClickHhjgGcylbl(this);">达到70%</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:20%;">
           		<b>合理采用高耐久性建筑结构材料情况</b>
           	</td>
           	<td colspan="4" align="left">
          		<input type="checkbox" id="checkbox_gnjjzjgcl1" onclick="checkClickGnjjzjgcl(this);">对混凝土结构，其中高耐久性混凝土用量占混凝土总量的比例达到50%</input><br/>
           		<input type="checkbox" id="checkbox_gnjjzjgcl2" onclick="checkClickGnjjzjgcl(this);">对钢结构，采用耐候结构钢或耐候型防腐涂料</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td rowspan="2" style="vertical-align: middle;width:25%;">
           		<b>采用可再利用材料和可再循环材料情况</b>
           	</td>
           	<td style="vertical-align: middle;width:15%;">
           		住宅建筑
           	</td>
           	<td colspan="3">
           		<input type="checkbox" id="checkbox_zzjzcykzlycl1" onclick="checkClickZzjzcykzlycl(this);">可再利用材料和可再循环材料用量比例达到6%</input><br/>
           		<input type="checkbox" id="checkbox_zzjzcykzlycl2" onclick="checkClickZzjzcykzlycl(this);">可再利用材料和可再循环材料用量比例达到10%</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:15%;">
           		公共建筑
           	</td>
           	<td colspan="3">
           		<input type="checkbox" id="checkbox_ggjzcykzlycl1" onclick="checkClickGgjzcykzlycl(this);">可再利用材料和可再循环材料用量比例达到10%</input><br/>
           		<input type="checkbox" id="checkbox_ggjzcykzlycl2" onclick="checkClickGgjzcykzlycl(this);">可再利用材料和可再循环材料用量比例达到15%</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td rowspan="2" style="vertical-align: middle;width:25%;">
           		<b>使用以废弃物为原料生产的建筑材料情况</b>
           	</td>
           	<td colspan="4">
           		<input type="checkbox" id="checkbox_fqwjzcl1" onclick="checkClickFqwjzcl(this);">采用一种以废弃物为原料生产的建筑材料，其占同类建材的用量比例达到30%</input><br/>
           		<input type="checkbox" id="checkbox_fqwjzcl2" onclick="checkClickFqwjzcl(this);">采用一种以废弃物为原料生产的建筑材料，其占同类建材的用量比例达到50%</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td colspan="4">
           		<input type="checkbox" id="checkbox_fqwjzcl3" onclick="checkClickFqwjzcl(this);">采用两种及以上以废弃物为原料生产的建筑材料，每一种用量比例均达到30%</input>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td style="vertical-align: middle;width:25%;">
           		<b>合理采用耐久性好、易维护的装饰装修建筑材料情况</b>
           	</td>		             
           	<td colspan="4" align="left">
          		<input type="checkbox" id="checkbox_zszxjzcl1">合理采用清水混凝土</input><br/>
           		<input type="checkbox" id="checkbox_zszxjzcl2">采用耐久性好、易维护的外立面材料</input><br/>
           		<input type="checkbox" id="checkbox_zszxjzcl3">采用耐久性好、易维护的室内装饰装修材料</input>
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