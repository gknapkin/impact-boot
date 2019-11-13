package com.impactviewer;

import java.util.List;

public interface ReviewDAOI {

	boolean newReview(Review review);

	List<Review> reviewsByCharity(long charityId);

	List<Review> lastFiveReviews();

	String deleteByUserNameAndId(String userName, Long reviewId);

}