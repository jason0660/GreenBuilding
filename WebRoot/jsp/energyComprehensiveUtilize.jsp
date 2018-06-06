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
		
		function checkClickKzsny(obj){
			document.getElementById("checkbox_rhw").checked=false;
			document.getElementById("checkbox_rch").checked=false;
			document.getElementById("checkbox_re").checked=false;
			obj.checked=true;
			document.getElementById("checkbox_rhw1").checked=false;
			document.getElementById("checkbox_rhw2").checked=false;
			document.getElementById("checkbox_rhw3").checked=false;
			document.getElementById("checkbox_rhw4").checked=false;
			document.getElementById("checkbox_rhw5").checked=false;
			document.getElementById("checkbox_rhw6").checked=false;
			document.getElementById("checkbox_rhw7").checked=false;
			document.getElementById("checkbox_rhw8").checked=false;
			document.getElementById("checkbox_rhw9").checked=false;
			
			document.getElementById("checkbox_rch1").checked=false;
			document.getElementById("checkbox_rch2").checked=false;
			document.getElementById("checkbox_rch3").checked=false;
			document.getElementById("checkbox_rch4").checked=false;
			document.getElementById("checkbox_rch5").checked=false;
			document.getElementById("checkbox_rch6").checked=false;
			document.getElementById("checkbox_rch7").checked=false;
			
			document.getElementById("checkbox_re1").checked=false;
			document.getElementById("checkbox_re2").checked=false;
			document.getElementById("checkbox_re3").checked=false;
			document.getElementById("checkbox_re4").checked=false;
			document.getElementById("checkbox_re5").checked=false;
			document.getElementById("checkbox_re6").checked=false;
			document.getElementById("checkbox_re7").checked=false;
		}
		
		function checkClickRhw(obj){
			if(document.getElementById("checkbox_rhw").checked==true){
				document.getElementById("checkbox_rhw1").checked=false;
				document.getElementById("checkbox_rhw2").checked=false;
				document.getElementById("checkbox_rhw3").checked=false;
				document.getElementById("checkbox_rhw4").checked=false;
				document.getElementById("checkbox_rhw5").checked=false;
				document.getElementById("checkbox_rhw6").checked=false;
				document.getElementById("checkbox_rhw7").checked=false;
				document.getElementById("checkbox_rhw8").checked=false;
				document.getElementById("checkbox_rhw9").checked=false;
				obj.checked=true;
			}
			else{
				alert("请先勾选‘由可再生能源提供的生活热水比例Rhw项’");
				document.getElementById("checkbox_rhw1").checked=false;
				document.getElementById("checkbox_rhw2").checked=false;
				document.getElementById("checkbox_rhw3").checked=false;
				document.getElementById("checkbox_rhw4").checked=false;
				document.getElementById("checkbox_rhw5").checked=false;
				document.getElementById("checkbox_rhw6").checked=false;
				document.getElementById("checkbox_rhw7").checked=false;
				document.getElementById("checkbox_rhw8").checked=false;
				document.getElementById("checkbox_rhw9").checked=false;
			}
		}
		
		function checkClickRch(obj){
			if(document.getElementById("checkbox_rch").checked==true){
				document.getElementById("checkbox_rch1").checked=false;
				document.getElementById("checkbox_rch2").checked=false;
				document.getElementById("checkbox_rch3").checked=false;
				document.getElementById("checkbox_rch4").checked=false;
				document.getElementById("checkbox_rch5").checked=false;
				document.getElementById("checkbox_rch6").checked=false;
				document.getElementById("checkbox_rch7").checked=false;
				obj.checked=true;
			}
			else{
				alert("请先勾选‘由可再生能源提供的空调用冷量和热量比例Rch项’");
				document.getElementById("checkbox_rch1").checked=false;
				document.getElementById("checkbox_rch2").checked=false;
				document.getElementById("checkbox_rch3").checked=false;
				document.getElementById("checkbox_rch4").checked=false;
				document.getElementById("checkbox_rch5").checked=false;
				document.getElementById("checkbox_rch6").checked=false;
				document.getElementById("checkbox_rch7").checked=false;
			}
		}
		
		function checkClickRe(obj){
			if(document.getElementById("checkbox_re").checked==true){
				document.getElementById("checkbox_re1").checked=false;
				document.getElementById("checkbox_re2").checked=false;
				document.getElementById("checkbox_re3").checked=false;
				document.getElementById("checkbox_re4").checked=false;
				document.getElementById("checkbox_re5").checked=false;
				document.getElementById("checkbox_re6").checked=false;
				document.getElementById("checkbox_re7").checked=false;
				obj.checked=true;
			}
			else{
				alert("请先勾选‘由可再生能源提供的电量比例Re’");
				document.getElementById("checkbox_re1").checked=false;
				document.getElementById("checkbox_re2").checked=false;
				document.getElementById("checkbox_re3").checked=false;
				document.getElementById("checkbox_re4").checked=false;
				document.getElementById("checkbox_re5").checked=false;
				document.getElementById("checkbox_re6").checked=false;
				document.getElementById("checkbox_re7").checked=false;
			}
		}
		
		function saveData(){
			jzid = document.getElementById('jzmc').value;
			var pfnldf=0,xlxrxtdf=0,lyyrfrsjdf=0,kzsnydf=0;
			var jzywhjgdf=0;
			var gntfyktdf=0;
			var zmydqdf=0;
			var nlzhlydf=0; 
			if(jzid == ""){
				alert("请选择建筑名称！");
				return;
			}
			
			var radio_pfnl=document.getElementsByName("radio_pfnl");
			for(var i=0;i<radio_pfnl.length;i++){
				if(radio_pfnl[i].checked==true){
					switch(radio_pfnl[i].value)
					{
					case "1":
						pfnldf=3;
						break;
					case "2":
						pfnldf=0;
						break;
					default:
						pfnldf=0;
						break;
					}
				}
			}
			
			var radio_xlxrxt=document.getElementsByName("radio_xlxrxt");
			for(var i=0;i<radio_xlxrxt.length;i++){
				if(radio_xlxrxt[i].checked==true){
					switch(radio_xlxrxt[i].value)
					{
					case "1":
						xlxrxtdf=3;
						break;
					case "2":
						xlxrxtdf=0;
						break;
					default:
						xlxrxtdf=0;
						break;
					}
				}
			}
			
			var radio_lyyrfrsj=document.getElementsByName("radio_lyyrfrsj");
			for(var i=0;i<radio_lyyrfrsj.length;i++){
				if(radio_lyyrfrsj[i].checked==true){
					switch(radio_lyyrfrsj[i].value)
					{
					case "1":
						lyyrfrsjdf=4;
						break;
					case "2":
						lyyrfrsjdf=0;
						break;
					default:
						lyyrfrsjdf=0;
						break;
					}
				}
			}
			
			if(document.getElementById("checkbox_rhw1").checked)
			    kzsnydf=2;
			if(document.getElementById("checkbox_rhw2").checked)
			    kzsnydf=3;
			if(document.getElementById("checkbox_rhw3").checked)
			    kzsnydf=4;
			if(document.getElementById("checkbox_rhw4").checked)
			    kzsnydf=5;
			if(document.getElementById("checkbox_rhw5").checked)
			    kzsnydf=6;
			if(document.getElementById("checkbox_rhw6").checked)
			    kzsnydf=7;
			if(document.getElementById("checkbox_rhw7").checked)
			    kzsnydf=8;
			if(document.getElementById("checkbox_rhw8").checked)
			    kzsnydf=9;
			if(document.getElementById("checkbox_rhw9").checked)
			    kzsnydf=10;
			    
			if(document.getElementById("checkbox_rch1").checked)
			    kzsnydf=4;
			if(document.getElementById("checkbox_rch2").checked)
			    kzsnydf=5;
			if(document.getElementById("checkbox_rch3").checked)
			    kzsnydf=6;
			if(document.getElementById("checkbox_rch4").checked)
			    kzsnydf=7;
			if(document.getElementById("checkbox_rch5").checked)
			    kzsnydf=8;
			if(document.getElementById("checkbox_rch6").checked)
			    kzsnydf=9;
			if(document.getElementById("checkbox_rch7").checked)
			    kzsnydf=10;
			    
			if(document.getElementById("checkbox_re1").checked)
			    kzsnydf=4;
			if(document.getElementById("checkbox_re2").checked)
			    kzsnydf=5;
			if(document.getElementById("checkbox_re3").checked)
			    kzsnydf=6;
			if(document.getElementById("checkbox_re4").checked)
			    kzsnydf=7;
			if(document.getElementById("checkbox_re5").checked)
			    kzsnydf=8;
			if(document.getElementById("checkbox_re6").checked)
			    kzsnydf=9;
			if(document.getElementById("checkbox_re7").checked)
			    kzsnydf=10;
			    
			nlzhlydf = pfnldf + xlxrxtdf + lyyrfrsjdf + kzsnydf;
			
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/saveQ2Data",
	       		data: "jzid="+jzid+"&jzywhjgdf="+jzywhjgdf+"&gntfyktdf="+gntfyktdf+"&zmydqdf="+zmydqdf+"&nlzhlydf="+nlzhlydf,
	       		dataType:"json",
	        	success: function(data){
	        		if(data[0] == "0"){
	        			alert("能量综合利用得分保存失败！");
	        		}else if(data[0] == "1"){
	        			alert("能量综合利用得分保存成功！");
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
            <h1 class="page-head-line">能量综合利用</h1>
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
           		<b>排风能量回收系统设计合理并运行可靠</b>
           	</td>		             
           	<td colspan="2" align="left">
          		<input type="radio" name="radio_pfnl" value="1">满足</input><br/>
           		<input type="radio" name="radio_pfnl" value="2">不满足</input>
           	</td>
        </tr>
        <tr style="height:5px">
           	<td style="vertical-align: middle;width:25%;">
           		<b>合理采用蓄冷蓄热系统</b>
           	</td>		             
           	<td colspan="2" align="left">
          		<input type="radio" name="radio_xlxrxt" value="1">满足</input><br/>
           		<input type="radio" name="radio_xlxrxt" value="2">不满足</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:25%;">
           		<b>合理利用余热废热解决建筑的蒸汽、供暖或生活热水需求</b>
           	</td>
           	<td colspan="2" align="left">
           		<input type="radio" name="radio_lyyrfrsj" value="1">满足</input><br/>
           		<input type="radio" name="radio_lyyrfrsj" value="2">不满足</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td rowspan="3" style="vertical-align: middle;width:25%;">
           		<b>根据当地气候和自然资源条件，合理利用可再生能源</b>
           	</td>
           	<td style="vertical-align: middle;width:22%;">
           		<input type="checkbox" id="checkbox_rhw" onclick="checkClickKzsny(this);">由可再生能源提供的生活热水比例Rhw</input>
           	</td>
           	<td align="left">
          		<input type="checkbox" id="checkbox_rhw1" onclick="checkClickRhw(this);">20%≤Rhw<30%</input><br/>
          		<input type="checkbox" id="checkbox_rhw2" onclick="checkClickRhw(this);">30%≤Rhw<40%</input><br/>
          		<input type="checkbox" id="checkbox_rhw3" onclick="checkClickRhw(this);">40%≤Rhw<50%</input><br/>
          		<input type="checkbox" id="checkbox_rhw4" onclick="checkClickRhw(this);">50%≤Rhw<60%</input><br/>
          		<input type="checkbox" id="checkbox_rhw5" onclick="checkClickRhw(this);">60%≤Rhw<70%</input><br/>
          		<input type="checkbox" id="checkbox_rhw6" onclick="checkClickRhw(this);">70%≤Rhw<80%</input><br/>
          		<input type="checkbox" id="checkbox_rhw7" onclick="checkClickRhw(this);">80%≤Rhw<90%</input><br/>
          		<input type="checkbox" id="checkbox_rhw8" onclick="checkClickRhw(this);">90%≤Rhw<100%</input><br/>
           		<input type="checkbox" id="checkbox_rhw9" onclick="checkClickRhw(this);">Rhw=100%</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:22%;">
           		<input type="checkbox" id="checkbox_rch" onclick="checkClickKzsny(this);">由可再生能源提供的空调用冷量和热量比例Rch</input>
           	</td>
           	<td align="left">
          		<input type="checkbox" id="checkbox_rch1" onclick="checkClickRch(this);">20%≤Rch<30%</input><br/>
          		<input type="checkbox" id="checkbox_rch2" onclick="checkClickRch(this);">30%≤Rch<40%</input><br/>
          		<input type="checkbox" id="checkbox_rch3" onclick="checkClickRch(this);">40%≤Rch<50%</input><br/>
          		<input type="checkbox" id="checkbox_rch4" onclick="checkClickRch(this);">50%≤Rch<60%</input><br/>
          		<input type="checkbox" id="checkbox_rch5" onclick="checkClickRch(this);">60%≤Rch<70%</input><br/>
          		<input type="checkbox" id="checkbox_rch6" onclick="checkClickRch(this);">70%≤Rch<80%</input><br/>
           		<input type="checkbox" id="checkbox_rch7" onclick="checkClickRch(this);">Rch≥80%</input>
           	</td>
        </tr>
        <tr style="height:2px">
           	<td style="vertical-align: middle;width:22%;">
           		<input type="checkbox" id="checkbox_re" onclick="checkClickKzsny(this);">由可再生能源提供的电量比例Re</input>
           	</td>
           	<td align="left">
          		<input type="checkbox" id="checkbox_re1" onclick="checkClickRe(this);">1.0%≤Re<1.5%</input><br/>
          		<input type="checkbox" id="checkbox_re2" onclick="checkClickRe(this);">1.5%≤Re<2.0%</input><br/>
          		<input type="checkbox" id="checkbox_re3" onclick="checkClickRe(this);">2.0%≤Re<2.5%</input><br/>
          		<input type="checkbox" id="checkbox_re4" onclick="checkClickRe(this);">2.5%≤Re<3.0%</input><br/>
          		<input type="checkbox" id="checkbox_re5" onclick="checkClickRe(this);">3.0%≤Re<3.5%</input><br/>
          		<input type="checkbox" id="checkbox_re6" onclick="checkClickRe(this);">3.5%≤Re<4.0%</input><br/>
           		<input type="checkbox" id="checkbox_re7" onclick="checkClickRe(this);">Re≥4.0%</input>
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