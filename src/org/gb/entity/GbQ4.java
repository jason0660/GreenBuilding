package org.gb.entity;

import java.math.BigDecimal;

/**
 * GbQ4 entity. @author MyEclipse Persistence Tools
 */

public class GbQ4 implements java.io.Serializable {

	// Fields

	private String id;
	private GbBuilding gbBuilding;
	private BigDecimal jcsjdf;
	private BigDecimal clxydf;

	// Constructors

	/** default constructor */
	public GbQ4() {
	}

	/** minimal constructor */
	public GbQ4(String id) {
		this.id = id;
	}

	/** full constructor */
	public GbQ4(String id, GbBuilding gbBuilding, BigDecimal jcsjdf,
			BigDecimal clxydf) {
		this.id = id;
		this.gbBuilding = gbBuilding;
		this.jcsjdf = jcsjdf;
		this.clxydf = clxydf;
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

	public BigDecimal getJcsjdf() {
		return this.jcsjdf;
	}

	public void setJcsjdf(BigDecimal jcsjdf) {
		this.jcsjdf = jcsjdf;
	}

	public BigDecimal getClxydf() {
		return this.clxydf;
	}

	public void setClxydf(BigDecimal clxydf) {
		this.clxydf = clxydf;
	}

}