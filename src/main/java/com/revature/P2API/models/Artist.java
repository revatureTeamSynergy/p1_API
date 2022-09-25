package com.revature.P2API.models;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Artist {
	
	private String idArtist;
	
	private String strArtist;
	
	private String strLabel;
	
	private String intFormedYear;
	
	private String strStyle;
	
	private String strGenre;
	
	private String strMood;
	
	private String strWebsite;
	
	private String strBiographyEN;
	
	private Integer intMembers;
	
	private String strCountry; 
	
	private String strCountryCode;
	
	private String strArtistThumb;
	
	private String strArtistLogo;
	
	private String strArtistBanner;
	
	private String strLastFMChart;

	public Artist() {
		super();
	}

	public String getIdArtist() {
		return idArtist;
	}

	public void setIdArtist(String idArtist) {
		this.idArtist = idArtist;
	}

	public String getStrArtist() {
		return strArtist;
	}

	public void setStrArtist(String strArtist) {
		this.strArtist = strArtist;
	}

	public String getStrLabel() {
		return strLabel;
	}

	public void setStrLabel(String strLabel) {
		this.strLabel = strLabel;
	}

	public String getIntFormedYear() {
		return intFormedYear;
	}

	public void setIntFormedYear(String intFormedYear) {
		this.intFormedYear = intFormedYear;
	}

	public String getStrStyle() {
		return strStyle;
	}

	public void setStrStyle(String strStyle) {
		this.strStyle = strStyle;
	}

	public String getStrGenre() {
		return strGenre;
	}

	public void setStrGenre(String strGenre) {
		this.strGenre = strGenre;
	}

	public String getStrMood() {
		return strMood;
	}

	public void setStrMood(String strMood) {
		this.strMood = strMood;
	}

	public String getStrWebsite() {
		return strWebsite;
	}

	public void setStrWebsite(String strWebsite) {
		this.strWebsite = strWebsite;
	}

	public String getStrBiographyEN() {
		return strBiographyEN;
	}

	public void setStrBiographyEN(String strBiographyEN) {
		this.strBiographyEN = strBiographyEN;
	}

	public Integer getIntMembers() {
		return intMembers;
	}

	public void setIntMembers(Integer intMembers) {
		this.intMembers = intMembers;
	}

	public String getStrCountry() {
		return strCountry;
	}

	public void setStrCountry(String strCountry) {
		this.strCountry = strCountry;
	}

	public String getStrCountryCode() {
		return strCountryCode;
	}

	public void setStrCountryCode(String strCountryCode) {
		this.strCountryCode = strCountryCode;
	}

	public String getStrArtistThumb() {
		return strArtistThumb;
	}

	public void setStrArtistThumb(String strArtistThumb) {
		this.strArtistThumb = strArtistThumb;
	}

	public String getStrArtistLogo() {
		return strArtistLogo;
	}

	public void setStrArtistLogo(String strArtistLogo) {
		this.strArtistLogo = strArtistLogo;
	}

	public String getStrArtistBanner() {
		return strArtistBanner;
	}

	public void setStrArtistBanner(String strArtistBanner) {
		this.strArtistBanner = strArtistBanner;
	}

	public String getStrLastFMChart() {
		return strLastFMChart;
	}

	public void setStrLastFMChart(String strLastFMChart) {
		this.strLastFMChart = strLastFMChart;
	}

	
	
	
	
	
	
	

}
