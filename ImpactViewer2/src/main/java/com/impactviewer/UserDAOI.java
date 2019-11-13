package com.impactviewer;

public interface UserDAOI {

	boolean newUser(User user);

	boolean editUser(User user);

	boolean credCheck(String username, String password);

	//boolean removeUser(User user);
	
//	User findUserByName(String userName);
	
	
	
	
	
}
