package com.revature.P2API.models;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.revature.P2API.models.MusicList;

@JsonIgnoreProperties(ignoreUnknown = true)
@Entity
public class Song {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private long id;
	
	private String idTrack;
	
	private String idAlbum;
	
	private String idArtist;
	
	private String strTrack;
	
	private String strAlbum;
	
	private String strArtist;
	
	private String intDuration;
	
	private String strGenre;
	
	private String intTrackNumber;
	
	private String strMusicVid;
	
	private String strDescriptionEN;
	
	@JsonIgnore
	@ManyToMany(mappedBy="songs")
    private Set<MusicList> lists;

	
	
	public Song() {
		super();
	}
	
	

	public Song(String idTrack, String idAlbum, String idArtist, String strTrack, String strAlbum, String strArtist,
			String intDuration, String strGenre, String intTrackNumber, Set<MusicList> lists, String strMusicVid, String strDescriptionEN) {
		super();
		this.idTrack = idTrack;
		this.idAlbum = idAlbum;
		this.idArtist = idArtist;
		this.strTrack = strTrack;
		this.strAlbum = strAlbum;
		this.strArtist = strArtist;
		this.intDuration = intDuration;
		this.strGenre = strGenre;
		this.intTrackNumber = intTrackNumber;
		this.lists = lists;
		this.strMusicVid = strMusicVid;
		this.strDescriptionEN = strDescriptionEN;
	}

	public Song(long id, String idTrack, String idAlbum, String idArtist, String strTrack, String strAlbum,
			String strArtist, String intDuration, String strGenre, String intTrackNumber, Set<MusicList> lists ) {
		super();
		this.id = id;
		this.idTrack = idTrack;
		this.idAlbum = idAlbum;
		this.idArtist = idArtist;
		this.strTrack = strTrack;
		this.strAlbum = strAlbum;
		this.strArtist = strArtist;
		this.intDuration = intDuration;
		this.strGenre = strGenre;
		this.intTrackNumber = intTrackNumber;
		this.lists = lists;
	}


	

	public Song(String idTrack, String idAlbum, String idArtist, String strTrack, String strAlbum, String strArtist,
			String intDuration, String strGenre, String intTrackNumber, String strMusicVid, String strDescriptionEN,
			Set<MusicList> lists) {
		super();
		this.idTrack = idTrack;
		this.idAlbum = idAlbum;
		this.idArtist = idArtist;
		this.strTrack = strTrack;
		this.strAlbum = strAlbum;
		this.strArtist = strArtist;
		this.intDuration = intDuration;
		this.strGenre = strGenre;
		this.intTrackNumber = intTrackNumber;
		this.strMusicVid = strMusicVid;
		this.strDescriptionEN = strDescriptionEN;
		this.lists = lists;
	}



	
	public long getId() {
		return id;
	}



	public void setId(long id) {
		this.id = id;
	}



	public String getStrMusicVid() {
		return strMusicVid;
	}



	public void setStrMusicVid(String strMusicVid) {
		this.strMusicVid = strMusicVid;
	}



	public String getStrDescriptionEN() {
		return strDescriptionEN;
	}



	public void setStrDescriptionEN(String strDescriptionEN) {
		this.strDescriptionEN = strDescriptionEN;
	}



	public void setLists(Set<MusicList> lists) {
		this.lists = lists;
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
	
	public Set<MusicList> getLists() {
		return lists;
	}

/*
	@Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }

        if (obj.getClass() != this.getClass()) {
            return false;
        }

        final Song other = (Song) obj;
  
        if(!this.idTrack.equals(other.idTrack) && !this.idAlbum.equals(other.idAlbum) &&
        		!this.idArtist.equals(other.idArtist) && !this.strTrack.equals(other.idArtist) &&
        		!this.strAlbum.equals(other.strAlbum) && !this.strArtist.equals(other.strArtist) &&
        		!this.intDuration.equals(other.intDuration) && !this.strGenre.equals(other.strGenre) &&
        		!this.intTrackNumber.equals(other.intTrackNumber) && !this.strMusicVid.equals(other.strMusicVid) &&
        		!this.strDescriptionEN.equals(other.strDescriptionEN)) {
        	return false;
        }

        return true;
    }	
*/
}
