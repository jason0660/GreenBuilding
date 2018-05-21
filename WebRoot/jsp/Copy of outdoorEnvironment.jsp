<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>建筑基本信息</title>

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
		var jzmc = "";
		function getBuilding(nature){
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/getBuildingByNature",
	       		data: "nature="+nature,
	       		dataType:"json",
	        	success: function(data){
				    var buildingId=data[0];
	        		var buildingName=data[1];
	        		for(i=0;i<buildingId.length;i++){
	        			if(nature=="1")
	        				$("#jzmc_jz").append("<option value='"+buildingId[i]+"'>"+buildingName[i]+"</option>");
	        			if(nature=="2")
	        				$("#jzmc_gg").append("<option value='"+buildingId[i]+"'>"+buildingName[i]+"</option>");
	        		}
	        	},
	        	error: function(XMLResponse){
	        		alert("qError!");
	        	}	
	   		});
		}
		
		function save(){
			var jzmc = document.getElementById('jzmc').value;
			var jzdz = document.getElementById('jzdz').value;
			var jzlx = document.getElementById('jzlx').value;
			if(jzmc == ""){
				alert("请输入建筑名称！");
				return;
			}
			if(jzdz == ""){
				alert("请输入建筑地址！");
				return;
			}
			if(jzlx == ""){
				alert("请选择建筑类型！");
				return;
			}
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/saveData",
	       		data: "jzmc="+jzmc+"&jzdz="+jzdz+"&jzlx="+jzlx,
	       		dataType:"json",
	        	success: function(data){
	        		if(data[0] == "0"){
	        			alert("建筑数据保存失败！");
	        		}else if(data[0] == "1"){
	        			alert("建筑数据保存成功！");
	        		}
	        		document.getElementById('jzmc').value = "";
	        		document.getElementById('jzdz').value = "";
	        		document.getElementById("jzlx").options[0].selected = true;
	        	},
	        	error: function(XMLResponse){
	        		alert("qError!");
	        	}	
	   	    });
		}
		
		var tabs = document.getElementsByClassName('tab-head')[0].getElementsByTagName('h2');
		var contents = document.getElementsByClassName('tab-content')[0].getElementsByTagName('div');

        (function changeTab(tab) {
        	for(var i = 0, len = tabs.length; i < len; i++) {
            	tabs[i].onmouseover = showTab;
            }
        })();

        function showTab() {
        	for(var i = 0, len = tabs.length; i < len; i++) {
            	if(tabs[i] === this) {
                	tabs[i].className = 'selected';
                    contents[i].className = 'show';
                } else {
                	tabs[i].className = '';
                    contents[i].className = '';
                }
            }
        }
	</script>
