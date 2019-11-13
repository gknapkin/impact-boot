package com.impactviewer;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ReviewRepository extends JpaRepository<Review, Long> {

	@Query ("SELECT r FROM Review r WHERE r.charity.charityId = ?1")
	List<Review>  reviewsByCharity(Long charityId);
	@Query ("SELECT r FROM Review r ORDER BY r.reviewTime DESC")
	List<Review> lastFiveReviews();
	@Query ("DELETE FROM Review r WHERE r.user.userName = ?1 AND r.reviewId = ?2")
	void deleteByNameAndId(String userName, Long reviewId);

}
