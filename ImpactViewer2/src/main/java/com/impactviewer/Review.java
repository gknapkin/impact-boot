package com.impactviewer;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table
public class Review {
	@Id @GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long reviewId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId")
	private User user;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "charityId")
	private Charity charity;

	
	@Basic
	private String comment;
	
	@Basic
	private int rating;
	
	@Basic
	@Column(name="reviewTime")
	@Temporal(TemporalType.TIMESTAMP)
	private Date reviewTime;

	public Long getReviewId() {
		return reviewId;
	}

	public void setReviewId(Long reviewId) {
		this.reviewId = reviewId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Charity getCharity() {
		return charity;
	}

	public void setCharity(Charity charity) {
		this.charity = charity;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public Date getReviewTime() {
		return reviewTime;
	}

	public void setReviewTime(Date reviewTime) {
		this.reviewTime = reviewTime;
	}

	public Review(User user, Charity charity, String comment, int rating) {
		super();
		this.user = user;
		this.charity = charity;
		this.comment = comment;
		this.rating = rating;
		this.reviewTime = new Date();
	}

	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}

	//Review Date only - still shows time, but without seconds etc.
	public String getReviewDateFormatted() {
		String s;

		Format formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm");

		s = formatter.format(reviewTime);

		return s;

	}
	
	
	@Override
	public String toString() {
		return "Review [reviewId=" + reviewId + ", user=" + user + ", charity=" + charity + ", comment=" + comment
				+ ", rating=" + rating + ", reviewTime=" + reviewTime + "]";
	}

	
}
