package com.impactviewer;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserRepository extends JpaRepository<User, Long> {

	@Query ("SELECT DISTINCT u FROM User u WHERE u.userName = ?1 AND u.userPassword = ?2") 
	User verify(String name, String pass);
	@Query ("SELECT DISTINCT u FROM User u WHERE u.userEmail = ?1 AND u.userPassword = ?2") 
	User verifyE(String email, String pass);
	@Query ("SELECT r FROM Review r WHERE r.user.userId = ?1")
    List <Review> reviewsById(Long id);

	
	
}
