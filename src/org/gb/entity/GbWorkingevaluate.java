package org.gb.entity;

import java.math.BigDecimal;

/**
 * GbWorkingevaluate entity. @author MyEclipse Persistence Tools
 */

public class GbWorkingevaluate implements java.io.Serializable {

	// Fields

	private String id;
	private GbBuilding gbBuilding;
	private String nature;
	private BigDecimal w1;
	private BigDecimal w2;
	private BigDecimal w3;
	private BigDecimal w4;
	private BigDecimal w5;
	private BigDecimal w6;
	private BigDecimal w7;

	// Constructors

	/** default constructor */
	public GbWorkingevaluate() {
	}

	/** minimal constructor */
	public GbWorkingevaluate(String id) {
		this.id = id;
	}

	/** full constructor */
	public GbWorkingevaluate(String id, GbBuilding gbBuilding, String nature,
			BigDecimal w1, BigDecimal w2, BigDecimal w3, BigDecimal w4,
			BigDecimal w5, BigDecimal w6, BigDecimal w7) {
		this.id = id;
		this.gbBuilding = gbBuilding;
		this.nature = nature;
		this.w1 = w1;
		this.w2 = w2;
		this.w3 = w3;
		this.w4 = w4;
		this.w5 = w5;
		this.w6 = w6;
		this.w7 = w7;
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

	public String getNature() {
		return this.nature;
	}

	public void setNature(String nature) {
		this.nature = nature;
	}

	public BigDecimal getW1() {
		return this.w1;
	}

	public void setW1(BigDecimal w1) {
		this.w1 = w1;
	}

	public BigDecimal getW2() {
		return this.w2;
	}

	public void setW2(BigDecimal w2) {
		this.w2 = w2;
	}

	public BigDecimal getW3() {
		return this.w3;
	}

	public void setW3(BigDecimal w3) {
		this.w3 = w3;
	}

	public BigDecimal getW4() {
		return this.w4;
	}

	public void setW4(BigDecimal w4) {
		this.w4 = w4;
	}

	public BigDecimal getW5() {
		return this.w5;
	}

	public void setW5(BigDecimal w5) {
		this.w5 = w5;
	}

	public BigDecimal getW6() {
		return this.w6;
	}

	public void setW6(BigDecimal w6) {
		this.w6 = w6;
	}

	public BigDecimal getW7() {
		return this.w7;
	}

	public void setW7(BigDecimal w7) {
		this.w7 = w7;
	}

}