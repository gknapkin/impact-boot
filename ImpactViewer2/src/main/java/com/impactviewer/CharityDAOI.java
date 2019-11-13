package com.impactviewer;

import java.util.Set;


public interface CharityDAOI {


		boolean newCharity(Charity charity);

		Charity findCharityByName(String charityName);

		Double rateByCharity(Charity charity);

		Charity findCharityById(Long charityId);
		
		Set<Charity> findAllCharities();

		String editCharity(Charity charity);

	}
