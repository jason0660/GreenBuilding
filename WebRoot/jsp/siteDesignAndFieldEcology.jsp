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
		
		function checkClickJzldpzlhqk(obj){
			document.getElementById("checkbox_jzjzldpz").checked=false;
			document.getElementById("checkbox_ggjzlhqk").checked=false;
			obj.checked=true;
		}
		
		function checkClickCdnjlzlkz(obj){
			document.getElementById("checkbox_cdnjlzlkz1").checked=false;
			document.getElementById("checkbox_cdnjlzlkz2").checked=false;
			obj.checked=true;
		}
		
		function saveData(){
			jzid = document.getElementById('jzmc').value;
			var cdsjyjzbjdf,txsgnldzbdbdf,ysjrdmstssdf,tspzmjdbdf,cdnjlzlkzdf,lhdbdf,jzldpzlhqkdf;
			var jtssyggfwdf=0;
			var tdlydf=0;
			var swhjdf=0;
			var cdsjycdstdf; 
			if(jzid == ""){
				alert("请选择建筑名称！");
				return;
			}
			
			var radio_cdsjyjzbj=document.getElementsByName("radio_cdsjyjzbj");
			for(var i=0;i<radio_cdsjyjzbj.length;i++){
				if(radio_cdsjyjzbj[i].checked==true){
					switch(radio_cdsjyjzbj[i].value)
					{
					case "1":
						cdsjyjzbjdf=3;
						break;
					case "2":
						cdsjyjzbjdf=0;
						break;
					default:
						cdsjyjzbjdf=0;
						break;
					}
				}
			}
			
			var radio_txsgnldzbdb=document.getElementsByName("radio_txsgnldzbdb");
			for(var i=0;i<radio_txsgnldzbdb.length;i++){
				if(radio_txsgnldzbdb[i].checked==true){
					switch(radio_txsgnldzbdb[i].value)
					{
					case "1":
						txsgnldzbdbdf=3;
						break;
					case "2":
						txsgnldzbdbdf=0;
						break;
					default:
						txsgnldzbdbdf=0;
						break;
					}
				}
			}
			
			var radio_ysjrdmstss=document.getElementsByName("radio_ysjrdmstss");
			for(var i=0;i<radio_ysjrdmstss.length;i++){
				if(radio_ysjrdmstss[i].checked==true){
					switch(radio_ysjrdmstss[i].value)
					{
					case "1":
						ysjrdmstssdf=3;
						break;
					case "2":
						ysjrdmstssdf=0;
						break;
					default:
						ysjrdmstssdf=0;
						break;
					}
				}
			}
			
			var radio_tspzmjdb=document.getElementsByName("radio_tspzmjdb");
			for(var i=0;i<radio_tspzmjdb.length;i++){
				if(radio_tspzmjdb[i].checked==true){
					switch(radio_tspzmjdb[i].value)
					{
					case "1":
						tspzmjdbdf=3;
						break;
					case "2":
						tspzmjdbdf=0;
						break;
					default:
						tspzmjdbdf=0;
						break;
					}
				}
			}
			
			if(document.getElementById("checkbox_cdnjlzlkz1").checked)
			    cdnjlzlkzdf=3;
			
			if(document.getElementById("checkbox_cdnjlzlkz2").checked)
			    cdnjlzlkzdf=6;
			
			var radio_lhdb=document.getElementsByName("radio_lhdb");
			for(var i=0;i<radio_lhdb.length;i++){
				if(radio_lhdb[i].checked==true){
					switch(radio_lhdb[i].value)
					{
					case "1":
						lhdbdf=3;
						break;
					case "2":
						lhdbdf=0;
						break;
					default:
						lhdbdf=0;
						break;
					}
				}
			}
			
			if(document.getElementById("checkbox_jzjzldpz").checked || document.getElementById("checkbox_ggjzlhqk").checked)
			    jzldpzlhqkdf=3;
			
			cdsjycdstdf = cdsjyjzbjdf + txsgnldzbdbdf + ysjrdmstssdf + tspzmjdbdf + cdnjlzlkzdf + lhdbdf + jzldpzlhqkdf;
			
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/saveQ1Data",
	       		data: "jzid="+jzid+"&tdlydf="+tdlydf+"&swhjdf="+swhjdf+"&jtssyggfwdf="+jtssyggfwdf+"&cdsjycdstdf="+cdsjycdstdf,
	       		dataType:"json",
	        	success: function(data){
	        		if(data[0] == "0"){
	        			alert("场地设计与场地生态得分保存失败！");
	        		}else if(data[0] == "1"){
	        			alert("场地设计与场地生态得分保存成功！");
	        		}
	        	},
	        	error: function(XMLResponse){
	        		alert("qError!!");
	        	}	
	   	    });
		}
	</script>
