package org.gb.entity;

import java.math.BigDecimal;

/**
 * GbQ1 entity. @author MyEclipse Persistence Tools
 */

public class GbQ1 implements java.io.Serializable {

	// Fields

	private String id;
	private GbBuilding gbBuilding;
	private BigDecimal tdlydf;
	private BigDecimal swhjdf;
	private BigDecimal jtssyggfwdf;
	private BigDecimal cdsjycdstdf;

	// Constructors

	/** default constructor */
	public GbQ1() {
	}

	/** minimal constructor */
	public GbQ1(String id) {
		this.id = id;
	}

	/** full constructor */
	public GbQ1(String id, GbBuilding gbBuilding, BigDecimal tdlydf,
			BigDecimal swhjdf, BigDecimal jtssyggfwdf, BigDecimal cdsjycdstdf) {
		this.id = id;
		this.gbBuilding = gbBuilding;
		this.tdlydf = tdlydf;
		this.swhjdf = swhjdf;
		this.jtssyggfwdf = jtssyggfwdf;
		this.cdsjycdstdf = cdsjycdstdf;
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

	public BigDecimal getTdlydf() {
		return this.tdlydf;
	}

	public void setTdlydf(BigDecimal tdlydf) {
		this.tdlydf = tdlydf;
	}

	public BigDecimal getSwhjdf() {
		return this.swhjdf;
	}

	public void setSwhjdf(BigDecimal swhjdf) {
		this.swhjdf = swhjdf;
	}

	public BigDecimal getJtssyggfwdf() {
		return this.jtssyggfwdf;
	}

	public void setJtssyggfwdf(BigDecimal jtssyggfwdf) {
		this.jtssyggfwdf = jtssyggfwdf;
	}

	public BigDecimal getCdsjycdstdf() {
		return this.cdsjycdstdf;
	}

	public void setCdsjycdstdf(BigDecimal cdsjycdstdf) {
		this.cdsjycdstdf = cdsjycdstdf;
	}

}