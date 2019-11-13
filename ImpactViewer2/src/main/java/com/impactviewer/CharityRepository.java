package com.impactviewer;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CharityRepository extends JpaRepository<Charity, Long>{

//	@Query ("SELECT DISTINCT r.charity.charityId, AVG(r.rating) FROM Review r  WHERE r.charity.charityId = ?1 GROUP BY r.charity.charityId") 
	@Query ("SELECT AVG(r.rating) FROM Review r  WHERE r.charity.charityId = ?1 GROUP BY r.charity.charityId")
	Double rateByCharity(Long cId);
//	@Query ("SELECT c FROM Charity c WHERE c.charityName = ?1") 
	Charity findByCharityName(String charityName);
	
	
}
