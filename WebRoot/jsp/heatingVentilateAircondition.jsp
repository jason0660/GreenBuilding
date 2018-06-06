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
		
		function checkClickXzyh(obj){
			document.getElementById("checkbox_xzyh1").checked=false;
			document.getElementById("checkbox_xzyh2").checked=false;
			document.getElementById("checkbox_xzyh3").checked=false;
			obj.checked=true;
		}
		
		function saveData(){
			jzid = document.getElementById('jzmc').value;
			var nxyyxxbzdf=0,hdsrbbzdf=0,xzyhdf=0,jdgdjjnhdf=0,jdnhcsdf=0;
			var jzywhjgdf=0;
			var gntfyktdf=0;
			var zmydqdf=0;
			var nlzhlydf=0; 
			if(jzid == ""){
				alert("请选择建筑名称！");
				return;
			}
			
			var radio_nxyyxxbz=document.getElementsByName("radio_nxyyxxbz");
			for(var i=0;i<radio_nxyyxxbz.length;i++){
				if(radio_nxyyxxbz[i].checked==true){
					switch(radio_nxyyxxbz[i].value)
					{
					case "1":
						nxyyxxbzdf=6;
						break;
					case "2":
						nxyyxxbzdf=0;
						break;
					default:
						nxyyxxbzdf=0;
						break;
					}
				}
			}
			
			var radio_hdsrbbz=document.getElementsByName("radio_hdsrbbz");
			for(var i=0;i<radio_hdsrbbz.length;i++){
				if(radio_hdsrbbz[i].checked==true){
					switch(radio_hdsrbbz[i].value)
					{
					case "1":
						hdsrbbzdf=6;
						break;
					case "2":
						hdsrbbzdf=0;
						break;
					default:
						hdsrbbzdf=0;
						break;
					}
				}
			}
			
			if(document.getElementById("checkbox_xzyh1").checked)
			    xzyhdf=3;
			if(document.getElementById("checkbox_xzyh2").checked)
			    xzyhdf=7;
			if(document.getElementById("checkbox_xzyh3").checked)
			    xzyhdf=10;
			
			var radio_jdgdjjnh=document.getElementsByName("radio_jdgdjjnh");
			for(var i=0;i<radio_jdgdjjnh.length;i++){
				if(radio_jdgdjjnh[i].checked==true){
					switch(radio_jdgdjjnh[i].value)
					{
					case "1":
						jdgdjjnhdf=6;
						break;
					case "2":
						jdgdjjnhdf=0;
						break;
					default:
						jdgdjjnhdf=0;
						break;
					}
				}
			}
			
			
			if(document.getElementById("checkbox_jdnhcs1").checked)
			    jdnhcsdf += 3;
			if(document.getElementById("checkbox_jdnhcs2").checked)
			    jdnhcsdf += 3;
			if(document.getElementById("checkbox_jdnhcs3").checked)
			    jdnhcsdf += 3;
			
			gntfyktdf = nxyyxxbzdf + hdsrbbzdf + xzyhdf + jdgdjjnhdf + jdnhcsdf;
			
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/saveQ2Data",
	       		data: "jzid="+jzid+"&jzywhjgdf="+jzywhjgdf+"&gntfyktdf="+gntfyktdf+"&zmydqdf="+zmydqdf+"&nlzhlydf="+nlzhlydf,
	       		dataType:"json",
	        	success: function(data){
	        		if(data[0] == "0"){
	        			alert("供暖、通风与空调得分保存失败！");
	        		}else if(data[0] == "1"){
	        			alert("供暖、通风与空调得分保存成功！");
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
            <h1 class="page-head-line">供暖、通风与空调</h1>
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
           		<b>供暖空调系统的冷、热源机组能效均优于现行国家标准《公共建筑节能设计标准》GB 50189的规定以及现行有关国家标准能效限定值的要求</b>
           	</td>		             
           	<td colspan="2" align="left">
          		<input type="radio" name="radio_nxyyxxbz" value="1">满足</input><br/>
           		<input type="radio" name="radio_nxyyxxbz" value="2">不满足</input>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td style="vertical-align: middle;width:45%;">
           		<b>集中供暖系统热水循环泵的耗电输热比和通风空调系统风机的单位风量耗功率符合现行国家标准《公共建筑节能设计标准》GB 50189的有关规定，且空调冷热水系统循环水泵的耗电输冷（热）比比现行国家标准《民用建筑供暖通风与空气调节设计规范》GB 50736规定值低20%</b>
           	</td>		             
           	<td colspan="2" align="left">
          		<input type="radio" name="radio_hdsrbbz" value="1">满足</input><br/>
           		<input type="radio" name="radio_hdsrbbz" value="2">不满足</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:45%;">
           		<b>合理选择和优化供暖、通风与空调系统</b>
           	</td>
           	<td>
           		<input type="checkbox" id="checkbox_xzyh1" onclick="checkClickXzyh(this);">供暖、通风与空调系统能耗降低幅度De 5%≤De<10%</input><br/>
           		<input type="checkbox" id="checkbox_xzyh2" onclick="checkClickXzyh(this);">供暖、通风与空调系统能耗降低幅度De 10%≤De<15%</input><br/>
           		<input type="checkbox" id="checkbox_xzyh3" onclick="checkClickXzyh(this);">供暖、通风与空调系统能耗降低幅度De De≥15%</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:45%;">
           		<b>采取有效措施降低过渡季节供暖、通风与空调系统能耗</b>
           	</td>
           	<td colspan="2" align="left">
          		<input type="radio" name="radio_jdgdjjnh" value="1">满足</input><br/>
           		<input type="radio" name="radio_jdgdjjnh" value="2">不满足</input>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td rowspan="2" style="vertical-align: middle;width:45%;">
           		<b>采取措施降低部分负荷、部分空间使用下的供暖、通风与空调系统能耗</b>
           	</td>
           	<td>
           		<input type="checkbox" id="checkbox_jdnhcs1" onclick="checkClickJdnhcs(this);">区分房间朝向，细分供暖、空调区域，对系统进行分区控制</input><br/>
           		<input type="checkbox" id="checkbox_jdnhcs2" onclick="checkClickJdnhcs(this);">合理选配空调冷、热源机组台数与容量，制定实施根据负荷变化调节制冷（热）量的控制策略，且空调冷源的部分负荷性能符合现行国家标准《公共建筑节能设计标准》GB 50189的规定</input><br/>
           		<input type="checkbox" id="checkbox_jdnhcs3" onclick="checkClickJdnhcs(this);">水系统、风系统采用变频技术，且采取相应的水里平衡措施</input>
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