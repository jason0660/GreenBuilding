package org.gb.dao.Impls;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.gb.dao.IBuildingDataDao;
import org.gb.entity.GbBuilding;
import org.gb.entity.GbDesignevaluate;
import org.gb.entity.GbQ1;
import org.gb.entity.GbQ2;
import org.gb.entity.GbQ3;
import org.gb.entity.GbQ4;
import org.gb.entity.GbQ5;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class BuildingDataDaoImpl extends HibernateDaoSupport implements IBuildingDataDao{
	
	private static final Logger log = LoggerFactory.getLogger(BuildingDataDaoImpl.class);
	/**
	 * 新增建筑
	 * @param gbBuilding
	 */
	public void addGbBuilding(GbBuilding gbBuilding){
		try{
			getHibernateTemplate().save(gbBuilding);
			log.debug("save successful");
		}catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	/**
	 * 查询所有建筑
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<GbBuilding> getAllBuilding(){
		List<GbBuilding> dList = this.getHibernateTemplate().find("from GbBuilding order by buildingName");
		return dList;
	}
	
	/**
	 * 根据建筑性质查询建筑
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<GbBuilding> getBuildingByNature(String nature){
		List<GbBuilding> dList = new ArrayList<GbBuilding>();
		try{
			dList = this.getHibernateTemplate().find("from GbBuilding b where b.buildingNature='"+nature+"'" + " order by buildingName");
		} catch (Throwable e1){
			System.out.println("error "+e1.getMessage());
			e1.printStackTrace();
		}
		if(dList.size()==0){
			return null;
		}
		return dList;
	}
	
	/**
	 * 新增节地与室外环境得分
	 * @param gbQ1
	 */
	public void addGbQ1(GbQ1 gbQ1){
		try{
			getHibernateTemplate().save(gbQ1);
			log.debug("save successful");
		}catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
		
		updateGbDesignevaluate(gbQ1);
	}
	
	/**
	 * 新增节能与能源利用得分
	 * @param gbQ2
	 */
	public void addGbQ2(GbQ2 gbQ2){
		try{
			getHibernateTemplate().save(gbQ2);
			log.debug("save successful");
		}catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
		
		updateGbDesignevaluate(gbQ2);
	}
	
	/**
	 * 更新节地与室外环境得分
	 * @param gbQ1
	 */
	public void updateGbQ1(GbQ1 gbQ1){
		String id;
		id = gbQ1.getGbBuilding().getBuildingId();
		List<GbQ1> q1List = findGbQ1ById(id);
		if(q1List!=null){
			GbQ1 gbQ1_old = gbQ1;
			gbQ1 = q1List.get(0);
			if(gbQ1_old.getTdlydf()!=null)
				gbQ1.setTdlydf(gbQ1_old.getTdlydf());//本次提交土地利用得分
			if(gbQ1_old.getSwhjdf()!=null)
				gbQ1.setSwhjdf(gbQ1_old.getSwhjdf());//本次提交了室外环境得分
			if(gbQ1_old.getJtssyggfwdf()!=null)
				gbQ1.setJtssyggfwdf(gbQ1_old.getJtssyggfwdf());//本次提交了交通设施与公共服务得分
			if(gbQ1_old.getCdsjycdstdf()!=null)
				gbQ1.setCdsjycdstdf(gbQ1_old.getCdsjycdstdf());//本次提交了场地设计与场地生态得分
		}
		try{
			getHibernateTemplate().update(gbQ1);
			log.debug("save successful");
		}catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
		
		updateGbDesignevaluate(gbQ1);
	}
	
	/**
	 * 更新节能与能源利用得分
	 * @param gbQ2
	 */
	public void updateGbQ2(GbQ2 gbQ2){
		String id;
		id = gbQ2.getGbBuilding().getBuildingId();
		List<GbQ2> q2List = findGbQ2ById(id);
		if(q2List!=null){
			GbQ2 gbQ2_old = gbQ2;
			gbQ2 = q2List.get(0);
			if(gbQ2_old.getJzywhjgdf()!=null)
				gbQ2.setJzywhjgdf(gbQ2_old.getJzywhjgdf());//本次提交了建筑与围护结构得分
			if(gbQ2_old.getGntfyktdf()!=null)
				gbQ2.setGntfyktdf(gbQ2_old.getGntfyktdf());//本次提交了供暖、通风与空调得分
			if(gbQ2_old.getZmydqdf()!=null)
				gbQ2.setZmydqdf(gbQ2_old.getZmydqdf());//本次提交了照明与电气得分
			if(gbQ2_old.getNlzhlydf()!=null)
				gbQ2.setNlzhlydf(gbQ2_old.getNlzhlydf());//本次提交了能量综合利用得分
		}
		try{
			getHibernateTemplate().update(gbQ2);
			log.debug("save successful");
		}catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
		
		updateGbDesignevaluate(gbQ2);
	}
	
	/**
	 * 更新设计评估得分
	 * @return
	 */
	public void updateGbDesignevaluate(GbQ1 gbQ1){
		BigDecimal tdlydf,swhjdf,jtssyggfwdf,cdsjycdstdf;
		BigDecimal w1 = new BigDecimal(0);
		List<GbQ1> q1List = findGbQ1ById(gbQ1.getGbBuilding().getBuildingId());
		if(q1List!=null){				
			tdlydf = q1List.get(0).getTdlydf();
			if(tdlydf!=null)
				w1 = w1.add(tdlydf);
			swhjdf = q1List.get(0).getSwhjdf();
			if(swhjdf!=null)
				w1 = w1.add(swhjdf);
			jtssyggfwdf = q1List.get(0).getJtssyggfwdf();
			if(jtssyggfwdf!=null)
				w1 = w1.add(jtssyggfwdf);
			cdsjycdstdf = q1List.get(0).getCdsjycdstdf();
			if(cdsjycdstdf!=null)
				w1 = w1.add(cdsjycdstdf);
		}
		
		try{
			List<GbDesignevaluate> dList = findGbDesignevaluateById(gbQ1.getGbBuilding().getBuildingId());			
			if(dList!=null){//已有设计评估得分记录则更新，否则新增设计评估得分记录
				GbDesignevaluate de = dList.get(0);
				de.setW1(w1);
				getHibernateTemplate().update(de);
			}
			else{
				GbBuilding gbBuilding = findGbBuildingById(gbQ1.getGbBuilding().getBuildingId());
				GbDesignevaluate d = new GbDesignevaluate();
				d.setId(UUID.randomUUID().toString().replace("-", ""));
				d.setW1(w1);
				d.setGbBuilding(gbBuilding);
				getHibernateTemplate().save(d);
			}
			log.debug("save successful");
		}catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	public void updateGbDesignevaluate(GbQ2 gbQ2){
		BigDecimal jzywhjgdf,gntfyktdf,zmydqdf,nlzhlydf;
		BigDecimal w2 = new BigDecimal(0);
		List<GbQ2> q2List = findGbQ2ById(gbQ2.getGbBuilding().getBuildingId());
		if(q2List!=null){				
			jzywhjgdf = q2List.get(0).getJzywhjgdf();
			if(jzywhjgdf!=null)
				w2 = w2.add(jzywhjgdf);
			gntfyktdf = q2List.get(0).getGntfyktdf();
			if(gntfyktdf!=null)
				w2 = w2.add(gntfyktdf);
			zmydqdf = q2List.get(0).getZmydqdf();
			if(zmydqdf!=null)
				w2 = w2.add(zmydqdf);
			nlzhlydf = q2List.get(0).getNlzhlydf();
			if(nlzhlydf!=null)
				w2 = w2.add(nlzhlydf);
		}
		
		try{
			List<GbDesignevaluate> dList = findGbDesignevaluateById(gbQ2.getGbBuilding().getBuildingId());			
			if(dList!=null){//已有设计评估得分记录则更新，否则新增设计评估得分记录
				GbDesignevaluate de = dList.get(0);
				de.setW2(w2);
				getHibernateTemplate().update(de);
			}
			else{
				GbBuilding gbBuilding = findGbBuildingById(gbQ2.getGbBuilding().getBuildingId());
				GbDesignevaluate d = new GbDesignevaluate();
				d.setId(UUID.randomUUID().toString().replace("-", ""));
				d.setW2(w2);
				d.setGbBuilding(gbBuilding);
				getHibernateTemplate().save(d);
			}
			log.debug("save successful");
		}catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	public void updateGbDesignevaluate(GbQ3 gbQ3){
		BigDecimal jsxtdf,jsqjysbdf,fctsylydf;
		BigDecimal w3 = new BigDecimal(0);
		List<GbQ3> q3List = findGbQ3ById(gbQ3.getGbBuilding().getBuildingId());
		if(q3List!=null){				
			jsxtdf = q3List.get(0).getJsxtdf();
			if(jsxtdf!=null)
				w3 = w3.add(jsxtdf);
			jsqjysbdf = q3List.get(0).getJsqjysbdf();
			if(jsqjysbdf!=null)
				w3 = w3.add(jsqjysbdf);
			fctsylydf = q3List.get(0).getFctsylydf();
			if(fctsylydf!=null)
				w3 = w3.add(fctsylydf);
		}
		
		try{
			List<GbDesignevaluate> dList = findGbDesignevaluateById(gbQ3.getGbBuilding().getBuildingId());			
			if(dList!=null){//已有设计评估得分记录则更新，否则新增设计评估得分记录
				GbDesignevaluate de = dList.get(0);
				de.setW3(w3);
				getHibernateTemplate().update(de);
			}
			else{
				GbBuilding gbBuilding = findGbBuildingById(gbQ3.getGbBuilding().getBuildingId());
				GbDesignevaluate d = new GbDesignevaluate();
				d.setId(UUID.randomUUID().toString().replace("-", ""));
				d.setW3(w3);
				d.setGbBuilding(gbBuilding);
				getHibernateTemplate().save(d);
			}
			log.debug("save successful");
		}catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	public void updateGbDesignevaluate(GbQ4 gbQ4){
		BigDecimal jcsjdf,clxydf;
		BigDecimal w4 = new BigDecimal(0);
		List<GbQ4> q4List = findGbQ4ById(gbQ4.getGbBuilding().getBuildingId());
		if(q4List!=null){				
			jcsjdf = q4List.get(0).getJcsjdf();
			if(jcsjdf!=null)
				w4 = w4.add(jcsjdf);
			clxydf = q4List.get(0).getClxydf();
			if(clxydf!=null)
				w4 = w4.add(clxydf);
		}
		
		try{
			List<GbDesignevaluate> dList = findGbDesignevaluateById(gbQ4.getGbBuilding().getBuildingId());			
			if(dList!=null){//已有设计评估得分记录则更新，否则新增设计评估得分记录
				GbDesignevaluate de = dList.get(0);
				de.setW4(w4);
				getHibernateTemplate().update(de);
			}
			else{
				GbBuilding gbBuilding = findGbBuildingById(gbQ4.getGbBuilding().getBuildingId());
				GbDesignevaluate d = new GbDesignevaluate();
				d.setId(UUID.randomUUID().toString().replace("-", ""));
				d.setW4(w4);
				d.setGbBuilding(gbBuilding);
				getHibernateTemplate().save(d);
			}
			log.debug("save successful");
		}catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	public void updateGbDesignevaluate(GbQ5 gbQ5){
		BigDecimal snshjdf,snghjysydf,snrshjdf,snkqzldf;
		BigDecimal w5 = new BigDecimal(0);
		List<GbQ5> q5List = findGbQ5ById(gbQ5.getGbBuilding().getBuildingId());
		if(q5List!=null){				
			snshjdf = q5List.get(0).getSnshjdf();
			if(snshjdf!=null)
				w5 = w5.add(snshjdf);
			snghjysydf = q5List.get(0).getSnghjysydf();
			if(snghjysydf!=null)
				w5 = w5.add(snghjysydf);
			snrshjdf = q5List.get(0).getSnrshjdf();
			if(snrshjdf!=null)
				w5 = w5.add(snrshjdf);
			snkqzldf = q5List.get(0).getSnkqzldf();
			if(snkqzldf!=null)
				w5 = w5.add(snkqzldf);
		}
		
		try{
			List<GbDesignevaluate> dList = findGbDesignevaluateById(gbQ5.getGbBuilding().getBuildingId());			
			if(dList!=null){//已有设计评估得分记录则更新，否则新增设计评估得分记录
				GbDesignevaluate de = dList.get(0);
				de.setW5(w5);
				getHibernateTemplate().update(de);
			}
			else{
				GbBuilding gbBuilding = findGbBuildingById(gbQ5.getGbBuilding().getBuildingId());
				GbDesignevaluate d = new GbDesignevaluate();
				d.setId(UUID.randomUUID().toString().replace("-", ""));
				d.setW5(w5);
				d.setGbBuilding(gbBuilding);
				getHibernateTemplate().save(d);
			}
			log.debug("save successful");
		}catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	/**
	 * 根据ID查询建筑
	 * @param id
	 */
	@SuppressWarnings("unchecked")
	public GbBuilding findGbBuildingById(String id){
		List<GbBuilding> bList = this.getHibernateTemplate().find("from GbBuilding where buildingId='"+id+"'");
		if(bList.size()==0){
			return null;
		}
		return bList.get(0);
	}
	
	/**
	 * 根据BuildingID查询Q1
	 * @param id
	 */
	@SuppressWarnings("unchecked")
	public List<GbQ1> findGbQ1ById(String id){
		List<GbQ1> bList = this.getHibernateTemplate().find("from GbQ1 where gbBuilding.buildingId='"+id+"'");
		if(bList.size()==0){
			return null;
		}
		return bList;
	}
	
	/**
	 * 根据BuildingID查询Q2
	 * @param id
	 */
	@SuppressWarnings("unchecked")
	public List<GbQ2> findGbQ2ById(String id){
		List<GbQ2> bList = this.getHibernateTemplate().find("from GbQ2 where gbBuilding.buildingId='"+id+"'");
		if(bList.size()==0){
			return null;
		}
		return bList;
	}
	
	/**
	 * 根据BuildingID查询Q3
	 * @param id
	 */
	@SuppressWarnings("unchecked")
	public List<GbQ3> findGbQ3ById(String id){
		List<GbQ3> bList = this.getHibernateTemplate().find("from GbQ3 where gbBuilding.buildingId='"+id+"'");
		if(bList.size()==0){
			return null;
		}
		return bList;
	}
	
	/**
	 * 根据BuildingID查询Q4
	 * @param id
	 */
	@SuppressWarnings("unchecked")
	public List<GbQ4> findGbQ4ById(String id){
		List<GbQ4> bList = this.getHibernateTemplate().find("from GbQ4 where gbBuilding.buildingId='"+id+"'");
		if(bList.size()==0){
			return null;
		}
		return bList;
	}
	
	/**
	 * 根据BuildingID查询Q5
	 * @param id
	 */
	@SuppressWarnings("unchecked")
	public List<GbQ5> findGbQ5ById(String id){
		List<GbQ5> bList = this.getHibernateTemplate().find("from GbQ5 where gbBuilding.buildingId='"+id+"'");
		if(bList.size()==0){
			return null;
		}
		return bList;
	}
	
	/**
	 * 根据BuildingID查询Q1
	 * @param id
	 */
	@SuppressWarnings("unchecked")
	public List<GbDesignevaluate> findGbDesignevaluateById(String id){
		List<GbDesignevaluate> bList = this.getHibernateTemplate().find("from GbDesignevaluate where gbBuilding.buildingId='"+id+"'");
		if(bList.size()==0){
			return null;
		}
		return bList;
	}
}
