package org.gb.entity;

import java.math.BigDecimal;

/**
 * GbQ2 entity. @author MyEclipse Persistence Tools
 */

public class GbQ2 implements java.io.Serializable {

	// Fields

	private String id;
	private GbBuilding gbBuilding;
	private BigDecimal jzywhjgdf;
	private BigDecimal gntfyktdf;
	private BigDecimal zmydqdf;
	private BigDecimal nlzhlydf;

	// Constructors

	/** default constructor */
	public GbQ2() {
	}

	/** minimal constructor */
	public GbQ2(String id) {
		this.id = id;
	}

	/** full constructor */
	public GbQ2(String id, GbBuilding gbBuilding, BigDecimal jzywhjgdf,
			BigDecimal gntfyktdf, BigDecimal zmydqdf, BigDecimal nlzhlydf) {
		this.id = id;
		this.gbBuilding = gbBuilding;
		this.jzywhjgdf = jzywhjgdf;
		this.gntfyktdf = gntfyktdf;
		this.zmydqdf = zmydqdf;
		this.nlzhlydf = nlzhlydf;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public GbBuilding getGbBuilding() {
		return this.gbBuilding;
	}

	public void setGbBuilding(GbBuilding gbBuilding) {
		this.gbBuilding = gbBuilding;
	}

	public BigDecimal getJzywhjgdf() {
		return this.jzywhjgdf;
	}

	public void setJzywhjgdf(BigDecimal jzywhjgdf) {
		this.jzywhjgdf = jzywhjgdf;
	}

	public BigDecimal getGntfyktdf() {
		return this.gntfyktdf;
	}

	public void setGntfyktdf(BigDecimal gntfyktdf) {
		this.gntfyktdf = gntfyktdf;
	}

	public BigDecimal getZmydqdf() {
		return this.zmydqdf;
	}

	public void setZmydqdf(BigDecimal zmydqdf) {
		this.zmydqdf = zmydqdf;
	}

	public BigDecimal getNlzhlydf() {
		return this.nlzhlydf;
	}

	public void setNlzhlydf(BigDecimal nlzhlydf) {
		this.nlzhlydf = nlzhlydf;
	}

}