package com.impactviewer;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class ReviewService implements ReviewDAOI {
	
	@Autowired
	private ReviewRepository reviewRepository;
	//Persists new review into the database
	@Override
	public boolean newReview(Review review) {
		boolean result = false;		

		try {
			reviewRepository.save(review);
			result = true;
		}catch (PersistenceException e){
			System.out.println(e.getMessage());
		}finally {
			
		}	
		return result;	
	}
	
	//Returns all reviews associated with a charity - used on charity profile page
	@Override
	public List<Review> reviewsByCharity(long charityId){
		ArrayList <Review> reviewList = null;
		
		try {		
		List<Review>tempList = reviewRepository.reviewsByCharity(charityId);	
		reviewList = new ArrayList<Review>(tempList);
						
		}catch(PersistenceException e) {
			System.out.println(e.getMessage());
		}finally {

		}
		
		return reviewList;
		
	}

	//Returns last (5) reviews persisted into the database - used for main index view.
	@Override
	public ArrayList<Review> lastFiveReviews() {
		ArrayList <Review> reviewList = null;
		
		try {
//			List <Review> tempList = reviewRepository.lastFiveReviews();
//			reviewList = new ArrayList<Review>();
//			for (int i=0; i<5; i++) {
//				reviewList.add(tempList.get(i));
//			}
			reviewList =  (ArrayList<Review>) reviewRepository.lastFiveReviews();
			
		}catch (PersistenceException e) {
			System.out.println(e.getMessage());
		}finally {
			System.out.println("failedddd");
		}
		return reviewList;
	}
	
	//Delete select review - needs both review ID and the user associated with review (for messaging) {kind of unnecessary}
	@Override
	public String deleteByUserNameAndId(String userName, Long reviewId) {
		String message = null;

		
		
		try {
			  reviewRepository.deleteById(reviewId);
			message = "Review deleted for "+userName;
			
			
		}catch (PersistenceException e) {
			message = e.getMessage() + " Failed";
		}finally {
		}
	
		return message;
	}

}
