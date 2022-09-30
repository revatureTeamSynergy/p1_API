package com.revature.P2API.service;

import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.revature.P2API.repository.MusicListRepository;
import com.revature.P2API.controller.AlbumController;
import com.revature.P2API.models.MusicList;

@Service
public class MusicListService {
	Logger logger = LoggerFactory.getLogger(MusicListService.class);
	
	final private MusicListRepository listRepository;

	@Autowired
	public MusicListService(MusicListRepository listRepository) {
		super();
		this.listRepository = listRepository;
	}
	
	public void createList(MusicList list) {
		listRepository.save(list);
	}
	
	public MusicList getListById(long id) {
		Optional<MusicList> list = listRepository.findById(id);
		if(!list.isPresent()) {
			logger.error("Unable to get list by id");
			throw new IllegalStateException("No list with this id: "+ id);
		}
		return list.get();
	}
	
	public MusicList getListByName(String name) {
		Optional<MusicList> list = listRepository.findByName(name);
		if(!list.isPresent()) {
			logger.error("Unable to get list by id");
			throw new IllegalStateException("No list with this id: "+ name);
		}
		return list.get();
	}
	
	public MusicList saveList(MusicList list) {
		return listRepository.save(list);
	}
	
	
	public List<MusicList> getlists() {
		return listRepository.findAll();
	}
	
}