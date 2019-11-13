package com.impactviewer.starter;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import com.impactviewer.Category;
import com.impactviewer.CategoryService;
import com.impactviewer.Charity;
import com.impactviewer.CharityService;
import com.impactviewer.Review;
import com.impactviewer.ReviewService;
import com.impactviewer.User;
import com.impactviewer.UserService;


public class Mainrunner {

	public static void main(String[] args) {
		System.out.println(createCategory("Animal", "Who doesn't love animals? This category includes - Animal Rights, Welfare, and Services/Wildlife Conservation/Zoos and Aquariums"));
		System.out.println(createCategory("Environmental", "Environmental Charities focus on ways to promote preservation, appreciation, and sustainable development for the environment. "));
		System.out.println(createCategory("International NGOs", "International NGOs (Non-governmental organizations) are typically charities that are headquartered in one country but work in other countries. "));
		System.out.println(createCategory("Health", "Health charities cover everything from supporting and treating the sick and disabled, working on cures for deseases, and promoting public awareness of specific health risks."));
		System.out.println(createCategory("Education", "Education charities serve students from every age group, pre-school to graduate school and beyond."));
		System.out.println(createCategory("Arts & Culture", "These types of charities help preserve artistic and cultural heritage as well as celebrate the arts and our history."));
//findCatByName();
	//	findAllCategories();
//		Category cat = findCategorybyId(1);
//		System.out.println(createCharity("Char1", cat , "Big Impact"));
//		System.out.println(createCharity("Char2", cat , "B Impact"));
//		System.out.println(createCharity("Char3", cat , "Big pact"));
//		findAllCharitiesByCat();
//		cat.setCatId(2);
//		System.out.println(createCharity("Char2", cat , "Big Impact2"));
//		System.out.println(createCharity("Char4", cat , "Big Impact4"));
//		Charity chari = new Charity();
//		chari.setCharityId(2);
//		User us = new User();
//		us.setUserId(7);
//		System.out.println(createReview(us, chari, "Good charity", 4));
//		allCharitiesWithRatings();
		
//		User newUser1 = new User();
//		newUser1.setUserId(1);
//		newUser1.setUserEmail("gknapik@gmail.com");
//		newUser1.setUserPassword("thisisnewpass");
//		newUser1.setUserName("gmoney");
//		
//		System.out.println(editUser(newUser1));
//		System.out.println(verifyUser("gmoney","thisisnewpass"));
		

	}
	
	//Check if user exists (verify username and password)
	public static String verifyUser(String name, String password) {
		String message = "";
		
		UserService uS = new UserService();
		
		if(uS.credCheck(name, password)) {
			message = "Found and Verified";
		}else {
			message = "Failed! Something was incorrect";
		}
		
		
		
		return message;
		
	}
	
//	Takes three string parameters and attempts to create user into database. Will return success or failure message as string	
	public static String createUser(String name, String pass, String email) {	
		String message;
		UserService uS = new UserService();		
		User user = new User(name, pass, email);	
		if (uS.newUser(user)) {
			message = "Successfully created new user: "+ user.getUserName();
		}else {
			message = "Failed to add new user";
		}		
		return message;		
	}
	
	//Edit user
	public static String editUser(User user) {
		String message = "";
		UserService uS = new UserService();
		
		if (uS.editUser(user)) {
			message = "Success";
		}else {
			message = "fail";
		}
		
		return message;
		
	}
	
	
	//Create Charity
//	public static String createCharity(String name, Category cat, String impact, String web) {	
//		String message;
//		CharityService cS = new CharityService();
//		Charity charity = new Charity(name, cat, impact, web);	
//		if (cS.newCharity(charity)) {
//			message = "Successfully created new charity: "+ charity.getCharityName();
//		}else {
//			message = "Failed to add new charity";
//		}		
//		return message;		
//	}
	
	public static void findCatByName() {
		CategoryService catS = new CategoryService();
		System.out.println(catS.findCategoryByName("Animal").toString());
	}
	
	
	//Find all Categories - needed to populate user selection, can also be used for creating new charity (drop down)
	public static void findAllCategories() {	
		CategoryService catS = new CategoryService();
		List<Category> catSet = catS.getAllCategories();	
		for (Category e: catSet) {
			System.out.println(e.toString());
		}
	}
	
	
	//Show all charities associated with category...
	public static void findAllCharitiesByCat() {
		CategoryService catS = new CategoryService();
		Set<Charity> charityList = catS.getCharitiesByCat(1);
		for (Charity c : charityList) {
			System.out.println(c.toString());
		}
	}
	
	
	
	
//	//Find Charity by id
//	public static Charity findCharitybyId(long id) {
//		Charity tempCharity = new Charity();
//		tempCharity.setCharityId(id);
//		CharityService cS = new CharityService();			
//		Charity foundCharity = cS.findCharity(tempCharity);		
//		return foundCharity;
//		
//	}
	
	//find category by ID
	public static Category findCategorybyId(int id) {
		Category foundCategory = null;
		CategoryService catS = new CategoryService();			
		foundCategory = catS.findCategoryById(id);	
		return foundCategory;
	}
	
	
	//Create Review
	
	public static String createReview(User user, Charity charity, String comment, int rating) {
		String message;
		ReviewService rS = new ReviewService();
		Review review = new Review(user, charity, comment, rating);
		if (rS.newReview(review)) {
			message = "Successfully created new review: "+ review.getCharity()+" "+review.getRating();
		}else {
			message = "Failed to leave review";
		}
		return message;
	}
	
	
//Show all charities charity+ associated rating... 
	
	
//	void allCharitiesWithRatings(){
//		CharityService cS = new CharityService();
////		HashMap<String, String> hM =
//		HashMap<Charity, Double> hM = cS.charityRating();
////		System.out.println(hM.values());
//		
//		 for (Map.Entry mapElement : hM.entrySet()) { 
//	            Charity key = (Charity)mapElement.getKey(); 
//	            Double value = (Double)mapElement.getValue(); 
//	  
//	            System.out.println(key.getCharityName() + " : " + value); 
//		 }
	
	
	
	
	
	
	
	//Show charity by... 
	
	
	
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	//For Admin User - create categories
	public static String createCategory(String name, String desc) {
		String message;
		CategoryService catS = new CategoryService();
		Category category = new Category(name, desc);
		if (catS.newCategory(category)) {
			message = "Successfully created new category: "+ category.getCatName();
		}else {
			message = "Failed to add new category";
		}
		return message;
	}
	
	// editCategory
	
	public static String editCategory(Category category) {
		String message;
		CategoryService catS = new CategoryService();
		
		if (catS.editCategory(category)) {
			message = "Successfully edited category";
		}else {
			message = "Failed to edit category";
		}
		
		
		
		return message;
		
	}
	
	

}