</head>
<body onload="getBuilding();">
	<div class="row" style="border:0px solid #F00;">
        <div class="col-md-12">
            <h1 class="page-head-line">场地设计与场地生态</h1>
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
           		<b>结合现状地形地貌进行场地设计与建筑布局，保护场地内原有的自然水域、湿地和植被，采取表层土利用等生态补偿措施</b>
           	</td>		             
           	<td colspan="2" align="left">
          		<input type="radio" name="radio_cdsjyjzbj" value="1">是</input><br/>
           		<input type="radio" name="radio_cdsjyjzbj" value="2">否</input>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td rowspan="3" style="vertical-align: middle;width:15%;">
           		<b>充分利用场地空间合理设置绿色雨水基础设施，对大于10h㎡的场地进行雨水装修规划设计</b>
           	</td>
           	<td style="vertical-align: middle;width:25%;">
           		下凹式绿地、雨水花园等有调蓄雨水功能的绿地和水体的面积之和占绿地面积的比例达到30%
           	</td>
           	<td>
           		<input type="radio" name="radio_txsgnldzbdb" value="1">是</input><br/>
           		<input type="radio" name="radio_txsgnldzbdb" value="2">否</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:25%;">
           		合理衔接和引导屋面雨水、道路雨水进入地面生态设施，并采取相应的径流污染控制措施
           	</td>
           	<td>
           		<input type="radio" name="radio_ysjrdmstss" value="1">是</input><br/>
           		<input type="radio" name="radio_ysjrdmstss" value="2">否</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:25%;">
           		硬质铺装地面中透水铺装面积的比例达到50%
           	</td>
           	<td>
           		<input type="radio" name="radio_tspzmjdb" value="1">是</input><br/>
           		<input type="radio" name="radio_tspzmjdb" value="2">否</input>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td style="vertical-align: middle;width:25%;">
           		<b>合理规划地表与屋面雨水径流，对场地雨水实施外排总量控制</b>
           	</td>
           	<td colspan="2">
           		<input type="checkbox" id="checkbox_cdnjlzlkz1" onclick="checkClickCdnjlzlkz(this);">场地年径流总量控制率达到55%</input><br/>
           		<input type="checkbox" id="checkbox_cdnjlzlkz2" onclick="checkClickCdnjlzlkz(this);">场地年径流总量控制率达到70%</input><br/>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td rowspan="2" style="vertical-align: middle;width:15%;">
           		<b>合理选择绿化方式，科学配置绿化植物情况</b>
           	</td>
           	<td style="vertical-align: middle;width:25%;">
           		种植适应当地气候和土壤条件的植物，采用乔、灌、草结合的复层绿化，种植区域覆土深度和排水能力满足植物生长需求
           	</td>
           	<td>
           		<input type="radio" name="radio_lhdb" value="1">是</input><br/>
           		<input type="radio" name="radio_lhdb" value="2">否</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:25%;">
           		建筑绿地配植、绿化情况
           	</td>
           	<td>
           		<input type="checkbox" id="checkbox_jzjzldpz" onclick="checkClickJzldpzlhqk(this);">居住建筑绿地配植乔木不少于3株/100㎡</input><br/>
           		<input type="checkbox" id="checkbox_ggjzlhqk" onclick="checkClickJzldpzlhqk(this);">公共建筑采用垂直绿化、屋顶绿化等方式</input>
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