</head>
<body onload="getBuilding('1');getBuilding('2');">
	<div class="row" style="border:0px solid #F00;">
        <div class="col-md-12">
            <h1 class="page-head-line">室外环境</h1>
            <!-- <h1 class="page-subhead-line"></h1> -->      
        </div>     
    </div>
	<div class="tabs" style="border:0px solid #F60;margin:5px 0px; width:100%; height:100%;background: #FFF;">
			        
        <input type="radio" id="tab-one" name="tabbb" checked data-tabname="tab1" class="tab-radio">
        <label for="tab-one" class="tab-label">居住建筑</label>

        <input type="radio" id="tab-two" name="tabbb" data-tabname="tab2" class="tab-radio">
        <label for="tab-two" class="tab-label">公共建筑</label>
        
        <div class="panels" style="border:0px solid #F60;width:100%; height:100%;background: #FFF;">
            <div data-tabname="tab1" class="panel-item" style="border:0px solid #F60;margin:0px 2px;background: #FFF;">
				<div style="border:0px solid #F00;">
			    	<table>
			    		<tr>
			    			<td>
			    				<h5><b>建筑名称：</b></h5>
			    			</td>
			    			<td>
			    				<select id="jzmc_jz" onchange="jzmc=this.value">
					 				<option value=""></option>
					 		    </select>
			    			</td>
			    		</tr>
			    	</table>
			    </div>
				<table border="0" class="table table-striped table-bordered table-hover" style="width:100%;height:100%; margin:0px 0px;background: #FFF;" >
					<tr style="height:2px">
		             	<td colspan="2" align="center">
		             		<b>节约集约利用土地</b>
		             	</td>
		             </tr>
		             <tr style="height:2px">
		             	<td>
		             		居住建筑人均居住用地指标A
		             	</td>
		             	<td>
		             		用地指标&nbsp;&nbsp;<input type="text" id="A" value="" style="width:5%"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             		楼层情况&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="radio" name="radio_A" value="1">3层以下</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="radio" name="radio_A" value="2">4~6层</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="radio" name="radio_A" value="3">7~12层</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="radio" name="radio_A" value="4">13~18层</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="radio" name="radio_A" value="5">19层以上</input>
		             	</td>
		             </tr>
		             <tr style="height:2px">
		             	<td colspan="2" align="center">
		             		<B>场地内合理设置绿化用地</B>
		             	</td>
		             </tr>
		             <tr style="height:2px">
		             	<td>
		             		住区绿地率
		             	</td>
		             	<td>
		             		<input type="checkbox" id="checkBox_xqldl" onclick="checkClickZqldl(this);">新区建设达到30%</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="checkbox" id="checkBox_jqldl" onclick="checkClickZqldl(this);">旧区改建达到25%</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="checkbox" id="checkBox_ldlAllNo" onclick="checkAllNo();">都未达标</input>
		             	</td>
		             </tr>
		             <tr style="height:2px">
		             	<td rowspan="2" style="vertical-align: middle">
		             		住区人均公共绿地面积Ag
		             	</td>
		             	<td>
		             		<input type="checkBox" id="checkBox_xqjs" onclick="checkClickAg(this);">新区建设&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="radio" name="radio_Ag_x" value="1">1.0㎡≤ Ag <1.3㎡</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="radio" name="radio_Ag_x" value="2">1.3㎡≤ Ag <1.5㎡</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="radio" name="radio_Ag_x" value="3">Ag≥1.5㎡</input>
		             	</td>
		             </tr>
		             <tr style="height:2px">
		             	<td>
		             		<input type="checkBox" id="checkBox_jqgj" onclick="checkClickAg(this);">旧区改建&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="radio" name="radio_Ag_j" value="1">0.7㎡≤ Ag <0.9㎡</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="radio" name="radio_Ag_j" value="2">0.9㎡≤ Ag <1.0㎡</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="radio" name="radio_Ag_j" value="3">Ag≥1.0㎡</input>
		             	</td>
		             </tr>
		             <tr>
		             	<td colspan="2"  align="center">
		             		<b>合理开发利用地下空间</b>
		             	</td>
		             </tr>
		             <tr style="height:2px">
		             	<td>
		             		地下建筑面积与地上建筑面积的比率Rr
		             	</td>
		             	<td>
		             		<input type="radio" name="radio_Rr" value="1">5%≤ Rr <20%</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="radio" name="radio_Rr" value="2">20%≤ Rr <35%</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="radio" name="radio_Rr" value="3">Rr≥35%</input>
		             	</td>
		             </tr>
				</table>
				<div style="border:0px solid #F90;height:30px;float:right;">
			    	<input type="button" style="width:65px;height:25px;" onclick="saveData_jz();" value="保存"></input>
			    </div>
            </div>
            <div data-tabname="tab2" class="panel-item hidden" style="padding:0px 0px;background: #FFF;">
            	<div style="border:0px solid #F00;">
			    	<table>
			    		<tr>
			    			<td>
			    				<h5><b>建筑名称：</b></h5>
			    			</td>
			    			<td>
			    				<select id="jzmc_gg" onchange="jzmc=this.value">
					 				<option value=""></option>
					 		    </select>
			    			</td>
			    		</tr>
			    	</table>
			    </div>
            	<table border="0" class="table table-bordered" style="width:100%;height:100%; background: #FFF;" >
					<tr style="height:2px">
		             	<td colspan="2" align="center">
		             		<b>节约集约利用土地</b>
		             	</td>
		             </tr>
		             <tr style="height:2px">
		             	<td>
		             		公共建筑容积率R
		             	</td>
		             	<td>
		             		<input type="radio" name="radio_R" value="1">0.5≤ R <0.8</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="radio" name="radio_R" value="2">0.8≤ R <1.5</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="radio" name="radio_R" value="3">1.5≤ R <3.5</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="radio" name="radio_R" value="4">R≥3.5</input>
		             	</td>
		             </tr>
		             <tr style="height:2px">
		             	<td colspan="2" align="center">
		             		<B>场地内合理设置绿化用地</B>
		             	</td>
		             </tr>
		             <tr style="height:2px">
		             	<td>
		             		绿地向社会公众开放情况
		             	</td>
		             	<td>
		             		<input type="radio" name="radio_kfqk" value="1">开放</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="radio" name="radio_kfqk" value="2">不开放</input>
		             	</td>
		             </tr>
		             <tr style="height:2px">
		             	<td>
		             		公共建筑绿地率Rg
		             	</td>
		             	<td>
		             		<input type="radio" name="radio_Rg" value="1">30%≤ Rg <35%</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="radio" name="radio_Rg" value="2">35%≤ Rg <40%</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="radio" name="radio_Rg" value="3">Rg≥40%</input>
		             	</td>
		             </tr>
		             <tr style="height:2px">
		             	<td colspan="2" align="center">
		             		<b>合理开发利用地下空间</b>
		             	</td>
		             </tr>
		             <tr style="height:2px">
		             	<td style="width:35%">
		             		地下建筑面积与总用地面积之比Rp1，地下一层建筑面积与总用地面积的比率Rp2
		             	</td>
		             	<td>
		             		<input type="radio" name="radio_Rp1" value="1">Rp1 ≥0.5</input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="radio" name="radio_Rp1" value="2">Rp1 ≥0.7且Rp2 <70%</input>
		             	</td>
		             </tr>
				</table>
				<div style="border:0px solid #F90;height:30px;float:right;">
			    	<input type="button" style="width:65px;height:25px;" onclick="saveData_gg();" value="保存"></input>
			    </div>
            </div>
        </div>
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