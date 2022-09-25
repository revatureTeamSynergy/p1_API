package com.revature.P2API.repository.models;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Song {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private long id;
	private String name;
	
	@JsonIgnore
	@ManyToMany(mappedBy="songs")
    private Set<MusicList> lists;
	
	
	public Song() {
		super();
	}

	public Song(String name) {
		super();
		this.name = name;
	}

	public Song(long id, String name) {
		super();
		this.id = id;
		this.name = name;
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
	
	public Set<MusicList> getLists() {
		return lists;
	}

	/*
	public void setLists(Set<List> lists) {
		this.lists = lists;
	}
	*/
	
	@Override
	public String toString() {
		return "Song [id=" + id + ", name=" + name + "]";
	}
	
	
}