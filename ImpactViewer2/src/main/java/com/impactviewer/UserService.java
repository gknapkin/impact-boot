package com.impactviewer;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserService implements UserDAOI {

	@Autowired
	private UserRepository userRepository;

	@Override // Service Method that adds a new user to the database, takes input of user and
				// returns boolean to verify if transaction succeeded
	public boolean newUser(User user) {
		boolean result = false;
		if (user.getUserName().isEmpty() || user.getUserName().isEmpty() || user.getUserPassword().isEmpty()
				|| user.getUserName().contains(" ")) {
			return result;
		}

		Date now = new Date();
		user.setJoinDate(now);
		try {
			userRepository.save(user);
			result = true;
		} catch (PersistenceException e) {
			System.out.println(e.getMessage());
		} finally {

		}
		return result;
	}

	// Only assumption is that user id is constant
	@Override
	public boolean editUser(User user) {
		boolean result = false;

		try {
			User tempUser = userRepository.getOne(user.getUserId());
			tempUser.setUserEmail(user.getUserEmail());
			tempUser.setUserName(user.getUserName());
			tempUser.setUserPassword(user.getUserPassword());
			userRepository.save(user);
			result = true;
		} catch (PersistenceException e) {
			System.out.println(e.getMessage());
		} finally {

		}
		return result;

	}

	// Only checks for credentials
	@Override
	public boolean credCheck(String username, String password) {
		boolean result = false;
		User resultV = null;

		try {
			if (username.contains("@") && username.contains(".")) {
				resultV = userRepository.verifyE(username, password);
			} else {
				resultV = userRepository.verify(username, password);
			}

			if (resultV== null) {
				result = false;
			} else {
				result = true;
			}
		} catch (PersistenceException e) {
			System.out.println(e.getMessage());
		} finally {

		}
		return result;
	}

	// Same thing as credentials - but returns user (can do for both email and
	// username)
	public User findUser(String userInput, String password) {
		User user = null;

		try {
			if (userInput.contains("@") && userInput.contains(".")) {
				user = userRepository.verifyE(userInput, password);
			} else {
				user = userRepository.verify(userInput, password);
			}
		} catch (PersistenceException e) {
			System.out.println(e.getMessage());
		} finally {

		}
		return user;
	}

	// Returns all reviews by timestamp associated with this user
	public ArrayList<Review> reviewsByUserId(Long userId) {
		ArrayList<Review> reviewList = null;

		try {
			List<Review> tempList = userRepository.reviewsById(userId);
			reviewList = new ArrayList(tempList);

		} catch (PersistenceException e) {
			System.out.println(e.getMessage());
		} finally {

		}

		return reviewList;
	}

}
