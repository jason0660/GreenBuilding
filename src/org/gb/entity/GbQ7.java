package org.gb.entity;

import java.math.BigDecimal;

/**
 * GbQ7 entity. @author MyEclipse Persistence Tools
 */

public class GbQ7 implements java.io.Serializable {

	// Fields

	private String id;
	private GbBuilding gbBuilding;
	private BigDecimal glzddf;
	private BigDecimal jsgldf;
	private BigDecimal hjgldf;

	// Constructors

	/** default constructor */
	public GbQ7() {
	}

	/** minimal constructor */
	public GbQ7(String id) {
		this.id = id;
	}

	/** full constructor */
	public GbQ7(String id, GbBuilding gbBuilding, BigDecimal glzddf,
			BigDecimal jsgldf, BigDecimal hjgldf) {
		this.id = id;
		this.gbBuilding = gbBuilding;
		this.glzddf = glzddf;
		this.jsgldf = jsgldf;
		this.hjgldf = hjgldf;
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

	public BigDecimal getGlzddf() {
		return this.glzddf;
	}

	public void setGlzddf(BigDecimal glzddf) {
		this.glzddf = glzddf;
	}

	public BigDecimal getJsgldf() {
		return this.jsgldf;
	}

	public void setJsgldf(BigDecimal jsgldf) {
		this.jsgldf = jsgldf;
	}

	public BigDecimal getHjgldf() {
		return this.hjgldf;
	}

	public void setHjgldf(BigDecimal hjgldf) {
		this.hjgldf = hjgldf;
	}

}