package com.impactviewer;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long userId;

	@Basic
	@Column(unique = true, nullable = false)
	private String userName;

	@Basic
	@Column(nullable = false)
	private String userPassword;

	@Basic
	@Column(unique = true, nullable = false)
	private String userEmail;

	@Basic
	@Column(name = "JoinDate")
	@Temporal(TemporalType.DATE)
	private Date joinDate;

	@OneToOne(mappedBy = "refUser")
	private Charity charity;

	public long getUserId() {
		return userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public User(String userName, String userPassword, String userEmail) {
		super();
		this.userName = userName;
		this.userPassword = userPassword;
		this.userEmail = userEmail;

		this.joinDate = new Date();
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	// Extra method for formatted join date to be more aesthetically pleasing - no
	// time, just date
	public String getJoinDateFormatted() {
		String s;

		Format formatter = new SimpleDateFormat("MM/dd/yyyy");

		s = formatter.format(joinDate);

		return s;

	}

}
