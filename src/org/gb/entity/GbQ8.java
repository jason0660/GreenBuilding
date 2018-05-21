package org.gb.entity;

import java.math.BigDecimal;

/**
 * GbQ8 entity. @author MyEclipse Persistence Tools
 */

public class GbQ8 implements java.io.Serializable {

	// Fields

	private String id;
	private GbBuilding gbBuilding;
	private BigDecimal xntgdf;
	private BigDecimal cxdf;

	// Constructors

	/** default constructor */
	public GbQ8() {
	}

	/** minimal constructor */
	public GbQ8(String id) {
		this.id = id;
	}

	/** full constructor */
	public GbQ8(String id, GbBuilding gbBuilding, BigDecimal xntgdf,
			BigDecimal cxdf) {
		this.id = id;
		this.gbBuilding = gbBuilding;
		this.xntgdf = xntgdf;
		this.cxdf = cxdf;
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

	public BigDecimal getXntgdf() {
		return this.xntgdf;
	}

	public void setXntgdf(BigDecimal xntgdf) {
		this.xntgdf = xntgdf;
	}

	public BigDecimal getCxdf() {
		return this.cxdf;
	}

	public void setCxdf(BigDecimal cxdf) {
		this.cxdf = cxdf;
	}

}