<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
		var buildingA,buildingRr,buildingRp1,buildingRp2,buildingAg;
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
	        			$("#jzmc_dt").append("<option value='"+buildingId[i]+"'>"+buildingName[i]+"</option>");
	        		}
	        	},
	        	error: function(XMLResponse){
	        		alert("qError!");
	        	}	
	   		});
		}
		
		function getLandUtilizeData_jz(){
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/getLandUtilizeData",
	       		data: "jzid="+jzid,
	       		dataType:"json",
	        	success: function(data){
				    var buildingL=data[0];
	        		var buildingR=data[1];
	        		var buildingH=data[2];
	        		var buildingAr=data[3];
	        		var buildingBr=data[4];
	        		var buildingB1r=data[5];
	        		var buildingAllr=data[6];
	        		var buildingAllgr=data[7];

        			if(buildingR!="" && buildingH!=""){
        				buildingA = Math.round(buildingR/(buildingH*3.2));
        				document.getElementById('A').value=buildingA;
        			}
        			else{
        				document.getElementById('A').value="";
        			}
        			if(buildingL!=""){
        				var radio_A=document.getElementsByName("radio_A");
        				if(buildingL<=3){
        					radio_A[0].checked=true;
        				}
        				if(4<=buildingL && buildingL<=6){
        					radio_A[1].checked=true;
        				}
        				if(7<=buildingL && buildingL<=12){
        					radio_A[2].checked=true;
        				}
        				if(13<=buildingL && buildingL<=18){
        					radio_A[3].checked=true;
        				}
        				if(19<=buildingL){
        					radio_A[4].checked=true;
        				}
        			}
        			if(buildingAr!="" && buildingBr!=""){
        				buildingRr = (buildingBr/buildingAr).toFixed(2);
        				var radio_Rr = document.getElementsByName("radio_Rr");
        				if(buildingRr>=0.05 && buildingRr<0.2){
        					radio_Rr[0].checked=true;
        				}
        				if(buildingRr>=0.2 && buildingRr<0.35){
        					radio_Rr[1].checked=true;
        				}
        				if(buildingRr>=0.35){
        					radio_Rr[2].checked=true;
        				}
        			}
        			if(buildingAllgr!="" && buildingH!=""){
        				buildingAg = (buildingAllgr/buildingH*3.2).toFixed(2);
        			}
	        	},
	        	error: function(XMLResponse){
	        		alert("qError!");
	        	}	
	   		});
		}
		
		function getLandUtilizeData_gg(){
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/getLandUtilizeData",
	       		data: "jzid="+jzid,
	       		dataType:"json",
	        	success: function(data){
				    var buildingL=data[0];
	        		var buildingR=data[1];
	        		var buildingH=data[2];
	        		var buildingAr=data[3];
	        		var buildingBr=data[4];
	        		var buildingB1r=data[5];
	        		var buildingAllr=data[6];
	        		var buildingAllgr=data[7];

        			if(buildingBr!="" && buildingAllr!=""){
        				buildingRp1 = (buildingBr/buildingAllr).toFixed(2);
        			}
        			if(buildingB1r!="" && buildingAllr!=""){
        				buildingRp2 = (buildingB1r/buildingAllr).toFixed(2);
        			}
        			var radio_Rp1 = document.getElementsByName("radio_Rp1");
       				if(buildingRp1>=0.5){
       					radio_Rp1[0].checked=true;
       				}
       				if(buildingRp1>=0.7 && buildingRp2<0.7){
       					radio_Rp1[1].checked=true;
       				}
	        	},
	        	error: function(XMLResponse){
	        		alert("qError!");
	        	}	
	   		});
		}
		
		function getLandUtilizeData_dt(){
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/getLandUtilizeData",
	       		data: "jzid="+jzid,
	       		dataType:"json",
	        	success: function(data){
				    var buildingL=data[0];
	        		var buildingR=data[1];
	        		var buildingH=data[2];
	        		var buildingAr=data[3];
	        		var buildingBr=data[4];
	        		var buildingB1r=data[5];
	        		var buildingAllr=data[6];
	        		var buildingAllgr=data[7];

        			if(buildingR!="" && buildingH!=""){
        				buildingA = Math.round(buildingR/(buildingH*3.2));
        				document.getElementById('A_dt').value=buildingA;
        			}
        			else{
        				document.getElementById('A_dt').value="";
        			}
        			if(buildingL!=""){
        				var radio_A_dt=document.getElementsByName("radio_A_dt");
        				if(buildingL<=3){
        					radio_A_dt[0].checked=true;
        				}
        				if(4<=buildingL && buildingL<=6){
        					radio_A_dt[1].checked=true;
        				}
        				if(7<=buildingL && buildingL<=12){
        					radio_A_dt[2].checked=true;
        				}
        				if(13<=buildingL && buildingL<=18){
        					radio_A_dt[3].checked=true;
        				}
        				if(19<=buildingL){
        					radio_A_dt[4].checked=true;
        				}
        			}
        			if(buildingAllgr!="" && buildingH!=""){
        				buildingAg = (buildingAllgr/buildingH*3.2).toFixed(2);
        			}
        			if(buildingAr!="" && buildingBr!=""){
        				buildingRr = (buildingBr/buildingAr).toFixed(2);
        				var radio_Rr_dt = document.getElementsByName("radio_Rr_dt");
        				if(buildingRr>=0.05 && buildingRr<0.2){
        					radio_Rr_dt[0].checked=true;
        				}
        				if(buildingRr>=0.2 && buildingRr<0.35){
        					radio_Rr_dt[1].checked=true;
        				}
        				if(buildingRr>=0.35){
        					radio_Rr_dt[2].checked=true;
        				}
        			}
        			if(buildingBr!="" && buildingAllr!=""){
        				buildingRp1 = (buildingBr/buildingAllr).toFixed(2);
        			}
        			if(buildingB1r!="" && buildingAllr!=""){
        				buildingRp2 = (buildingB1r/buildingAllr).toFixed(2);
        			}
        			var radio_Rp1_dt = document.getElementsByName("radio_Rp1_dt");
       				if(buildingRp1>=0.5){
       					radio_Rp1_dt[0].checked=true;
       				}
       				if(buildingRp1>=0.7 && buildingRp2<0.7){
       					radio_Rp1_dt[1].checked=true;
       				}
	        	},
	        	error: function(XMLResponse){
	        		alert("qError!");
	        	}	
	   		});
		}
		
		$('.radio').click(function(){
		    if( $(this).val()=='1'){
		        $(this).attr('checked',false);
		        $(this).val('0');
		    }else{
		        $(this).val('1');
		    }
		    //其他兄弟节点值为0
		    $(this).siblings().val('0');   
		})
		
		function checkClickAg(obj){
			var jzmc_jz = document.getElementById("jzmc_jz").value;
			if(jzmc_jz==""){
				alert("请选择建筑名称!");
				return;
			}
			document.getElementById("checkbox_jqgj").checked=false;
			document.getElementById("checkbox_xqjs").checked=false;
			obj.checked=true;
			if(obj.id=="checkbox_xqjs"){
				var radio_Ag_x=document.getElementsByName("radio_Ag_x");
    			if(buildingAg>=1.0 && buildingAg<1.3){
    				radio_Ag_x[0].checked=true;
    			}
    			if(buildingAg>=1.3 && buildingAg<1.5){
    				radio_Ag_x[1].checked=true;
    			}
    			if(buildingAg>=1.5){
    				radio_Ag_x[2].checked=true;
    			}
    			
    			var radio_Ag_j=document.getElementsByName("radio_Ag_j");
				for(var i=0;i<radio_Ag_j.length;i++){
					radio_Ag_j[i].checked=false;
				}
			}
			
			if(obj.id=="checkbox_jqgj"){
				var radio_Ag_j=document.getElementsByName("radio_Ag_j");
    			if(buildingAg>=0.7 && buildingAg<0.9){
    				radio_Ag_j[0].checked=true;
    			}
    			if(buildingAg>=0.9 && buildingAg<1.0){
    				radio_Ag_j[1].checked=true;
    			}
    			if(buildingAg>=1.0){
    				radio_Ag_j[2].checked=true;
    			}
    			
    			var radio_Ag_x=document.getElementsByName("radio_Ag_x");
				for(var i=0;i<radio_Ag_x.length;i++){
					radio_Ag_x[i].checked=false;
				}
			}
		}
		
		function checkClickAg_dt(obj){
			var jzmc_dt = document.getElementById("jzmc_dt").value;
			if(jzmc_dt==""){
				alert("请选择建筑名称!");
				return;
			}
			document.getElementById("checkbox_jqgj_dt").checked=false;
			document.getElementById("checkbox_xqjs_dt").checked=false;
			obj.checked=true;
			if(obj.id=="checkbox_xqjs_dt"){
				var radio_Ag_x_dt=document.getElementsByName("radio_Ag_x_dt");
    			if(buildingAg>=1.0 && buildingAg<1.3){
    				radio_Ag_x_dt[0].checked=true;
    			}
    			if(buildingAg>=1.3 && buildingAg<1.5){
    				radio_Ag_x_dt[1].checked=true;
    			}
    			if(buildingAg>=1.5){
    				radio_Ag_x_dt[2].checked=true;
    			}
    			
    			var radio_Ag_j_dt=document.getElementsByName("radio_Ag_j_dt");
				for(var i=0;i<radio_Ag_j_dt.length;i++){
					radio_Ag_j_dt[i].checked=false;
				}
			}
			
			if(obj.id=="checkbox_jqgj_dt"){
				var radio_Ag_j_dt=document.getElementsByName("radio_Ag_j_dt");
    			if(buildingAg>=0.7 && buildingAg<0.9){
    				radio_Ag_j_dt[0].checked=true;
    			}
    			if(buildingAg>=0.9 && buildingAg<1.0){
    				radio_Ag_j_dt[1].checked=true;
    			}
    			if(buildingAg>=1.0){
    				radio_Ag_j_dt[2].checked=true;
    			}
    			
    			var radio_Ag_x_dt=document.getElementsByName("radio_Ag_x_dt");
				for(var i=0;i<radio_Ag_x_dt.length;i++){
					radio_Ag_x_dt[i].checked=false;
				}
			}
		}
		
		function checkClickZqldl(obj){
			document.getElementById("checkbox_xqldl").checked=false;
			document.getElementById("checkbox_jqldl").checked=false;
			document.getElementById("checkbox_ldlAllNo").checked=false;
			obj.checked=true;
		}
		
		function checkClickZqldl_dt(obj){
			document.getElementById("checkbox_xqldl_dt").checked=false;
			document.getElementById("checkbox_jqldl_dt").checked=false;
			document.getElementById("checkbox_ldlAllNo_dt").checked=false;
			obj.checked=true;
		}
		
		function checkAllNo(){
			if(document.getElementById("checkbox_ldlAllNo").checked==true)
			{
				document.getElementById("checkbox_xqldl").checked=false;
				document.getElementById("checkbox_jqldl").checked=false;
			}
		}
		
		function checkAllNo_dt(){
			if(document.getElementById("checkbox_ldlAllNo_dt").checked==true)
			{
				document.getElementById("checkbox_xqldl_dt").checked=false;
				document.getElementById("checkbox_jqldl_dt").checked=false;
			}
		}
		
		function saveData_jz(){
			var rjjzydzbdf=0,zqldldf=0,zqrjggldmjdf=0,dxjzmjydsjzmjbldf=0;
			var tdlydf=0;
			var swhjdf=0;
			var jtssyggfwdf=0;
			var cdsjycdstdf=0;
			jzid = document.getElementById('jzmc_jz').value;
			if(jzid == ""){
				alert("请选择建筑名称！");
				return;
			}
			var A=document.getElementById("A").value;
			if(A=="")
			{
				alert("请输入用地指标。");
				return;
			}
			
			var radio_A=document.getElementsByName("radio_A");
			for(var i=0;i<radio_A.length;i++){
				if(radio_A[i].checked==true){
					var checkedA=true;
				}
			}
			if(!checkedA)
			{
				alert("请选择楼层情况。");
				return;
			}
			else
			{
				for(var i=0;i<radio_A.length;i++){
					if(radio_A[i].checked==true){
						switch(radio_A[i].value)
						{
						case "1":
							if(A>35 && A<=41)
								rjjzydzbdf=15;
							if(A<=35)
								rjjzydzbdf=19;
							break;
						case "2":
							if(A>23 && A<=26)
								rjjzydzbdf=15;
							if(A<=23)
								rjjzydzbdf=19;
							break;
						case "3":
							if(A>22 && A<=24)
								rjjzydzbdf=15;
							if(A<=22)
								rjjzydzbdf=19;
							break;
						case "4":
							if(A>20 && A<=22)
								rjjzydzbdf=15;
							if(A<=20)
								rjjzydzbdf=19;
							break;
						case "5":
							if(A>11 && A<=13)
								rjjzydzbdf=15;
							if(A<=11)
								rjjzydzbdf=19;
							break;
						default:
							rjjzydzbdf=0;
							break;
						}
					}
				}
			}
			
			//住区绿地率
			if(!document.getElementById("checkbox_xqldl").checked && !document.getElementById("checkbox_jqldl").checked && !document.getElementById("checkbox_ldlAllNo").checked)
			{
				alert("请选择住区绿地率达标情况。");
				return;
			}
			if(document.getElementById("checkbox_xqldl").checked || document.getElementById("checkbox_jqldl").checked)
			    zqldldf=2;
			if(document.getElementById("checkbox_ldlAllNo").checked)
			    zqldldf=0;
			
			//住区人均公共绿地面积
			if(!document.getElementById("checkbox_xqjs").checked && !document.getElementById("checkbox_jqgj").checked){
				alert("请选择住区人均公共绿地面积情况。");
				return;
			}
			if(document.getElementById("checkbox_xqjs").checked){
				var radio_Ag_x=document.getElementsByName("radio_Ag_x");
				for(var i=0;i<radio_Ag_x.length;i++){
					if(radio_Ag_x[i].checked==true){
						var checkedAg_x=true;
					}
				}
				if(!checkedAg_x)
				{
					alert("请选择新区建设人均公共绿地面积情况。");
					return;
				}
				else
				{
					for(var i=0;i<radio_Ag_x.length;i++){
						if(radio_Ag_x[i].checked==true){
							switch(radio_Ag_x[i].value)
							{
							case "1":
								zqrjggldmjdf=3;
								break;
							case "2":
								zqrjggldmjdf=5;
								break;
							case "3":
								zqrjggldmjdf=7;
								break;
							default:
								zqrjggldmjdf=0;
								break;
							}
						}
					}
				}
			}
			if(document.getElementById("checkbox_jqgj").checked){
				var radio_Ag_j=document.getElementsByName("radio_Ag_j");
				for(var i=0;i<radio_Ag_j.length;i++){
					if(radio_Ag_j[i].checked==true){
						var checkedAg_j=true;
					}
				}
				if(!checkedAg_j)
				{
					alert("请选择旧区改建人均公共绿地面积情况。");
					return;
				}
				else
				{
					for(var i=0;i<radio_Ag_j.length;i++){
						if(radio_Ag_j[i].checked==true){
							switch(radio_Ag_j[i].value)
							{
							case "1":
								zqrjggldmjdf=3;
								break;
							case "2":
								zqrjggldmjdf=5;
								break;
							case "3":
								zqrjggldmjdf=7;
								break;
							default:
								zqrjggldmjdf=0;
								break;
							}
						}
					}
				}
			}
			
			//地下建筑面积与地上建筑面积的比率Rr
			var radio_Rr=document.getElementsByName("radio_Rr");
			for(var i=0;i<radio_Rr.length;i++){
				if(radio_Rr[i].checked==true){
					var checkedRr=true;
				}
			}
			if(!checkedRr)
			{
				alert("请选择地下建筑面积与地上建筑面积的比率情况。");
				return;
			}
			else
			{
				for(var i=0;i<radio_Rr.length;i++){
					if(radio_Rr[i].checked==true){
						switch(radio_Rr[i].value)
						{
						case "1":
							dxjzmjydsjzmjbldf=3;
							break;
						case "2":
							dxjzmjydsjzmjbldf=5;
							break;
						case "3":
							dxjzmjydsjzmjbldf=7;
							break;
						default:
							dxjzmjydsjzmjbldf=0;
							break;
						}
					}
				}
			}
			
			tdlydf = rjjzydzbdf + zqldldf + zqrjggldmjdf + dxjzmjydsjzmjbldf;
			
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/saveQ1Data",
	       		data: "jzid="+jzid+"&tdlydf="+tdlydf+"&swhjdf="+swhjdf+"&jtssyggfwdf="+jtssyggfwdf+"&cdsjycdstdf="+cdsjycdstdf,
	       		dataType:"json",
	        	success: function(data){
	        		if(data[0] == "0"){
	        			alert("土地利用得分保存失败！");
	        		}else if(data[0] == "1"){
	        			alert("土地利用得分保存成功！");
	        		}
	        	},
	        	error: function(XMLResponse){
	        		alert("qError!");
	        	}	
	   	    });	
		}
		
		function saveData_gg(){
			var ggjzrjldf=0,ldkfqkdf=0,ggjzldldf=0,hlkflydxkjdf=0;
			var tdlydf=0;
			var swhjdf=0;
			var jtssyggfwdf=0;
			var cdsjycdstdf=0;
			jzid = document.getElementById('jzmc_gg').value;
			if(jzid == ""){
				alert("请选择建筑名称！");
				return;
			}
			var radio_R=document.getElementsByName("radio_R");
			for(var i=0;i<radio_R.length;i++){
				if(radio_R[i].checked==true){
					var checkedR=true;
				}
			}
			if(!checkedR)
			{
				alert("请选择容积率。");
				return;
			}
			else
			{
				for(var i=0;i<radio_R.length;i++){
					if(radio_R[i].checked==true){
						switch(radio_R[i].value)
						{
						case "1":
							ggjzrjldf=5;
							break;
						case "2":
							ggjzrjldf=10;
							break;
						case "3":
							ggjzrjldf=15;
							break;
						case "4":
							ggjzrjldf=19;
							break;
						default:
							ggjzrjldf=0;
							break;
						}
					}
				}
			}
			
			var radio_kfqk=document.getElementsByName("radio_kfqk");
			for(var i=0;i<radio_kfqk.length;i++){
				if(radio_kfqk[i].checked==true){
					var checkedKfqk=true;
				}
			}
			if(!checkedKfqk)
			{
				alert("请选择绿地向社会公众开放情况。");
				return;
			}
			else
			{
				for(var i=0;i<radio_kfqk.length;i++){
					if(radio_kfqk[i].checked==true){
						switch(radio_kfqk[i].value)
						{
						case "1":
							ldkfqkdf=2;
							break;
						case "2":
							ldkfqkdf=0;
							break;
						default:
							ldkfqkdf=0;
							break;
						}
					}
				}
			}

			var radio_Rg=document.getElementsByName("radio_Rg");
			for(var i=0;i<radio_Rg.length;i++){
				if(radio_Rg[i].checked==true){
					var checkedRg=true;
				}
			}
			if(!checkedRg)
			{
				alert("请选择公共建筑绿地率情况。");
				return;
			}
			else
			{
				for(var i=0;i<radio_Rg.length;i++){
					if(radio_Rg[i].checked==true){
						switch(radio_Rg[i].value)
						{
						case "1":
							ggjzldldf=2;
							break;
						case "2":
							ggjzldldf=5;
							break;
						case "3":
							ggjzldldf=7;
							break;
						default:
							ggjzldldf=0;
							break;
						}
					}
				}
			}
			
			var radio_Rp1=document.getElementsByName("radio_Rp1");
			for(var i=0;i<radio_Rp1.length;i++){
				if(radio_Rp1[i].checked==true){
					var checkedRp1=true;
				}
			}
			if(!checkedRp1)
			{
				alert("请选择开发利用地下空间情况。");
				return;
			}
			else
			{
				for(var i=0;i<radio_Rp1.length;i++){
					if(radio_Rp1[i].checked==true){
						switch(radio_Rp1[i].value)
						{
						case "1":
							hlkflydxkjdf=3;
							break;
						case "2":
							hlkflydxkjdf=6;
							break;
						default:
							hlkflydxkjdf=0;
							break;
						}
					}
				}
			}
			
			tdlydf = ggjzrjldf + ldkfqkdf + ggjzldldf + hlkflydxkjdf;
			
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/saveQ1Data",
	       		data: "jzid="+jzid+"&tdlydf="+tdlydf+"&swhjdf="+swhjdf+"&jtssyggfwdf="+jtssyggfwdf+"&cdsjycdstdf="+cdsjycdstdf,
	       		dataType:"json",
	        	success: function(data){
	        		if(data[0] == "0"){
	        			alert("土地利用得分保存失败！");
	        		}else if(data[0] == "1"){
	        			alert("土地利用得分保存成功！");
	        		}
	        	},
	        	error: function(XMLResponse){
	        		alert("qError!");
	        	}	
	   	    });
		}
		
		function saveData_dt(){
			var rjjzydzbdf=0,zqldldf=0,zqrjggldmjdf=0,dxjzmjydsjzmjbldf=0;
			var ggjzrjldf=0,ldkfqkdf=0,ggjzldldf=0,hlkflydxkjdf=0;
			var tdlydf=0,tdlydf_jz=0,tdlydf_gg=0;
			var swhjdf=0;
			var jtssyggfwdf=0;
			var cdsjycdstdf=0;
			jzid = document.getElementById('jzmc_dt').value;
			if(jzid == ""){
				alert("请选择建筑名称！");
				return;
			}
			var A=document.getElementById("A_dt").value;
			if(A=="")
			{
				alert("请输入用地指标。");
				return;
			}
			
			var radio_A=document.getElementsByName("radio_A_dt");
			for(var i=0;i<radio_A.length;i++){
				if(radio_A[i].checked==true){
					var checkedA=true;
				}
			}
			if(!checkedA)
			{
				alert("请选择楼层情况。");
				return;
			}
			else
			{
				for(var i=0;i<radio_A.length;i++){
					if(radio_A[i].checked==true){
						switch(radio_A[i].value)
						{
						case "1":
							if(A>35 && A<=41)
								rjjzydzbdf=15;
							if(A<=35)
								rjjzydzbdf=19;
							break;
						case "2":
							if(A>23 && A<=26)
								rjjzydzbdf=15;
							if(A<=23)
								rjjzydzbdf=19;
							break;
						case "3":
							if(A>22 && A<=24)
								rjjzydzbdf=15;
							if(A<=22)
								rjjzydzbdf=19;
							break;
						case "4":
							if(A>20 && A<=22)
								rjjzydzbdf=15;
							if(A<=20)
								rjjzydzbdf=19;
							break;
						case "5":
							if(A>11 && A<=13)
								rjjzydzbdf=15;
							if(A<=11)
								rjjzydzbdf=19;
							break;
						default:
							rjjzydzbdf=0;
							break;
						}
					}
				}
			}
			
			//住区绿地率
			if(!document.getElementById("checkbox_xqldl_dt").checked && !document.getElementById("checkbox_jqldl_dt").checked && !document.getElementById("checkbox_ldlAllNo_dt").checked)
			{
				alert("请选择住区绿地率达标情况。");
				return;
			}
			if(document.getElementById("checkbox_xqldl_dt").checked || document.getElementById("checkbox_jqldl_dt").checked)
			    zqldldf=2;
			if(document.getElementById("checkbox_ldlAllNo_dt").checked)
			    zqldldf=0;
			
			//住区人均公共绿地面积
			if(!document.getElementById("checkbox_xqjs_dt").checked && !document.getElementById("checkbox_jqgj_dt").checked){
				alert("请选择住区人均公共绿地面积情况。");
				return;
			}
			if(document.getElementById("checkbox_xqjs_dt").checked){
				var radio_Ag_x=document.getElementsByName("radio_Ag_x_dt");
				for(var i=0;i<radio_Ag_x.length;i++){
					if(radio_Ag_x[i].checked==true){
						var checkedAg_x=true;
					}
				}
				if(!checkedAg_x)
				{
					alert("请选择新区建设人均公共绿地面积情况。");
					return;
				}
				else
				{
					for(var i=0;i<radio_Ag_x.length;i++){
						if(radio_Ag_x[i].checked==true){
							switch(radio_Ag_x[i].value)
							{
							case "1":
								zqrjggldmjdf=3;
								break;
							case "2":
								zqrjggldmjdf=5;
								break;
							case "3":
								zqrjggldmjdf=7;
								break;
							default:
								zqrjggldmjdf=0;
								break;
							}
						}
					}
				}
			}
			if(document.getElementById("checkbox_jqgj_dt").checked){
				var radio_Ag_j=document.getElementsByName("radio_Ag_j_dt");
				for(var i=0;i<radio_Ag_j.length;i++){
					if(radio_Ag_j[i].checked==true){
						var checkedAg_j=true;
					}
				}
				if(!checkedAg_j)
				{
					alert("请选择旧区改建人均公共绿地面积情况。");
					return;
				}
				else
				{
					for(var i=0;i<radio_Ag_j.length;i++){
						if(radio_Ag_j[i].checked==true){
							switch(radio_Ag_j[i].value)
							{
							case "1":
								zqrjggldmjdf=3;
								break;
							case "2":
								zqrjggldmjdf=5;
								break;
							case "3":
								zqrjggldmjdf=7;
								break;
							default:
								zqrjggldmjdf=0;
								break;
							}
						}
					}
				}
			}
			
			//地下建筑面积与地上建筑面积的比率Rr
			var radio_Rr=document.getElementsByName("radio_Rr_dt");
			for(var i=0;i<radio_Rr.length;i++){
				if(radio_Rr[i].checked==true){
					var checkedRr=true;
				}
			}
			if(!checkedRr)
			{
				alert("请选择地下建筑面积与地上建筑面积的比率情况。");
				return;
			}
			else
			{
				for(var i=0;i<radio_Rr.length;i++){
					if(radio_Rr[i].checked==true){
						switch(radio_Rr[i].value)
						{
						case "1":
							dxjzmjydsjzmjbldf=3;
							break;
						case "2":
							dxjzmjydsjzmjbldf=5;
							break;
						case "3":
							dxjzmjydsjzmjbldf=7;
							break;
						default:
							dxjzmjydsjzmjbldf=0;
							break;
						}
					}
				}
			}
			
			tdlydf_jz = rjjzydzbdf + zqldldf + zqrjggldmjdf + dxjzmjydsjzmjbldf;//居住建筑部分得分
			
			var radio_R=document.getElementsByName("radio_R_dt");
			for(var i=0;i<radio_R.length;i++){
				if(radio_R[i].checked==true){
					var checkedR=true;
				}
			}
			if(!checkedR)
			{
				alert("请选择容积率。");
				return;
			}
			else
			{
				for(var i=0;i<radio_R.length;i++){
					if(radio_R[i].checked==true){
						switch(radio_R[i].value)
						{
						case "1":
							ggjzrjldf=5;
							break;
						case "2":
							ggjzrjldf=10;
							break;
						case "3":
							ggjzrjldf=15;
							break;
						case "4":
							ggjzrjldf=19;
							break;
						default:
							ggjzrjldf=0;
							break;
						}
					}
				}
			}
			
			var radio_kfqk=document.getElementsByName("radio_kfqk_dt");
			for(var i=0;i<radio_kfqk.length;i++){
				if(radio_kfqk[i].checked==true){
					var checkedKfqk=true;
				}
			}
			if(!checkedKfqk)
			{
				alert("请选择绿地向社会公众开放情况。");
				return;
			}
			else
			{
				for(var i=0;i<radio_kfqk.length;i++){
					if(radio_kfqk[i].checked==true){
						switch(radio_kfqk[i].value)
						{
						case "1":
							ldkfqkdf=2;
							break;
						case "2":
							ldkfqkdf=0;
							break;
						default:
							ldkfqkdf=0;
							break;
						}
					}
				}
			}

			var radio_Rg=document.getElementsByName("radio_Rg_dt");
			for(var i=0;i<radio_Rg.length;i++){
				if(radio_Rg[i].checked==true){
					var checkedRg=true;
				}
			}
			if(!checkedRg)
			{
				alert("请选择公共建筑绿地率情况。");
				return;
			}
			else
			{
				for(var i=0;i<radio_Rg.length;i++){
					if(radio_Rg[i].checked==true){
						switch(radio_Rg[i].value)
						{
						case "1":
							ggjzldldf=2;
							break;
						case "2":
							ggjzldldf=5;
							break;
						case "3":
							ggjzldldf=7;
							break;
						default:
							ggjzldldf=0;
							break;
						}
					}
				}
			}
			
			var radio_Rp1=document.getElementsByName("radio_Rp1_dt");
			for(var i=0;i<radio_Rp1.length;i++){
				if(radio_Rp1[i].checked==true){
					var checkedRp1=true;
				}
			}
			if(!checkedRp1)
			{
				alert("请选择开发利用地下空间情况。");
				return;
			}
			else
			{
				for(var i=0;i<radio_Rp1.length;i++){
					if(radio_Rp1[i].checked==true){
						switch(radio_Rp1[i].value)
						{
						case "1":
							hlkflydxkjdf=3;
							break;
						case "2":
							hlkflydxkjdf=6;
							break;
						default:
							hlkflydxkjdf=0;
							break;
						}
					}
				}
			}
			
			tdlydf_gg = ggjzrjldf + ldkfqkdf + ggjzldldf + hlkflydxkjdf;//公共建筑部分得分
			
			tdlydf = tdlydf_jz + tdlydf_gg;
			
			$.ajax({
				type: "POST",
	       		url: "${pageContext.request.contextPath}/BuildingDataAction/saveQ1Data",
	       		data: "jzid="+jzid+"&tdlydf="+tdlydf+"&swhjdf="+swhjdf+"&jtssyggfwdf="+jtssyggfwdf+"&cdsjycdstdf="+cdsjycdstdf,
	       		dataType:"json",
	        	success: function(data){
	        		if(data[0] == "0"){
	        			alert("土地利用得分保存失败！");
	        		}else if(data[0] == "1"){
	        			alert("土地利用得分保存成功！");
	        		}
	        	},
	        	error: function(XMLResponse){
	        		alert("qError!");
	        	}	
	   	    });
		}
	</script>
