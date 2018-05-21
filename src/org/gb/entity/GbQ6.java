package org.gb.entity;

import java.math.BigDecimal;

/**
 * GbQ6 entity. @author MyEclipse Persistence Tools
 */

public class GbQ6 implements java.io.Serializable {

	// Fields

	private String id;
	private GbBuilding gbBuilding;
	private BigDecimal hjbhdf;
	private BigDecimal zyjydf;
	private BigDecimal gcgldf;

	// Constructors

	/** default constructor */
	public GbQ6() {
	}

	/** minimal constructor */
	public GbQ6(String id) {
		this.id = id;
	}

	/** full constructor */
	public GbQ6(String id, GbBuilding gbBuilding, BigDecimal hjbhdf,
			BigDecimal zyjydf, BigDecimal gcgldf) {
		this.id = id;
		this.gbBuilding = gbBuilding;
		this.hjbhdf = hjbhdf;
		this.zyjydf = zyjydf;
		this.gcgldf = gcgldf;
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

	public BigDecimal getHjbhdf() {
		return this.hjbhdf;
	}

	public void setHjbhdf(BigDecimal hjbhdf) {
		this.hjbhdf = hjbhdf;
	}

	public BigDecimal getZyjydf() {
		return this.zyjydf;
	}

	public void setZyjydf(BigDecimal zyjydf) {
		this.zyjydf = zyjydf;
	}

	public BigDecimal getGcgldf() {
		return this.gcgldf;
	}

	public void setGcgldf(BigDecimal gcgldf) {
		this.gcgldf = gcgldf;
	}

}