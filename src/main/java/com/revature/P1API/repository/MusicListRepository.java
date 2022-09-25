package com.revature.P1API.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.revature.P1API.repository.models.MusicList;

@Repository
public interface MusicListRepository extends JpaRepository<MusicList, Long>{
	
}