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
import org.gb.entity.GbDesignevaluate;
import org.gb.entity.GbQ1;
import org.gb.entity.GbQ2;
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
		
		GbBuilding gbBuilding = new GbBuilding();
		gbBuilding.setBuildingId(UUID.randomUUID().toString().replace("-", ""));
		gbBuilding.setBuildingName(buildingName);
		gbBuilding.setBuildingAddress(buildingAddress);
		gbBuilding.setBuildingNature(buildingNature);
		
		this.buildingDataDao.addGbBuilding(gbBuilding);
		
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
}
