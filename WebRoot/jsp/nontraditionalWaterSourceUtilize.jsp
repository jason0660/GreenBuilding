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
		
		function checkClickJz(obj){
			document.getElementById("checkbox_jzlx1").checked=false;
			document.getElementById("checkbox_jzlx2").checked=false;
			
			document.getElementById("checkbox_zz").checked=false;
			document.getElementById("checkbox_sy").checked=false;
			document.getElementById("checkbox_bg").checked=false;
			document.getElementById("checkbox_lg").checked=false;
			
			document.getElementById("checkbox_zz1").checked=false;
			document.getElementById("checkbox_zz2").checked=false;
			document.getElementById("checkbox_zz3").checked=false;
			
			document.getElementById("checkbox_bg1").checked=false;
			document.getElementById("checkbox_bg2").checked=false;
			document.getElementById("checkbox_bg3").checked=false;
			
			document.getElementById("checkbox_sy1").checked=false;
			document.getElementById("checkbox_sy2").checked=false;
			document.getElementById("checkbox_sy3").checked=false;
			
			document.getElementById("checkbox_lg1").checked=false;
			document.getElementById("checkbox_lg2").checked=false;
			document.getElementById("checkbox_lg3").checked=false;
			
			document.getElementById("checkbox_fctsyyslzb1").checked=false;
			document.getElementById("checkbox_fctsyyslzb2").checked=false;
			
			obj.checked=true;
		}
		
		function checkClickJzlx(obj){
			if(document.getElementById("checkbox_jzlx1").checked==true){
				document.getElementById("checkbox_zz").checked=false;
				document.getElementById("checkbox_sy").checked=false;
				document.getElementById("checkbox_bg").checked=false;
				document.getElementById("checkbox_lg").checked=false;
				
				document.getElementById("checkbox_zz1").checked=false;
				document.getElementById("checkbox_zz2").checked=false;
				document.getElementById("checkbox_zz3").checked=false;
				
				document.getElementById("checkbox_bg1").checked=false;
				document.getElementById("checkbox_bg2").checked=false;
				document.getElementById("checkbox_bg3").checked=false;
				
				document.getElementById("checkbox_sy1").checked=false;
				document.getElementById("checkbox_sy2").checked=false;
				document.getElementById("checkbox_sy3").checked=false;
				
				document.getElementById("checkbox_lg1").checked=false;
				document.getElementById("checkbox_lg2").checked=false;
				document.getElementById("checkbox_lg3").checked=false;
				
				obj.checked=true;
			}
			else{
				alert("只有建筑类型选择了‘住宅、办公、商场、旅馆类建筑’才能勾选此项！");
		    	obj.checked=false;
			}
		}
		
		function checkClickZz1(obj){
			if(document.getElementById("checkbox_zz").checked==true){
				document.getElementById("checkbox_zz1").checked=false;
				document.getElementById("checkbox_zz2").checked=false;
				document.getElementById("checkbox_zz3").checked=false;
				obj.checked=true;
			}
		    else{
		    	alert("只有建筑类型选择了‘住宅’才能勾选此项！");
		    	obj.checked=false;
		    }
		}
		
		function checkClickBg1(obj){
			if(document.getElementById("checkbox_bg").checked==true){
				document.getElementById("checkbox_bg1").checked=false;
				document.getElementById("checkbox_bg2").checked=false;
				document.getElementById("checkbox_bg3").checked=false;
				obj.checked=true;
			}
		    else{
		    	alert("只有建筑类型选择了‘办公’才能勾选此项！");
		    	obj.checked=false;
		    }
		}
		
		function checkClickSy1(obj){
			if(document.getElementById("checkbox_sy").checked==true){
				document.getElementById("checkbox_sy1").checked=false;
				document.getElementById("checkbox_sy2").checked=false;
				document.getElementById("checkbox_sy3").checked=false;
				obj.checked=true;
			}
		    else{
		    	alert("只有建筑类型选择了‘商业’才能勾选此项！");
		    	obj.checked=false;
		    }
		}
		
		function checkClickLg1(obj){
			if(document.getElementById("checkbox_lg").checked==true){
				document.getElementById("checkbox_lg1").checked=false;
				document.getElementById("checkbox_lg2").checked=false;
				document.getElementById("checkbox_lg3").checked=false;
				obj.checked=true;
			}
		    else{
		    	alert("只有建筑类型选择了‘旅馆’才能勾选此项！");
		    	obj.checked=false;
		    }
		}
		
		function checkClickRnt(obj){
			document.getElementById("checkbox_rnt1").checked=false;
			document.getElementById("checkbox_rnt2").checked=false;
			document.getElementById("checkbox_rnt3").checked=false;
			obj.checked=true;
		}
			
		function checkClickFctsyyslzb(obj){
			if(document.getElementById("checkbox_jzlx2").checked==true){
				obj.checked=true;
			}
		    else{
		    	alert("只有建筑类型选择了‘其它类型建筑’才能勾选此项！");
		    	obj.checked=false;
		    }
		}
		
		function saveData(){
			jzid = document.getElementById('jzmc').value;
			var fctsylydf1=0,fctsylydf2=0,rntdf=0,yslyqkdf=0;
			var jsxtdf=0;
			var jsqjysbdf=0;
			var fctsylydf=0;
			 
			if(jzid == ""){
				alert("请选择建筑名称！");
				return;
			}
			
			if(document.getElementById("checkbox_zz1").checked)
			    fctsylydf1=5;
			if(document.getElementById("checkbox_zz2").checked)
			    fctsylydf1=7;
			if(document.getElementById("checkbox_zz3").checked)
			    fctsylydf1=15;			
			
			if(document.getElementById("checkbox_bg1").checked)
			    fctsylydf1 = 5;
			if(document.getElementById("checkbox_bg2").checked)
			    fctsylydf1 = 10;
			if(document.getElementById("checkbox_bg3").checked)
			    fctsylydf1 = 15;
			    
			if(document.getElementById("checkbox_sy1").checked)
			    fctsylydf1=2;
			if(document.getElementById("checkbox_sy2").checked)
			    fctsylydf1=10;
			if(document.getElementById("checkbox_sy3").checked)
			    fctsylydf1=15;
			    
			if(document.getElementById("checkbox_lg1").checked)
			    fctsylydf1 = 2;
			if(document.getElementById("checkbox_lg2").checked)
			    fctsylydf1 = 10;
			if(document.getElementById("checkbox_lg3").checked)
			    fctsylydf1 = 15;
			    
			if(document.getElementById("checkbox_fctsyyslzb1").checked)
			    fctsylydf2 = 7;
			if(document.getElementById("checkbox_fctsyyslzb2").checked)
			    fctsylydf2 = 8;			    
			
			if(document.getElementById("checkbox_rnt1").checked)
			    rntdf = 4;
			if(document.getElementById("checkbox_rnt2").checked)
			    rntdf = 6;
			if(document.getElementById("checkbox_rnt3").checked)
			    rntdf = 8;
			
			if(document.getElementById("checkbox_yslyqk1").checked)
			    yslyqkdf = 4;
			if(document.getElementById("checkbox_yslyqk2").checked)
			    yslyqkdf = 3;
			
			fctsylydf = fctsylydf1 + fctsylydf2 + rntdf + yslyqkdf;
			
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/saveQ3Data",
	       		data: "jzid="+jzid+"&jsxtdf="+jsxtdf+"&jsqjysbdf="+jsqjysbdf+"&fctsylydf="+fctsylydf,
	       		dataType:"json",
	        	success: function(data){
	        		if(data[0] == "0"){
	        			alert("非传统水源利用得分保存失败！");
	        		}else if(data[0] == "1"){
	        			alert("非传统水源利用得分保存成功！");
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
            <h1 class="page-head-line">非传统水源利用</h1>
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
        <tr style="height:2px">
        	<td colspan="2" align="center">
        		<b>合理使用非传统水源情况</b>
        	</td>
        </tr>
        <tr style="height:5px">
           	<td style="vertical-align: middle;width:35%;">
           		<b>&emsp;<input type="checkbox" id="checkbox_jzlx1" onclick="checkClickJz(this);">&nbsp;住宅、办公、商场、旅馆类建筑</input></b>
           	</td>		             
           	<td colspan="2" align="left" width="65%">
           		<table border="1" width="100%">
           			<tr>
           				<td rowspan="2" width="11%" align="center">建筑类型</td>
           				<td colspan="2" align="center">非传统水源利用率</td>
           				<td colspan="4" align="center">非传统水源利用措施</td>
           			</tr>
           			<tr>
           				<td width="13%" align="center">有市政再生水供应</td>
           				<td width="13%" align="center">无市政再生水供应</td>
           				<td width="15%" align="center">室内冲厕</td>
           				<td width="18%" align="center">室内绿化灌溉</td>
           				<td width="15%" align="center">道路浇洒</td>
           				<td width="15%" align="center">洗车用水</td>
           			</tr>
           			<tr>
           				<td rowspan="3" width="15%" align="center"><input type="checkbox" id="checkbox_zz" onclick="checkClickJzlx(this);">住宅</input></td>
           				<td>&emsp;&emsp;&emsp;<input type="checkbox" id="checkbox_zz1" onclick="checkClickZz1(this);">&nbsp;8.0%</input></td>
           				<td align="center">4.0%</td>
           				<td align="center">——</td>
           				<td align="center">●○</td>
           				<td align="center">●</td>
           				<td align="center">●</td>
           			</tr>
           			<tr>
           				<td>&emsp;&emsp;&emsp;<input type="checkbox" id="checkbox_zz2" onclick="checkClickZz1(this);">&nbsp;——</input></td>
           				<td align="center">8.0%</td>
           				<td align="center">——</td>
           				<td align="center">○</td>
           				<td align="center">○</td>
           				<td align="center">○</td>
           			</tr>
           			<tr>
           				<td>&emsp;&emsp;&emsp;<input type="checkbox" id="checkbox_zz3" onclick="checkClickZz1(this);">&nbsp;30.0%</input></td>
           				<td align="center">30.0%</td>
           				<td align="center">●○</td>
           				<td align="center">●○</td>
           				<td align="center">●○</td>
           				<td align="center">●○</td>
           			</tr>
           			<tr>
           				<td rowspan="3" width="15%" align="center"><input type="checkbox" id="checkbox_bg" onclick="checkClickJzlx(this);">办公</input></td>
           				<td>&emsp;&emsp;&emsp;<input type="checkbox" id="checkbox_bg1" onclick="checkClickBg1(this);">&nbsp;10.0%</input></td>
           				<td align="center">——</td>
           				<td align="center">——</td>
           				<td align="center">●</td>
           				<td align="center">●</td>
           				<td align="center">●</td>
           			</tr>
           			<tr>
           				<td>&emsp;&emsp;&emsp;<input type="checkbox" id="checkbox_bg2" onclick="checkClickBg1(this);">&nbsp;——</input></td>
           				<td align="center">8.0%</td>
           				<td align="center">——</td>
           				<td align="center">○</td>
           				<td align="center">——</td>
           				<td align="center">——</td>
           			</tr>
           			<tr>
           				<td>&emsp;&emsp;&emsp;<input type="checkbox" id="checkbox_bg3" onclick="checkClickBg1(this);">&nbsp;50.0%</input></td>
           				<td align="center">10.0%</td>
           				<td align="center">●</td>
           				<td align="center">●○</td>
           				<td align="center">●○</td>
           				<td align="center">●○</td>
           			</tr>
           			<tr>
           				<td rowspan="3" width="15%" align="center"><input type="checkbox" id="checkbox_sy" onclick="checkClickJzlx(this);">商业</input></td>
           				<td>&emsp;&emsp;&emsp;<input type="checkbox" id="checkbox_sy1" onclick="checkClickSy1(this);">&nbsp;3.0%</input></td>
           				<td align="center">——</td>
           				<td align="center">——</td>
           				<td align="center">●</td>
           				<td align="center">●</td>
           				<td align="center">●</td>
           			</tr>
           			<tr>
           				<td>&emsp;&emsp;&emsp;<input type="checkbox" id="checkbox_sy2" onclick="checkClickSy1(this);">&nbsp;——</input></td>
           				<td align="center">2.5%</td>
           				<td align="center">——</td>
           				<td align="center">○</td>
           				<td align="center">——</td>
           				<td align="center">——</td>
           			</tr>
           			<tr>
           				<td>&emsp;&emsp;&emsp;<input type="checkbox" id="checkbox_sy3" onclick="checkClickSy1(this);">&nbsp;50.0%</input></td>
           				<td align="center">3.0%</td>
           				<td align="center">●</td>
           				<td align="center">●○</td>
           				<td align="center">●○</td>
           				<td align="center">●○</td>
           			</tr>
           			<tr>
           				<td rowspan="3" width="15%" align="center"><input type="checkbox" id="checkbox_lg" onclick="checkClickJzlx(this);">旅馆</input></td>
           				<td>&emsp;&emsp;&emsp;<input type="checkbox" id="checkbox_lg1" onclick="checkClickLg1(this);">&nbsp;2.0%</input></td>
           				<td align="center">——</td>
           				<td align="center">——</td>
           				<td align="center">●</td>
           				<td align="center">●</td>
           				<td align="center">●</td>
           			</tr>
           			<tr>
           				<td>&emsp;&emsp;&emsp;<input type="checkbox" id="checkbox_lg2" onclick="checkClickLg1(this);">&nbsp;——</input></td>
           				<td align="center">1.0%</td>
           				<td align="center">——</td>
           				<td align="center">○</td>
           				<td align="center">——</td>
           				<td align="center">——</td>
           			</tr>
           			<tr>
           				<td>&emsp;&emsp;&emsp;<input type="checkbox" id="checkbox_lg3" onclick="checkClickLg1(this);">&nbsp;12.0%</input></td>
           				<td align="center">2.0%</td>
           				<td align="center">●</td>
           				<td align="center">●○</td>
           				<td align="center">●○</td>
           				<td align="center">●○</td>
           			</tr>
           		</table>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td style="vertical-align: middle;width:35%;">
           		<b>&emsp;<input type="checkbox" id="checkbox_jzlx2" onclick="checkClickJz(this);">&nbsp;其它类型建筑</input></b>
           	</td>		             
           	<td colspan="2" align="left">
          		<input type="checkbox" id="checkbox_fctsyyslzb1" onclick="checkClickFctsyyslzb(this);">绿化灌溉、道路冲洗、洗车用水采用非传统水源的用水量占其总用水量的比例不低于80%</input><br/>
           		<input type="checkbox" id="checkbox_fctsyyslzb2" onclick="checkClickFctsyyslzb(this);">冲厕采用非传统水源的用水量占其用水量的比例不低于50%</input>
           	</td>
        </tr>
        <tr style="height:2px">
        	<td colspan="2" align="center">
        		<b>冷却水补水使用非传统水源情况</b>
        	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:35%;">
           		<b>冷却水补水使用非传统水源的量占总用水量比例Rnt</b>
           	</td>
           	<td>
           		<input type="checkbox" id="checkbox_rnt1" onclick="checkClickRnt(this);">10%≤Rnt＜30%</input><br/>
           		<input type="checkbox" id="checkbox_rnt2" onclick="checkClickRnt(this);">30%≤Rnt＜50%</input><br/>
           		<input type="checkbox" id="checkbox_rnt3" onclick="checkClickRnt(this);">Rnt≥50%</input>
           	</td>
        </tr>
        <tr style="height:2px">
        	<td colspan="2" align="center">
        		<b>雨水利用情况</b>
        	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:35%;">
           		<b>结合雨水利用设施进行景观水体设计，景观水体利用雨水的补水量大于其水体蒸发量的60%，且采用生态水处理技术保障水体水质</b>
           	</td>
           	<td colspan="2" align="left">
          		<input type="checkbox" id="checkbox_yslyqk1">对进入景观水体的雨水采取控制面源污染的措施</input><br/>
           		<input type="checkbox" id="checkbox_yslyqk2">利用水生动、植物进行水体净化</input>
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