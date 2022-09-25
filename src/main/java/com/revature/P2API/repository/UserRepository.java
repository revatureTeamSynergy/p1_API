package com.revature.P2API.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.revature.P2API.repository.models.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{
	

}