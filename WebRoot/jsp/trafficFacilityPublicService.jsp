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
		
		function saveData(){
			jzid = document.getElementById('jzmc').value;
			var ggjt1df,ggjt2df,ggjt3df,wzasjdf,zxctcssdf,jdctcssdf,jdctcssmzx=0,jzjzggfwdf,jzjzggfwmzx=0,ggjzggfwdf,ggjzggfwmzx=0;
			var jtssyggfwdf;
			var tdlydf=0;
			var swhjdf=0;
			var cdsjycdstdf=0; 
			if(jzid == ""){
				alert("请选择建筑名称！");
				return;
			}
			
			if(document.getElementById("checkbox_ggjt1").checked)
			    ggjt1df=3;
			else
				ggjt1df=0;
			
			if(document.getElementById("checkbox_ggjt2").checked)
			    ggjt2df=3;
			else
				ggjt2df=0;
			
			if(document.getElementById("checkbox_ggjt3").checked)
			    ggjt3df=3;
			else
				ggjt3df=0;
			
			var radio_wzasj=document.getElementsByName("radio_wzasj");
			for(var i=0;i<radio_wzasj.length;i++){
				if(radio_wzasj[i].checked==true){
					switch(radio_wzasj[i].value)
					{
					case "1":
						wzasjdf=3;
						break;
					case "2":
						wzasjdf=0;
						break;
					default:
						wzasjdf=0;
						break;
					}
				}
			}
			
			var radio_zxctcss=document.getElementsByName("radio_zxctcss");
			for(var i=0;i<radio_zxctcss.length;i++){
				if(radio_zxctcss[i].checked==true){
					switch(radio_zxctcss[i].value)
					{
					case "1":
						zxctcssdf=3;
						break;
					case "2":
						zxctcssdf=0;
						break;
					default:
						zxctcssdf=0;
						break;
					}
				}
			}
			
			if(document.getElementById("checkbox_jdctcss1").checked)
			    jdctcssmzx += 1;
			
			if(document.getElementById("checkbox_jdctcss2").checked)
			    jdctcssmzx += 1;
			
			if(document.getElementById("checkbox_jdctcss3").checked)
			    jdctcssmzx += 1;
			    
			if(jdctcssmzx >= 2)
				jdctcssdf = 3;
			else
				jdctcssdf = 0;
			
			if(document.getElementById("checkbox_jzjzggfw1").checked)
			    jzjzggfwmzx += 1;
			
			if(document.getElementById("checkbox_jzjzggfw2").checked)
			    jzjzggfwmzx += 1;
			
			if(document.getElementById("checkbox_jzjzggfw3").checked)
			    jzjzggfwmzx += 1;
			    
			if(document.getElementById("checkbox_jzjzggfw4").checked)
			    jzjzggfwmzx += 1;
			
			if(document.getElementById("checkbox_jzjzggfw5").checked)
			    jzjzggfwmzx += 1;
			    
			if(jzjzggfwmzx >= 4)
				jzjzggfwdf = 6;
			else if(jzjzggfwmzx >= 3 && jzjzggfwmzx < 4)
				jzjzggfwdf = 3;
			else
				jzjzggfwdf = 0;
			
			if(document.getElementById("checkbox_ggjzggfw1").checked)
			    ggjzggfwmzx += 1;
			
			if(document.getElementById("checkbox_ggjzggfw2").checked)
			    ggjzggfwmzx += 1;
			
			if(document.getElementById("checkbox_ggjzggfw3").checked)
			    ggjzggfwmzx += 1;
			    
			if(document.getElementById("checkbox_ggjzggfw4").checked)
			    ggjzggfwmzx += 1;
			   
			if(ggjzggfwmzx >= 3)
				ggjzggfwdf = 6;
			else if(ggjzggfwmzx >= 2)
				ggjzggfwdf = 3;
			else
				ggjzggfwdf = 0;
			
			jtssyggfwdf = ggjt1df + ggjt2df + ggjt3df + wzasjdf + zxctcssdf + jdctcssdf + jzjzggfwdf + ggjzggfwdf;
			
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/saveQ1Data",
	       		data: "jzid="+jzid+"&tdlydf="+tdlydf+"&swhjdf="+swhjdf+"&jtssyggfwdf="+jtssyggfwdf+"&cdsjycdstdf="+cdsjycdstdf,
	       		dataType:"json",
	        	success: function(data){
	        		if(data[0] == "0"){
	        			alert("交通设施与公共服务得分保存失败！");
	        		}else if(data[0] == "1"){
	        			alert("交通设施与公共服务得分保存成功！");
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
            <h1 class="page-head-line">交通设施与公共服务</h1>
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
           		<b>场地与公共交通设施情况</b>
           	</td>		             
           	<td colspan="2" align="left">
          			<input type="checkbox" id="checkbox_ggjt1">场地出入口到达公共汽车站的步行距离不大于500m，或者到达轨道交通站的步行距离不大于800m</input><br/>
          			<input type="checkbox" id="checkbox_ggjt2">场地出入口步行距离800m范围内设有2条及以上线路的公共交通站点（含公共汽车站和轨道交通站）</input><br/>
          			<input type="checkbox" id="checkbox_ggjt3">有便捷的人行通道联系公共交通站点</input>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td style="vertical-align: middle;width:15%;">
           		<b>场地内人行通道采用无障碍设计情况</b>
           	</td>
           	<td colspan="2">
           		<input type="radio" name="radio_wzasj" value="1">满足</input><br/>
           		<input type="radio" name="radio_wzasj" value="2">不满足</input>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td rowspan="2" style="vertical-align: middle;width:15%;">
           		<b>合理设置停车场所情况</b>
           	</td>
           	<td style="vertical-align: middle;width:25%;">
           		自行车停车设施位置合理、方便出入，且有遮阳防雨措施
           	</td>
           	<td>
           		<input type="radio" name="radio_zxctcss" value="1">满足</input><br/>
           		<input type="radio" name="radio_zxctcss" value="2">不满足</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:25%;">
           		合理设置机动车停车设施，并采取下列措施中至少2项
           	</td>
           	<td>
           		<input type="checkbox" id="checkbox_jdctcss1">采用机械式停车库、地下停车库或停车楼等方式节约集约用地</input><br/>
           		<input type="checkbox" id="checkbox_jdctcss2">采用错时停车方式向社会开发，提高停车场（库）使用效率</input><br/>
           		<input type="checkbox" id="checkbox_jdctcss3">合理设计地面停车位，不挤占步行空间及活动场所</input>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td style="vertical-align: middle;width:15%;">
           		<b>提供便利的公共服务情况</b>
           	</td>
           	<td colspan="2">
           		<div class="tabs" style="border:0px solid #F60;margin:5px 0px; width:100%; height:100%;background: #FFF;">
			        <input type="radio" id="tab-one" name="tabbb" checked data-tabname="tab1" class="tab-radio">
			        <label for="tab-one" class="tab-label">居住建筑</label>			
			        <input type="radio" id="tab-two" name="tabbb" data-tabname="tab2" class="tab-radio">
			        <label for="tab-two" class="tab-label">公共建筑</label>		        
			        <div class="panels" style="border:0px solid #F60;width:100%; height:100%;background: #FFF;">
			            <div data-tabname="tab1" class="panel-item" style="border:0px solid #F60;margin:0px 2px;background: #FFF;">
							<table border="0" class="table table-striped table-bordered table-hover" style="width:100%;height:100%; margin:0px 0px;background: #FFF;" >
					             <tr style="height:2px">
					             	<td style="vertical-align: middle;width:25%;">
					             		居住建筑提供便利的公共服务情况
					             	</td>
					             	<td>
					             		<input type="checkbox" id="checkbox_jzjzggfw1">场地出入口到达幼儿园的步行距离不大于300m</input><br/>
					             		<input type="checkbox" id="checkbox_jzjzggfw2">场地出入口到达小学的步行距离不大于500m</input><br/>
					             		<input type="checkbox" id="checkbox_jzjzggfw3">场地出入口到达商业服务设施的步行距离不大于500m</input><br/>
					             		<input type="checkbox" id="checkbox_jzjzggfw4">相关设施集中设置并向周边居民开放</input><br/>
					             		<input type="checkbox" id="checkbox_jzjzggfw5">场地1000m范围内设有5种及以上的公共服务设施</input>
					             	</td>
					             </tr>							             
							</table>
			            </div>
			            <div data-tabname="tab2" class="panel-item hidden" style="padding:0px 0px;background: #FFF;">
			            	<table border="0" class="table table-bordered" style="width:100%;height:100%; background: #FFF;" >
					             <tr style="height:2px">
					             	<td style="vertical-align: middle;width:25%;">
					             		公共建筑提供便利的公共服务情况
					             	</td>
					             	<td>
					             		<input type="checkbox" id="checkbox_ggjzggfw1">2种及以上的公共建筑集中设置，或公共建筑兼容2种及以上的公共服务功能</input><br/>
					             		<input type="checkbox" id="checkbox_ggjzggfw2">配套辅助设施设备共同使用、资源共享</input><br/>
					             		<input type="checkbox" id="checkbox_ggjzggfw3">建筑向社会公众提供开发的公共空间</input><br/>
					             		<input type="checkbox" id="checkbox_ggjzggfw4">室外活动场地错时向周边居民免费开放</input>
					             	</td>
					             </tr>
							</table>
			            </div>
			        </div>
			    </div>
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