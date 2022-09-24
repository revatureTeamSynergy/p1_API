package com.revature.P1API.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.revature.P1API.repository.models.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{
	

}