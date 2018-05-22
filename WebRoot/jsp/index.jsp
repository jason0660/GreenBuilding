<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>绿色建筑评价管理</title>

    <!-- BOOTSTRAP STYLES-->
    <link href="/GreenBuilding/css/bootstrap.css" rel="stylesheet"/>
    <!-- FONTAWESOME STYLES-->
    <link href="/GreenBuilding/css/font-awesome.css" rel="stylesheet"/>
    <!--CUSTOM BASIC STYLES-->
    <link href="/GreenBuilding/css/basic.css" rel="stylesheet"/>
    <!--CUSTOM MAIN STYLES-->
    <link href="/GreenBuilding/css/custom.css" rel="stylesheet"/>
    <!-- GOOGLE FONTS-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
	<script type="text/javascript">
		function changeFrameSrc(addr)
		{
			var frm = document.getElementById('content');
			frm.src=addr;
		}
	</script>
</head>
<body>
    <div id="wrapper">
        <!-- <img style="margin-left: 35px;margin-top: 15px;" src="/GreenBuilding/img/logo.png"/>-->
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0px">   
            <h1 class="navbar-header fa-4x">绿色建筑设计评估管理云平台</h1>      
            <!-- 邮件消息登出图标  -->
            <div class="header-right">
                <span>
                    <iframe allowtransparency="true" frameborder="0" width="290" height="96" scrolling="no" src="//tianqi.2345.com/plugin/widget/index.htm?s=2&z=1&t=0&v=0&d=2&bd=0&k=&f=&ltf=009944&htf=cc0000&q=1&e=1&a=0&c=59635&w=290&h=96&align=left"></iframe>
                </span>
                <a href="#" class="btn btn-info" title="消息"><i
                        class="fa fa-envelope-o fa-2x"></i></a>
                <a href="#" class="btn btn-primary" title="操作日志"><i
                        class="fa fa-bars fa-2x"></i></a>
                <a href="/GreenBuilding/jsp/login.jsp" class="btn btn-danger" title="退出登录"><i
                        class="fa fa-exclamation-circle fa-2x"></i></a>
            </div>
        </nav>
        <!-- /. NAV TOP  -->

		<nav class="navbar-default navbar-side" role="navigation">
	        <div class="sidebar-collapse">
	            <ul class="nav" id="main-menu">
	                <li>
	                    <a class="active-menu" href="#" onclick="changeFrameSrc('/GreenBuilding/jsp/main.jsp')"><i class="fa fa-desktop "></i>主页 </a>
	                    <a href="#" onclick="changeFrameSrc('/GreenBuilding/jsp/buildingBasicData.jsp')"><i class="fa fa-bug "></i>建筑基本信息 </a>
	                </li>
	
	                <li>	                    
	                    <a href="#"><i class="fa fa-yelp "></i>节地与室外环境 <span class="fa arrow"></span></a>
	                    <ul class="nav nav-second-level">
	                        <li>
	                            <a href="#" onclick="changeFrameSrc('/GreenBuilding/jsp/landUtilize.jsp')">土地利用</a>
	                        </li>
	                        <li>
	                            <a href="#" onclick="changeFrameSrc('/GreenBuilding/jsp/outdoorEnvironment.jsp')">室外环境</a>
	                        </li>
	                        <li>
	                            <a href="#" onclick="changeFrameSrc('/GreenBuilding/jsp/trafficFacilityPublicService.jsp')">交通设施与公共服务</a>
	                        </li>
	                        <li>
	                            <a href="#" onclick="changeFrameSrc('/GreenBuilding/jsp/siteDesignAndFieldEcology.jsp')">场地设计与场地生态</a>
	                        </li>
	                    </ul>
	                </li>
	
	                <li>
	                    <a href="#"><i class="fa fa-flash "></i>节能与能源利用<span class="fa arrow"></span></a>
	                    <ul class="nav nav-second-level">
	                        <li>
	                            <a href="#">建筑与围护结构</a>
	                        </li>
	                        <li>
	                            <a href="#">供暖、通风与空调</a>
	                        </li>
	                        <li>
	                            <a href="#">照明与电气</a>
	                        </li>
	                        <li>
	                            <a href="#">能量综合利用</a>
	                        </li>
	                    </ul>
	                </li>
	                
	                <li>
	                    <a href="#"><i class="fa fa-bicycle "></i>节水与水资源利用<span class="fa arrow"></span></a>
	                    <ul class="nav nav-second-level">
	                        <li>
	                            <a href="#">节水系统</a>
	                        </li>
	                        <li>
	                            <a href="#">节水器具与设备</a>
	                        </li>
	                        <li>
	                            <a href="#">非传统水源利用</a>
	                        </li>
	                    </ul>
	                </li>
	                
	                <li>
	                    <a href="#"><i class="fa fa-anchor "></i>节材与材料资源利用<span class="fa arrow"></span></a>
	                    <ul class="nav nav-second-level">
	                        <li>
	                            <a href="#">节材设计</a>
	                        </li>
	                        <li>
	                            <a href="#">材料选用</a>
	                        </li>
	                    </ul>
	                </li>
	                
	                <li>
	                    <a href="#"><i class="fa fa-key "></i>室内环境质量<span class="fa arrow"></span></a>
	                    <ul class="nav nav-second-level">
	                        <li>
	                            <a href="#">室内声环境</a>
	                        </li>
	                        <li>
	                            <a href="#">室内光环境与视野</a>
	                        </li>
	                        <li>
	                            <a href="#">室内热湿环境</a>
	                        </li>
	                        <li>
	                            <a href="#">室内空气质量</a>
	                        </li>
	                    </ul>
	                </li>
	                
	                <li>
	                    <a><i class="fa fa-sign-in "></i>施工管理<span class="fa arrow"></span></a>
	                    <ul class="nav nav-second-level">
	                        <li>
	                            <a href="#">环境保护</a>
	                        </li>
	                        <li>
	                            <a href="#">资源节约</a>
	                        </li>
	                        <li>
	                            <a href="#">过程管理</a>
	                        </li>
	                    </ul>
	                </li>
	                
	                <li>
	                    <a href="blank.html"><i class="fa fa-square-o "></i>运营管理<span class="fa arrow"></span></a>
	                    <ul class="nav nav-third-level">
	                        <li>
	                            <a href="#">管理制度</a>
	                        </li>
	                        <li>
	                            <a href="#">技术管理</a>
	                        </li>
	                        <li>
	                        	<a href="#">环境管理</a>
	                     	</li>
	                    </ul>
	                </li>
	                
	                <li>
	                    <a href="blank.html"><i class="fa fa-send "></i>提高与创新<span class="fa arrow"></span></a>
	                    <ul class="nav nav-third-level">
	                        <li>
	                            <a href="#">性能提高</a>
	                        </li>
	                        <li>
	                            <a href="#">创新</a>
	                        </li>
	                    </ul>
	                </li>
	            </ul>
	        </div>
        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" style="border:0px solid #F60;">
            <div id="page-inner" style="border:0px solid #F30;">
                <div style="border:0px solid #F00;width:100%;height:728px;">
                	<iframe id="content" frameborder="0" scrolling="no" style="width:100%;height:100%" src="/GreenBuilding/jsp/main.jsp"></iframe>
                </div>
                <!-- /. ROW  -->
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
<!-- /. WRAPPER  -->
<div id="footer-sec" style="border:0px solid #F60;">
    Copyright ® 2018, Green Building Valuate, All Rights Reserved &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;技术支持：南京新创力光电科技有限公司&nbsp;&nbsp;&nbsp;&nbsp;电子科技大学光电技术工程中心
</div>
<!-- /. FOOTER  -->

<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="/GreenBuilding/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="/GreenBuilding/js/bootstrap.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="/GreenBuilding/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="/GreenBuilding/js/custom.js"></script>


</body>
</html>