</head>
<body onload="getBuilding('1');getBuilding('2');getBuilding('3');" style="border:0px solid #F00;width:99%;">
	<div class="row" style="border:0px solid #F00;">
        <div class="col-md-12">
            <h1 class="page-head-line">土地利用</h1>
            <!-- <h1 class="page-subhead-line"></h1> -->         
        </div>
          
    </div>
    
    <div class="tabs" style="border:0px solid #F60;margin:5px 0px; width:100%; height:100%;background: #FFF;">
			        
        <input type="radio" id="tab-one" name="tabbb" checked data-tabname="tab1" class="tab-radio">
        <label for="tab-one" class="tab-label" style="border:1px solid #4169E1;">居住建筑</label>

        <input type="radio" id="tab-two" name="tabbb" data-tabname="tab2" class="tab-radio">
        <label for="tab-two" class="tab-label" style="border:1px solid #4169E1;">公共建筑</label>
        
        <input type="radio" id="tab-three" name="tabbb" data-tabname="tab3" class="tab-radio">
        <label for="tab-three" class="tab-label" style="border:1px solid #4169E1;">具有居住和公共功能的单体建筑</label>
        
        <div class="panels" style="border:0px solid #F60;width:100%; height:100%;background: #FFF;">
            <div data-tabname="tab1" class="panel-item" style="border:0px solid #F60;margin:0px 2px;background: #FFF;">
				<div style="border:0px solid #F00;">
			    	<table>
			    		<tr>
			    			<td>
			    				<h5><b>建筑名称：</b></h5>
			    			</td>
			    			<td>
			    				<select id="jzmc_jz" onchange="jzid=this.value;getLandUtilizeData_jz();">
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
		             		用地指标&nbsp;&nbsp;<input type="text" id="A" value="" readonly="readonly" style="width:5%"/>&emsp;&emsp;&emsp;&emsp;
		             		楼层情况&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="radio" name="radio_A" value="1" onclick="return false;">3层以下</input>&emsp;&emsp;
		             		<input type="radio" name="radio_A" value="2" onclick="return false;">4~6层</input>&emsp;&emsp;
		             		<input type="radio" name="radio_A" value="3" onclick="return false;">7~12层</input>&emsp;&emsp;
		             		<input type="radio" name="radio_A" value="4" onclick="return false;">13~18层</input>&emsp;&emsp;
		             		<input type="radio" name="radio_A" value="5" onclick="return false;">19层以上</input>
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
		             		<input type="checkbox" id="checkbox_xqldl" onclick="checkClickZqldl(this);">新区建设达到30%</input>&emsp;&emsp;
		             		<input type="checkbox" id="checkbox_jqldl" onclick="checkClickZqldl(this);">旧区改建达到25%</input>&emsp;&emsp;
		             		<input type="checkbox" id="checkbox_ldlAllNo" onclick="checkAllNo();">都未达标</input>
		             	</td>
		             </tr>
		             <tr style="height:2px">
		             	<td rowspan="2" style="vertical-align: middle">
		             		住区人均公共绿地面积Ag
		             	</td>
		             	<td>
		             		<input type="checkBox" id="checkbox_xqjs" onclick="checkClickAg(this);">新区建设&emsp;&emsp;&emsp;&emsp;
		             		<input type="radio" name="radio_Ag_x" value="1" onclick="return false;">1.0㎡≤ Ag <1.3㎡</input>&emsp;&emsp;
		             		<input type="radio" name="radio_Ag_x" value="2" onclick="return false;">1.3㎡≤ Ag <1.5㎡</input>&emsp;&emsp;
		             		<input type="radio" name="radio_Ag_x" value="3" onclick="return false;">Ag≥1.5㎡</input>
		             	</td>
		             </tr>
		             <tr style="height:2px">
		             	<td>
		             		<input type="checkBox" id="checkbox_jqgj" onclick="checkClickAg(this);">旧区改建&emsp;&emsp;&emsp;&emsp;
		             		<input type="radio" name="radio_Ag_j" value="1" onclick="return false;">0.7㎡≤ Ag <0.9㎡</input>&emsp;&emsp;
		             		<input type="radio" name="radio_Ag_j" value="2" onclick="return false;">0.9㎡≤ Ag <1.0㎡</input>&emsp;&emsp;
		             		<input type="radio" name="radio_Ag_j" value="3" onclick="return false;">Ag≥1.0㎡</input>
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
		             		<input type="radio" name="radio_Rr" value="1" onclick="return false;">5%≤ Rr <20%</input>&emsp;&emsp;
		             		<input type="radio" name="radio_Rr" value="2" onclick="return false;">20%≤ Rr <35%</input>&emsp;&emsp;
		             		<input type="radio" name="radio_Rr" value="3" onclick="return false;">Rr≥35%</input>
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
			    				<select id="jzmc_gg" onchange="jzid=this.value;getLandUtilizeData_gg();">
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
		             		<input type="radio" name="radio_R" value="1">0.5≤ R <0.8</input>&emsp;&emsp;
		             		<input type="radio" name="radio_R" value="2">0.8≤ R <1.5</input>&emsp;&emsp;
		             		<input type="radio" name="radio_R" value="3">1.5≤ R <3.5</input>&emsp;&emsp;
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
		             		<input type="radio" name="radio_kfqk" value="1">开放</input>&emsp;&emsp;
		             		<input type="radio" name="radio_kfqk" value="2">不开放</input>
		             	</td>
		             </tr>
		             <tr style="height:2px">
		             	<td>
		             		公共建筑绿地率Rg
		             	</td>
		             	<td>
		             		<input type="radio" name="radio_Rg" value="1">30%≤ Rg <35%</input>&emsp;&emsp;
		             		<input type="radio" name="radio_Rg" value="2">35%≤ Rg <40%</input>&emsp;&emsp;
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
		             		<input type="radio" name="radio_Rp1" value="1" onclick="return false;">Rp1 ≥0.5</input>&emsp;&emsp;
		             		<input type="radio" name="radio_Rp1" value="2" onclick="return false;">Rp1 ≥0.7且Rp2 <70%</input>
		             	</td>
		             </tr>
				</table>
				<div style="border:0px solid #F90;height:30px;float:right;">
			    	<input type="button" style="width:65px;height:25px;" onclick="saveData_gg();" value="保存"></input>
			    </div>
            </div>
            <div data-tabname="tab3" class="panel-item hidden" style="padding:0px 0px;background: #FFF;">
            	<div style="border:0px solid #F00;">
			    	<table>
			    		<tr>
			    			<td>
			    				<h5><b>建筑名称：</b></h5>
			    			</td>
			    			<td>
			    				<select id="jzmc_dt" onchange="jzid=this.value;getLandUtilizeData_dt();">
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
		             		居住建筑人均居住用地指标A
		             	</td>
		             	<td>
		             		用地指标&nbsp;&nbsp;<input type="text" id="A_dt" value="" readonly="readonly" style="width:5%"/>&emsp;&emsp;&emsp;&emsp;
		             		楼层情况&nbsp;&nbsp;&nbsp;&nbsp;
		             		<input type="radio" name="radio_A_dt" value="1" onclick="return false;">3层以下</input>&emsp;&emsp;
		             		<input type="radio" name="radio_A_dt" value="2" onclick="return false;">4~6层</input>&emsp;&emsp;
		             		<input type="radio" name="radio_A_dt" value="3" onclick="return false;">7~12层</input>&emsp;&emsp;
		             		<input type="radio" name="radio_A_dt" value="4" onclick="return false;">13~18层</input>&emsp;&emsp;
		             		<input type="radio" name="radio_A_dt" value="5" onclick="return false;">19层以上</input>
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
		             		<input type="checkbox" id="checkbox_xqldl_dt" onclick="checkClickZqldl_dt(this);">新区建设达到30%</input>&emsp;&emsp;
		             		<input type="checkbox" id="checkbox_jqldl_dt" onclick="checkClickZqldl_dt(this);">旧区改建达到25%</input>&emsp;&emsp;
		             		<input type="checkbox" id="checkbox_ldlAllNo_dt" onclick="checkAllNo_dt();">都未达标</input>
		             	</td>
		            </tr>
		            <tr style="height:2px">
		             	<td rowspan="2" style="vertical-align: middle">
		             		住区人均公共绿地面积Ag
		             	</td>
		             	<td>
		             		<input type="checkBox" id="checkbox_xqjs_dt" onclick="checkClickAg_dt(this);">新区建设&emsp;&emsp;&emsp;&emsp;
		             		<input type="radio" name="radio_Ag_x_dt" value="1" onclick="return false;">1.0㎡≤ Ag <1.3㎡</input>&emsp;&emsp;
		             		<input type="radio" name="radio_Ag_x_dt" value="2" onclick="return false;">1.3㎡≤ Ag <1.5㎡</input>&emsp;&emsp;
		             		<input type="radio" name="radio_Ag_x_dt" value="3" onclick="return false;">Ag≥1.5㎡</input>
		             	</td>
		            </tr>
		            <tr style="height:2px">
		             	<td>
		             		<input type="checkBox" id="checkbox_jqgj_dt" onclick="checkClickAg_dt(this);">旧区改建&emsp;&emsp;&emsp;&emsp;
		             		<input type="radio" name="radio_Ag_j_dt" value="1" onclick="return false;">0.7㎡≤ Ag <0.9㎡</input>&emsp;&emsp;
		             		<input type="radio" name="radio_Ag_j_dt" value="2" onclick="return false;">0.9㎡≤ Ag <1.0㎡</input>&emsp;&emsp;
		             		<input type="radio" name="radio_Ag_j_dt" value="3" onclick="return false;">Ag≥1.0㎡</input>
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
		             		<input type="radio" name="radio_Rr_dt" value="1" onclick="return false;">5%≤ Rr <20%</input>&emsp;&emsp;
		             		<input type="radio" name="radio_Rr_dt" value="2" onclick="return false;">20%≤ Rr <35%</input>&emsp;&emsp;
		             		<input type="radio" name="radio_Rr_dt" value="3" onclick="return false;">Rr≥35%</input>
		             	</td>
		            </tr>
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
		             		<input type="radio" name="radio_R_dt" value="1">0.5≤ R <0.8</input>&emsp;&emsp;
		             		<input type="radio" name="radio_R_dt" value="2">0.8≤ R <1.5</input>&emsp;&emsp;
		             		<input type="radio" name="radio_R_dt" value="3">1.5≤ R <3.5</input>&emsp;&emsp;
		             		<input type="radio" name="radio_R_dt" value="4">R≥3.5</input>
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
		             		<input type="radio" name="radio_kfqk_dt" value="1">开放</input>&emsp;&emsp;
		             		<input type="radio" name="radio_kfqk_dt" value="2">不开放</input>
		             	</td>
		             </tr>
		             <tr style="height:2px">
		             	<td>
		             		公共建筑绿地率Rg
		             	</td>
		             	<td>
		             		<input type="radio" name="radio_Rg_dt" value="1">30%≤ Rg <35%</input>&emsp;&emsp;
		             		<input type="radio" name="radio_Rg_dt" value="2">35%≤ Rg <40%</input>&emsp;&emsp;
		             		<input type="radio" name="radio_Rg_dt" value="3">Rg≥40%</input>
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
		             		<input type="radio" name="radio_Rp1_dt" value="1" onclick="return false;">Rp1 ≥0.5</input>&emsp;&emsp;
		             		<input type="radio" name="radio_Rp1_dt" value="2" onclick="return false;">Rp1 ≥0.7且Rp2 <70%</input>
		             	</td>
		             </tr>
				</table>
				<div style="border:0px solid #F90;height:30px;float:right;">
			    	<input type="button" style="width:65px;height:25px;" onclick="saveData_dt();" value="保存"></input>
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