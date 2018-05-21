package org.gb.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * GbBuilding entity. @author MyEclipse Persistence Tools
 */

public class GbBuilding implements java.io.Serializable {

	// Fields

	private String buildingId;
	private String buildingName;
	private String buildingAddress;
	private String buildingNature;
	private String buildingLevel;
	private Set gbQ7s = new HashSet(0);
	private Set gbQ8s = new HashSet(0);
	private Set gbQ2s = new HashSet(0);
	private Set gbQ3s = new HashSet(0);
	private Set gbDesignevaluates = new HashSet(0);
	private Set gbQ6s = new HashSet(0);
	private Set gbQ5s = new HashSet(0);
	private Set gbQ4s = new HashSet(0);
	private Set gbQ1s = new HashSet(0);
	private Set gbWorkingevaluates = new HashSet(0);

	// Constructors

	/** default constructor */
	public GbBuilding() {
	}

	/** minimal constructor */
	public GbBuilding(String buildingId) {
		this.buildingId = buildingId;
	}

	/** full constructor */
	public GbBuilding(String buildingId, String buildingName,
			String buildingAddress, String buildingNature,
			String buildingLevel, Set gbQ7s, Set gbQ8s, Set gbQ2s, Set gbQ3s,
			Set gbDesignevaluates, Set gbQ6s, Set gbQ5s, Set gbQ4s, Set gbQ1s,
			Set gbWorkingevaluates) {
		this.buildingId = buildingId;
		this.buildingName = buildingName;
		this.buildingAddress = buildingAddress;
		this.buildingNature = buildingNature;
		this.buildingLevel = buildingLevel;
		this.gbQ7s = gbQ7s;
		this.gbQ8s = gbQ8s;
		this.gbQ2s = gbQ2s;
		this.gbQ3s = gbQ3s;
		this.gbDesignevaluates = gbDesignevaluates;
		this.gbQ6s = gbQ6s;
		this.gbQ5s = gbQ5s;
		this.gbQ4s = gbQ4s;
		this.gbQ1s = gbQ1s;
		this.gbWorkingevaluates = gbWorkingevaluates;
	}

	// Property accessors

	public String getBuildingId() {
		return this.buildingId;
	}

	public void setBuildingId(String buildingId) {
		this.buildingId = buildingId;
	}

	public String getBuildingName() {
		return this.buildingName;
	}

	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}

	public String getBuildingAddress() {
		return this.buildingAddress;
	}

	public void setBuildingAddress(String buildingAddress) {
		this.buildingAddress = buildingAddress;
	}

	public String getBuildingNature() {
		return this.buildingNature;
	}

	public void setBuildingNature(String buildingNature) {
		this.buildingNature = buildingNature;
	}

	public String getBuildingLevel() {
		return this.buildingLevel;
	}

	public void setBuildingLevel(String buildingLevel) {
		this.buildingLevel = buildingLevel;
	}

	public Set getGbQ7s() {
		return this.gbQ7s;
	}

	public void setGbQ7s(Set gbQ7s) {
		this.gbQ7s = gbQ7s;
	}

	public Set getGbQ8s() {
		return this.gbQ8s;
	}

	public void setGbQ8s(Set gbQ8s) {
		this.gbQ8s = gbQ8s;
	}

	public Set getGbQ2s() {
		return this.gbQ2s;
	}

	public void setGbQ2s(Set gbQ2s) {
		this.gbQ2s = gbQ2s;
	}

	public Set getGbQ3s() {
		return this.gbQ3s;
	}

	public void setGbQ3s(Set gbQ3s) {
		this.gbQ3s = gbQ3s;
	}

	public Set getGbDesignevaluates() {
		return this.gbDesignevaluates;
	}

	public void setGbDesignevaluates(Set gbDesignevaluates) {
		this.gbDesignevaluates = gbDesignevaluates;
	}

	public Set getGbQ6s() {
		return this.gbQ6s;
	}

	public void setGbQ6s(Set gbQ6s) {
		this.gbQ6s = gbQ6s;
	}

	public Set getGbQ5s() {
		return this.gbQ5s;
	}

	public void setGbQ5s(Set gbQ5s) {
		this.gbQ5s = gbQ5s;
	}

	public Set getGbQ4s() {
		return this.gbQ4s;
	}

	public void setGbQ4s(Set gbQ4s) {
		this.gbQ4s = gbQ4s;
	}

	public Set getGbQ1s() {
		return this.gbQ1s;
	}

	public void setGbQ1s(Set gbQ1s) {
		this.gbQ1s = gbQ1s;
	}

	public Set getGbWorkingevaluates() {
		return this.gbWorkingevaluates;
	}

	public void setGbWorkingevaluates(Set gbWorkingevaluates) {
		this.gbWorkingevaluates = gbWorkingevaluates;
	}

}