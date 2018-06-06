package org.gb.entity;

import java.math.BigDecimal;

/**
 * GbBuildingdrawing entity. @author MyEclipse Persistence Tools
 */

public class GbBuildingdrawing implements java.io.Serializable {

	// Fields

	private String id;
	private GbBuilding gbBuilding;
	private String l;
	private BigDecimal r;
	private String h;
	private BigDecimal br;
	private BigDecimal ar;
	private BigDecimal b1r;
	private BigDecimal allr;
	private BigDecimal allgr;

	// Constructors

	/** default constructor */
	public GbBuildingdrawing() {
	}

	/** minimal constructor */
	public GbBuildingdrawing(String id) {
		this.id = id;
	}

	/** full constructor */
	public GbBuildingdrawing(String id, GbBuilding gbBuilding, String l,
			BigDecimal r, String h, BigDecimal br, BigDecimal ar,
			BigDecimal b1r, BigDecimal allr, BigDecimal allgr) {
		this.id = id;
		this.gbBuilding = gbBuilding;
		this.l = l;
		this.r = r;
		this.h = h;
		this.br = br;
		this.ar = ar;
		this.b1r = b1r;
		this.allr = allr;
		this.allgr = allgr;
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

	public String getL() {
		return this.l;
	}

	public void setL(String l) {
		this.l = l;
	}

	public BigDecimal getR() {
		return this.r;
	}

	public void setR(BigDecimal r) {
		this.r = r;
	}

	public String getH() {
		return this.h;
	}

	public void setH(String h) {
		this.h = h;
	}

	public BigDecimal getBr() {
		return this.br;
	}

	public void setBr(BigDecimal br) {
		this.br = br;
	}

	public BigDecimal getAr() {
		return this.ar;
	}

	public void setAr(BigDecimal ar) {
		this.ar = ar;
	}

	public BigDecimal getB1r() {
		return this.b1r;
	}

	public void setB1r(BigDecimal b1r) {
		this.b1r = b1r;
	}

	public BigDecimal getAllr() {
		return this.allr;
	}

	public void setAllr(BigDecimal allr) {
		this.allr = allr;
	}

	public BigDecimal getAllgr() {
		return this.allgr;
	}

	public void setAllgr(BigDecimal allgr) {
		this.allgr = allgr;
	}

}