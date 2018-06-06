package org.gb.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.gb.dao.IBuildingDataDao;
import org.gb.entity.GbBuilding;
import org.gb.entity.GbBuildingdrawing;
import org.gb.entity.GbDesignevaluate;
import org.gb.entity.GbQ1;
import org.gb.entity.GbQ2;
import org.gb.entity.GbQ3;
import org.gb.entity.GbQ4;
import org.json.JSONArray;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class BuildingDataAction extends ActionSupport {
	
	//注入buildingDataDao
	private IBuildingDataDao buildingDataDao;
	public IBuildingDataDao getBuildingDataDao() {
		return buildingDataDao;
	}
	public void setBuildingDataDao(IBuildingDataDao buildingDataDao) {
		this.buildingDataDao = buildingDataDao;
	}
	public String saveBuildingBasicData(){
		HttpServletRequest request=ServletActionContext.getRequest();
		//获取参数
		String buildingName=request.getParameter("jzmc");
		String buildingAddress=request.getParameter("jzdz");
		String buildingNature=request.getParameter("jzlx");
		
		String buildingL=request.getParameter("L");
		String buildingR=request.getParameter("R");
		String buildingH=request.getParameter("H");
		String buildingBR=request.getParameter("BR");
		String buildingAR=request.getParameter("AR");
		String buildingB1R=request.getParameter("B1R");
		String buildingALLR=request.getParameter("ALLR");
		String buildingALLGR=request.getParameter("ALLGR");
		
		GbBuilding gbBuilding = new GbBuilding();
		gbBuilding.setBuildingId(UUID.randomUUID().toString().replace("-", ""));
		gbBuilding.setBuildingName(buildingName);
		gbBuilding.setBuildingAddress(buildingAddress);
		gbBuilding.setBuildingNature(buildingNature);
		
		this.buildingDataDao.addGbBuilding(gbBuilding);//保存建筑基本信息
		
		GbBuildingdrawing gbBuildingDrawing = new GbBuildingdrawing();
		gbBuildingDrawing.setId(UUID.randomUUID().toString().replace("-", ""));
		gbBuildingDrawing.setGbBuilding(gbBuilding);
		gbBuildingDrawing.setL(buildingL);
		if(!buildingR.equals("0"))
		{
			BigDecimal bd_buildingR=new BigDecimal(buildingR);
			gbBuildingDrawing.setR(bd_buildingR);
		}
		gbBuildingDrawing.setH(buildingH);
		if(!buildingBR.equals("0"))
		{
			BigDecimal bd_buildingBR=new BigDecimal(buildingBR);
			gbBuildingDrawing.setBr(bd_buildingBR);
		}
		if(!buildingAR.equals("0"))
		{
			BigDecimal bd_buildingAR=new BigDecimal(buildingAR);
			gbBuildingDrawing.setAr(bd_buildingAR);
		}
		if(!buildingB1R.equals("0"))
		{
			BigDecimal bd_buildingB1R=new BigDecimal(buildingB1R);
			gbBuildingDrawing.setB1r(bd_buildingB1R);
		}
		if(!buildingALLR.equals("0"))
		{
			BigDecimal bd_buildingALLR=new BigDecimal(buildingALLR);
			gbBuildingDrawing.setAllr(bd_buildingALLR);
		}
		if(!buildingALLGR.equals("0"))
		{
			BigDecimal bd_buildingALLGR=new BigDecimal(buildingALLGR);
			gbBuildingDrawing.setAllgr(bd_buildingALLGR);
		}
		
		this.buildingDataDao.addGbBuildingDrawing(gbBuildingDrawing);//保存建筑图纸信息
		
		String isSaveOk="1";
		//输出到页面
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter out = response.getWriter();
			//总数据
		    JSONArray json = new JSONArray();
		    json.put(isSaveOk);
		    System.out.println(json.toString());
			//传到页面
		    out.write(json.toString());
		    out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
	public String getBuildingData(){
		HttpServletRequest request=ServletActionContext.getRequest();
		//获取参数
		String jzid=request.getParameter("jzid");
		//获取列表
		GbBuilding building = buildingDataDao.findGbBuildingById(jzid);

		if(building!=null){
			HttpServletResponse response=ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			try {
				PrintWriter out = response.getWriter();
				//总数据
				JSONArray json = new JSONArray();
				//GbBuilding数据
				JSONArray buildingId = new JSONArray();
				JSONArray buildingName = new JSONArray();
				JSONArray buildingAddress = new JSONArray();
				JSONArray buildingNature = new JSONArray();
				JSONArray buildingLevel = new JSONArray();
				//循环放入数据库中读取的值
				//for (int i = 0; i < bList.size(); i++) {
					//GbBuilding b = bList.get(i);
					buildingId.put(building.getBuildingId());
					buildingName.put(building.getBuildingName());
					buildingAddress.put(building.getBuildingAddress());
					buildingNature.put(building.getBuildingNature());
					buildingLevel.put(building.getBuildingLevel());
				//}
				json.put(buildingId);
				json.put(buildingName);
				json.put(buildingAddress);
				json.put(buildingNature);
				json.put(buildingLevel);
				//传到页面
				out.write(json.toString());
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return NONE;
	}
	
	public String getLandUtilizeData(){
		HttpServletRequest request=ServletActionContext.getRequest();
		//获取参数
		String jzid=request.getParameter("jzid");
		//获取列表
		GbBuildingdrawing buildingDrawing = buildingDataDao.findGbBuildingdrawingById(jzid);

		if(buildingDrawing!=null){
			HttpServletResponse response=ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			try {
				PrintWriter out = response.getWriter();
				//总数据
				JSONArray json = new JSONArray();
				//GbBuilding数据
				JSONArray buildingL = new JSONArray();
				JSONArray buildingR = new JSONArray();
				JSONArray buildingH = new JSONArray();
				JSONArray buildingAr = new JSONArray();
				JSONArray buildingBr = new JSONArray();
				JSONArray buildingB1r = new JSONArray();
				JSONArray buildingAllr = new JSONArray();
				JSONArray buildingAllgr = new JSONArray();
				//放入数据库中读取的值
				buildingL.put(buildingDrawing.getL());
				buildingR.put(buildingDrawing.getR());
				buildingH.put(buildingDrawing.getH());
				buildingAr.put(buildingDrawing.getAr());
				buildingBr.put(buildingDrawing.getBr());
				buildingB1r.put(buildingDrawing.getB1r());
				buildingAllr.put(buildingDrawing.getAllr());
				buildingAllgr.put(buildingDrawing.getAllgr());

				json.put(buildingL);
				json.put(buildingR);
				json.put(buildingH);
				json.put(buildingAr);
				json.put(buildingBr);
				json.put(buildingB1r);
				json.put(buildingAllr);
				json.put(buildingAllgr);
				//传到页面
				out.write(json.toString());
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return NONE;
	}
	
	public String getDesignEvaluate(){
		HttpServletRequest request=ServletActionContext.getRequest();
		//获取参数
		String jzid=request.getParameter("jzid");
		//获取列表
		List<GbDesignevaluate> dList = buildingDataDao.findGbDesignevaluateById(jzid);

		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter out = response.getWriter();
			//总数据
			JSONArray json = new JSONArray();
			//GbBuilding数据
			JSONArray jdyswhjdf = new JSONArray();
			JSONArray jnynylydf = new JSONArray();
			JSONArray jsyszylydf = new JSONArray();
			JSONArray jcyclzylydf = new JSONArray();
			JSONArray snhjzldf = new JSONArray();
			if(dList!=null){
				//循环放入数据库中读取的值
				for (int i = 0; i < dList.size(); i++) {
					GbDesignevaluate d = dList.get(i);
					jdyswhjdf.put(d.getW1());
					jnynylydf.put(d.getW2());
					jsyszylydf.put(d.getW3());
					jcyclzylydf.put(d.getW4());
					snhjzldf.put(d.getW5());
				}
			}
			else{
				jdyswhjdf.put("");
				jnynylydf.put("");
				jsyszylydf.put("");
				jcyclzylydf.put("");
				snhjzldf.put("");
			}
				
			json.put(jdyswhjdf);
			json.put(jnynylydf);
			json.put(jsyszylydf);
			json.put(jcyclzylydf);
			json.put(snhjzldf);
			//传到页面
			out.write(json.toString());
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return NONE;
	}
	
	public String getBuilding(){
		//获取列表
		List<GbBuilding> bList = buildingDataDao.getAllBuilding();

		if(bList.size()!=0){
			HttpServletResponse response=ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			try {
				PrintWriter out = response.getWriter();
				//总数据
				JSONArray json = new JSONArray();
				//折线图数据
				JSONArray buildingId = new JSONArray();
				JSONArray buildingName = new JSONArray();
				//循环放入数据库中读取的值
				for (int i = 0; i < bList.size(); i++) {
					GbBuilding b = bList.get(i);
					buildingId.put(b.getBuildingId());
					buildingName.put(b.getBuildingName());
				}
				json.put(buildingId);
				json.put(buildingName);
				//传到页面
				out.write(json.toString());
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return NONE;
	}
	
	public String getBuildingByNature(){
		HttpServletRequest request=ServletActionContext.getRequest();
		//获取参数
		String nature=request.getParameter("nature");
		//获取列表
		List<GbBuilding> bList = buildingDataDao.getBuildingByNature(nature);

		if(bList!=null){
			HttpServletResponse response=ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8");
			try {
				PrintWriter out = response.getWriter();
				//总数据
				JSONArray json = new JSONArray();
				//折线图数据
				JSONArray buildingId = new JSONArray();
				JSONArray buildingName = new JSONArray();
				//循环放入数据库中读取的值
				for (int i = 0; i < bList.size(); i++) {
					GbBuilding b = bList.get(i);
					buildingId.put(b.getBuildingId());
					buildingName.put(b.getBuildingName());
				}
				json.put(buildingId);
				json.put(buildingName);
				//传到页面
				out.write(json.toString());
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return NONE;
	}
	
	public String saveQ1Data(){
		HttpServletRequest request=ServletActionContext.getRequest();
		//获取参数
		String buildingId=request.getParameter("jzid");		
		GbBuilding gbBuilding = this.buildingDataDao.findGbBuildingById(buildingId);
		
		String tdlydf=request.getParameter("tdlydf");
		String swhjdf=request.getParameter("swhjdf");
		String jtssyggfwdf=request.getParameter("jtssyggfwdf");
		String cdsjycdstdf=request.getParameter("cdsjycdstdf");
		
		GbQ1 gbQ1 = new GbQ1();
		gbQ1.setId(UUID.randomUUID().toString().replace("-", ""));
		gbQ1.setGbBuilding(gbBuilding);
		if(!tdlydf.equals("0"))
		{
			BigDecimal bd_tdlydf=new BigDecimal(tdlydf);
			gbQ1.setTdlydf(bd_tdlydf);
		}
		if(!swhjdf.equals("0"))
		{
			BigDecimal bd_swhjdf=new BigDecimal(swhjdf);
			gbQ1.setSwhjdf(bd_swhjdf);
		}
		if(!jtssyggfwdf.equals("0"))
		{
			BigDecimal bd_jtssyggfwdf=new BigDecimal(jtssyggfwdf);
			gbQ1.setJtssyggfwdf(bd_jtssyggfwdf);
		}
		if(!cdsjycdstdf.equals("0"))
		{
			BigDecimal bd_cdsjycdstdf=new BigDecimal(cdsjycdstdf);
			gbQ1.setCdsjycdstdf(bd_cdsjycdstdf);
		}
		List<GbQ1> bList = this.buildingDataDao.findGbQ1ById(buildingId);
		if(bList==null)
			this.buildingDataDao.addGbQ1(gbQ1);
		else
			this.buildingDataDao.updateGbQ1(gbQ1);
		
		String isSaveOk="1";
		//输出到页面
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter out = response.getWriter();
			//总数据
		    JSONArray json = new JSONArray();
		    json.put(isSaveOk);
		    System.out.println(json.toString());
			//传到页面
		    out.write(json.toString());
		    out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String saveQ2Data(){
		HttpServletRequest request=ServletActionContext.getRequest();
		//获取参数
		String buildingId=request.getParameter("jzid");		
		GbBuilding gbBuilding = this.buildingDataDao.findGbBuildingById(buildingId);
		
		String jzywhjgdf=request.getParameter("jzywhjgdf");
		String gntfyktdf=request.getParameter("gntfyktdf");
		String zmydqdf=request.getParameter("zmydqdf");
		String nlzhlydf=request.getParameter("nlzhlydf");
		
		GbQ2 gbQ2 = new GbQ2();
		gbQ2.setId(UUID.randomUUID().toString().replace("-", ""));
		gbQ2.setGbBuilding(gbBuilding);
		if(!jzywhjgdf.equals("0"))
		{
			BigDecimal bd_jzywhjgdf=new BigDecimal(jzywhjgdf);
			gbQ2.setJzywhjgdf(bd_jzywhjgdf);
		}
		if(!gntfyktdf.equals("0"))
		{
			BigDecimal bd_gntfyktdf=new BigDecimal(gntfyktdf);
			gbQ2.setGntfyktdf(bd_gntfyktdf);
		}
		if(!zmydqdf.equals("0"))
		{
			BigDecimal bd_zmydqdf=new BigDecimal(zmydqdf);
			gbQ2.setZmydqdf(bd_zmydqdf);
		}
		if(!nlzhlydf.equals("0"))
		{
			BigDecimal bd_nlzhlydf=new BigDecimal(nlzhlydf);
			gbQ2.setNlzhlydf(bd_nlzhlydf);
		}
		List<GbQ2> bList = this.buildingDataDao.findGbQ2ById(buildingId);
		if(bList==null)
			this.buildingDataDao.addGbQ2(gbQ2);
		else
			this.buildingDataDao.updateGbQ2(gbQ2);
		
		String isSaveOk="1";
		//输出到页面
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter out = response.getWriter();
			//总数据
		    JSONArray json = new JSONArray();
		    json.put(isSaveOk);
		    System.out.println(json.toString());
			//传到页面
		    out.write(json.toString());
		    out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String saveQ3Data(){
		HttpServletRequest request=ServletActionContext.getRequest();
		//获取参数
		String buildingId=request.getParameter("jzid");		
		GbBuilding gbBuilding = this.buildingDataDao.findGbBuildingById(buildingId);
		
		String jsxtdf=request.getParameter("jsxtdf");
		String jsqjysbdf=request.getParameter("jsqjysbdf");
		String fctsylydf=request.getParameter("fctsylydf");
		
		GbQ3 gbQ3 = new GbQ3();
		gbQ3.setId(UUID.randomUUID().toString().replace("-", ""));
		gbQ3.setGbBuilding(gbBuilding);
		if(!jsxtdf.equals("0"))
		{
			BigDecimal bd_jsxtdf=new BigDecimal(jsxtdf);
			gbQ3.setJsxtdf(bd_jsxtdf);
		}
		if(!jsqjysbdf.equals("0"))
		{
			BigDecimal bd_jsqjysbdf=new BigDecimal(jsqjysbdf);
			gbQ3.setJsqjysbdf(bd_jsqjysbdf);
		}
		if(!fctsylydf.equals("0"))
		{
			BigDecimal bd_fctsylydf=new BigDecimal(fctsylydf);
			gbQ3.setFctsylydf(bd_fctsylydf);
		}

		List<GbQ3> bList = this.buildingDataDao.findGbQ3ById(buildingId);
		if(bList==null)
			this.buildingDataDao.addGbQ3(gbQ3);
		else
			this.buildingDataDao.updateGbQ3(gbQ3);
		
		String isSaveOk="1";
		//输出到页面
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter out = response.getWriter();
			//总数据
		    JSONArray json = new JSONArray();
		    json.put(isSaveOk);
		    System.out.println(json.toString());
			//传到页面
		    out.write(json.toString());
		    out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String saveQ4Data(){
		HttpServletRequest request=ServletActionContext.getRequest();
		//获取参数
		String buildingId=request.getParameter("jzid");		
		GbBuilding gbBuilding = this.buildingDataDao.findGbBuildingById(buildingId);
		
		String jcsjdf=request.getParameter("jcsjdf");
		String clxydf=request.getParameter("clxydf");
		
		GbQ4 gbQ4 = new GbQ4();
		gbQ4.setId(UUID.randomUUID().toString().replace("-", ""));
		gbQ4.setGbBuilding(gbBuilding);
		if(!jcsjdf.equals("0"))
		{
			BigDecimal bd_jcsjdf=new BigDecimal(jcsjdf);
			gbQ4.setJcsjdf(bd_jcsjdf);
		}
		if(!clxydf.equals("0"))
		{
			BigDecimal bd_clxydf=new BigDecimal(clxydf);
			gbQ4.setClxydf(bd_clxydf);
		}

		List<GbQ4> bList = this.buildingDataDao.findGbQ4ById(buildingId);
		if(bList==null)
			this.buildingDataDao.addGbQ4(gbQ4);
		else
			this.buildingDataDao.updateGbQ4(gbQ4);
		
		String isSaveOk="1";
		//输出到页面
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter out = response.getWriter();
			//总数据
		    JSONArray json = new JSONArray();
		    json.put(isSaveOk);
		    System.out.println(json.toString());
			//传到页面
		    out.write(json.toString());
		    out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}
}
