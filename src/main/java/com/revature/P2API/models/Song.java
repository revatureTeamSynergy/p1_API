package com.revature.P2API.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Song {

	private String idTrack;
	
	private String idAlbum;
	
	private String idArtist;
	
	private String strTrack;
	
	private String strAlbum;
	
	private String strArtist;
	
	private String intDuration;
	
	private String strGenre;
	
	private String intTrackNumber;

	
	
	public Song() {
		super();
	}

	public String getIdTrack() {
		return idTrack;
	}

	public void setIdTrack(String idTrack) {
		this.idTrack = idTrack;
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

	public String getStrTrack() {
		return strTrack;
	}

	public void setStrTrack(String strTrack) {
		this.strTrack = strTrack;
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

	public String getIntDuration() {
		return intDuration;
	}

	public void setIntDuration(String intDuration) {
		this.intDuration = intDuration;
	}

	public String getStrGenre() {
		return strGenre;
	}

	public void setStrGenre(String strGenre) {
		this.strGenre = strGenre;
	}

	public String getIntTrackNumber() {
		return intTrackNumber;
	}

	public void setIntTrackNumber(String intTrackNumber) {
		this.intTrackNumber = intTrackNumber;
	}
	
	
	
}
