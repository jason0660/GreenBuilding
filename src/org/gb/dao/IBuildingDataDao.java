package org.gb.dao;

import java.util.List;

import org.gb.entity.GbBuilding;
import org.gb.entity.GbBuildingdrawing;
import org.gb.entity.GbDesignevaluate;
import org.gb.entity.GbQ1;
import org.gb.entity.GbQ2;
import org.gb.entity.GbQ3;
import org.gb.entity.GbQ4;
import org.gb.entity.GbQ5;

public interface IBuildingDataDao {
	/**
	 * 新增建筑
	 * @param gbBuilding
	 */
	public void addGbBuilding(GbBuilding gbBuilding);
	
	/**
	 * 新增建筑图纸信息
	 * @param gbBuildingDrawing
	 */
	public void addGbBuildingDrawing(GbBuildingdrawing gbBuildingDrawing);
	
	/**
	 * 查询所有建筑
	 * @return
	 */
	public List<GbBuilding> getAllBuilding(); 
	
	/**
	 * 根据建筑性质查询建筑
	 * @return
	 */
	public List<GbBuilding> getBuildingByNature(String nature);
	
	/**
	 * 新增节地与室外环境得分
	 * @return
	 */
	public void addGbQ1(GbQ1 gbQ1);
	
	/**
	 * 新增节能与能源利用得分
	 * @return
	 */
	public void addGbQ2(GbQ2 gbQ2);
	
	/**
	 * 新增节能与能源利用得分
	 * @return
	 */
	public void addGbQ3(GbQ3 gbQ3);
	
	/**
	 * 新增节能与能源利用得分
	 * @return
	 */
	public void addGbQ4(GbQ4 gbQ4);
	
	/**
	 * 新增节能与能源利用得分
	 * @return
	 */
	public void addGbQ5(GbQ5 gbQ5);
	
	/**
	 * 更新节地与室外环境得分
	 * @return
	 */
	public void updateGbQ1(GbQ1 gbQ1);
	
	/**
	 * 更新节能与能源利用得分
	 * @return
	 */
	public void updateGbQ2(GbQ2 gbQ2);
	
	/**
	 * 更新节能与能源利用得分
	 * @return
	 */
	public void updateGbQ3(GbQ3 gbQ3);
	
	/**
	 * 更新节能与能源利用得分
	 * @return
	 */
	public void updateGbQ4(GbQ4 gbQ4);
	
	/**
	 * 更新节能与能源利用得分
	 * @return
	 */
	public void updateGbQ5(GbQ5 gbQ5);
	
	/**
	 * 更新设计评估得分
	 * @return
	 */
	public void updateGbDesignevaluate(GbQ1 gbQ1);
	
	public void updateGbDesignevaluate(GbQ2 gbQ2);
	
	public void updateGbDesignevaluate(GbQ3 gbQ3);
	
	public void updateGbDesignevaluate(GbQ4 gbQ4);
	
	public void updateGbDesignevaluate(GbQ5 gbQ5);
	
	/**
	 * 计算建筑评估得分
	 * @return
	 */
	public void calculateBuildingScore(GbQ1 gbQ1);
	
	public void calculateBuildingScore(GbQ2 gbQ2);
	
	public void calculateBuildingScore(GbQ3 gbQ3);
	
	public void calculateBuildingScore(GbQ4 gbQ4);
	
	public void calculateBuildingScore(GbQ5 gbQ5);
	
	/**
	 * 根据ID查询建筑
	 * @return
	 */
	public GbBuilding findGbBuildingById(String id);
	
	/**
	 * 根据ID查询建筑图纸信息
	 * @return
	 */
	public GbBuildingdrawing findGbBuildingdrawingById(String id);
	
	/**
	 * 根据BuildingID查询Q1
	 * @return
	 */
	public List<GbQ1> findGbQ1ById(String id);
	
	/**
	 * 根据BuildingID查询Q2
	 * @return
	 */
	public List<GbQ2> findGbQ2ById(String id);
	
	/**
	 * 根据BuildingID查询Q3
	 * @return
	 */
	public List<GbQ3> findGbQ3ById(String id);
	
	/**
	 * 根据BuildingID查询Q4
	 * @return
	 */
	public List<GbQ4> findGbQ4ById(String id);
	
	/**
	 * 根据BuildingID查询Q5
	 * @return
	 */
	public List<GbQ5> findGbQ5ById(String id);
	
	
	/**
	 * 根据BuildingID查询设计评估得分
	 * @return
	 */
	public List<GbDesignevaluate> findGbDesignevaluateById(String id);
}
