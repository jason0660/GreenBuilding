package org.gb.entity;

import java.math.BigDecimal;

/**
 * GbQ5 entity. @author MyEclipse Persistence Tools
 */

public class GbQ5 implements java.io.Serializable {

	// Fields

	private String id;
	private GbBuilding gbBuilding;
	private BigDecimal snshjdf;
	private BigDecimal snghjysydf;
	private BigDecimal snrshjdf;
	private BigDecimal snkqzldf;

	// Constructors

	/** default constructor */
	public GbQ5() {
	}

	/** minimal constructor */
	public GbQ5(String id) {
		this.id = id;
	}

	/** full constructor */
	public GbQ5(String id, GbBuilding gbBuilding, BigDecimal snshjdf,
			BigDecimal snghjysydf, BigDecimal snrshjdf, BigDecimal snkqzldf) {
		this.id = id;
		this.gbBuilding = gbBuilding;
		this.snshjdf = snshjdf;
		this.snghjysydf = snghjysydf;
		this.snrshjdf = snrshjdf;
		this.snkqzldf = snkqzldf;
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

	public BigDecimal getSnshjdf() {
		return this.snshjdf;
	}

	public void setSnshjdf(BigDecimal snshjdf) {
		this.snshjdf = snshjdf;
	}

	public BigDecimal getSnghjysydf() {
		return this.snghjysydf;
	}

	public void setSnghjysydf(BigDecimal snghjysydf) {
		this.snghjysydf = snghjysydf;
	}

	public BigDecimal getSnrshjdf() {
		return this.snrshjdf;
	}

	public void setSnrshjdf(BigDecimal snrshjdf) {
		this.snrshjdf = snrshjdf;
	}

	public BigDecimal getSnkqzldf() {
		return this.snkqzldf;
	}

	public void setSnkqzldf(BigDecimal snkqzldf) {
		this.snkqzldf = snkqzldf;
	}

}