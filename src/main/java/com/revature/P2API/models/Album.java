package com.revature.P2API.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Album {
	
	private String idAlbum;
	
	private String idArtist;
	
	private String strAlbum;
	
	private String strArtist;
	
	private String intYearReleased;
	
	private String strStyle;
	
	private String strGenre;
	
	private String strLabel;
	
	private String strReleaseFormat;
	
	private String strAlbumThumb;
	
	private String strDescriptionEN;
	
	private String intScore;
	
	private String strMood;
	

	public Album() {
		super();
	}

	public String getIdAlbum() {
		return idAlbum;
	}

	public void setIdAlbum(String idAlbum) {
		this.idAlbum = idAlbum;
	}

	public String getIdArtist() {
		return idArtist;
	}

	public void setIdArtist(String idArtist) {
		this.idArtist = idArtist;
	}

	public String getStrAlbum() {
		return strAlbum;
	}

	public void setStrAlbum(String strAlbum) {
		this.strAlbum = strAlbum;
	}

	public String getStrArtist() {
		return strArtist;
	}

	public void setStrArtist(String strArtist) {
		this.strArtist = strArtist;
	}

	public String getIntYearReleased() {
		return intYearReleased;
	}

	public void setIntYearReleased(String intYearReleased) {
		this.intYearReleased = intYearReleased;
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

	public String getStrLabel() {
		return strLabel;
	}

	public void setStrLabel(String strLabel) {
		this.strLabel = strLabel;
	}

	public String getStrReleaseFormat() {
		return strReleaseFormat;
	}

	public void setStrReleaseFormat(String strReleaseFormat) {
		this.strReleaseFormat = strReleaseFormat;
	}

	public String getStrAlbumThumb() {
		return strAlbumThumb;
	}

	public void setStrAlbumThumb(String strAlbumThumb) {
		this.strAlbumThumb = strAlbumThumb;
	}

	public String getStrDescriptionEN() {
		return strDescriptionEN;
	}

	public void setStrDescriptionEN(String strDescriptionEN) {
		this.strDescriptionEN = strDescriptionEN;
	}

	public String getIntScore() {
		return intScore;
	}

	public void setIntScore(String intScore) {
		this.intScore = intScore;
	}

	public String getStrMood() {
		return strMood;
	}

	public void setStrMood(String strMood) {
		this.strMood = strMood;
	}
	
	
	

}
