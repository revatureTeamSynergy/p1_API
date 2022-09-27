package com.revature.P2API.models;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import com.revature.P2API.models.Song;

import javax.persistence.JoinColumn;

@Entity
public class MusicList {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private long id;
	private String name;
	
	@ManyToMany
	@JoinTable(
			name="list_song",
			joinColumns = @JoinColumn(name="list_id"),
			inverseJoinColumns = @JoinColumn(name="song_id")		
	)
    private Set<Song> songs;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="user_id", referencedColumnName="id")
	private User user;
	

	public MusicList() {
		super();
	}

	public MusicList(String name) {
		super();
		this.name = name;
	}

	public MusicList(long id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
	

	public MusicList(String name, Set<Song> songs, User user) {
		super();
		this.name = name;
		this.songs = songs;
		this.user = user;
	}

	public MusicList(String name, User user) {
		super();
		this.name = name;
		this.user = user;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Set<Song> getSongs() {
		return songs;
	}

	/*
	public void setSongs(Set<Song> songs) {
		this.songs = songs;
	}
	*/
	
	public void addSong(Song song) {
		songs.add(song);
	}
	
	public User getUser() {
		return user;
	}

	/*
	public void setUser(User user) {
		this.user = user;
	}*/
	
	
	public void addUser(User user) {
		this.user = user;
	}
	

	@Override
	public String toString() {
		return "List [id=" + id + ", name=" + name + "]";
	}	
	
}
