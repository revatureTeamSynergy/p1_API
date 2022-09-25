package com.revature.P1API.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.revature.P1API.repository.MusicListRepository;
import com.revature.P1API.repository.models.MusicList;

@Service
public class MusicListService {
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
			throw new IllegalStateException("No list with this id: "+ id);
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