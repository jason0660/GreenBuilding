package org.gb.entity;

import java.math.BigDecimal;

/**
 * GbQ3 entity. @author MyEclipse Persistence Tools
 */

public class GbQ3 implements java.io.Serializable {

	// Fields

	private String id;
	private GbBuilding gbBuilding;
	private BigDecimal jsxtdf;
	private BigDecimal jsqjysbdf;
	private BigDecimal fctsylydf;

	// Constructors

	/** default constructor */
	public GbQ3() {
	}

	/** minimal constructor */
	public GbQ3(String id) {
		this.id = id;
	}

	/** full constructor */
	public GbQ3(String id, GbBuilding gbBuilding, BigDecimal jsxtdf,
			BigDecimal jsqjysbdf, BigDecimal fctsylydf) {
		this.id = id;
		this.gbBuilding = gbBuilding;
		this.jsxtdf = jsxtdf;
		this.jsqjysbdf = jsqjysbdf;
		this.fctsylydf = fctsylydf;
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

	public BigDecimal getJsxtdf() {
		return this.jsxtdf;
	}

	public void setJsxtdf(BigDecimal jsxtdf) {
		this.jsxtdf = jsxtdf;
	}

	public BigDecimal getJsqjysbdf() {
		return this.jsqjysbdf;
	}

	public void setJsqjysbdf(BigDecimal jsqjysbdf) {
		this.jsqjysbdf = jsqjysbdf;
	}

	public BigDecimal getFctsylydf() {
		return this.fctsylydf;
	}

	public void setFctsylydf(BigDecimal fctsylydf) {
		this.fctsylydf = fctsylydf;
	}

}