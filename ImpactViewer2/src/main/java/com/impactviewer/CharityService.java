package com.impactviewer;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CharityService implements CharityDAOI {

	@Autowired
	private CharityRepository charityRepository;
	
	@Override
	public boolean newCharity(Charity charity) {
		boolean result = false;
		try {
			charityRepository.save(charity);
			result = true;
		} catch (PersistenceException e) {
			System.out.println(e.getMessage());
		} finally {
			
		}
		return result;
	}


	@Override
	public Charity findCharityByName(String charityName) {
		Charity foundCharity = null;

		try {
			foundCharity = charityRepository.findByCharityName(charityName);
		} catch (PersistenceException e) {
			System.out.println(e.getMessage());
		} finally {

		}
		return foundCharity;
	}

	@Override
	public Double rateByCharity(Charity charity) {
		Double returnRating = 0.0;

		try {
//			List<Object[]> tempList = query.getResultList();
//
//			for (Object[] e : tempList) {
//				returnRating = (double) e[1];
//			}
			returnRating = charityRepository.rateByCharity(charity.getCharityId());
		} catch (PersistenceException e) {
			System.out.println(e.getMessage());

		} finally {

		}

		return returnRating;
	}

	@Override
	public Charity findCharityById(Long charityId) {
		Charity foundCharity = null;

		try {
			foundCharity = charityRepository.getOne(charityId);
		} catch (PersistenceException e) {
			System.out.println(e.getMessage());
		} finally {

		}

		return foundCharity;
	}

	@Override
	public Set<Charity> findAllCharities() {
		Set<Charity> charitySet = null;

		try {
			
			List<Charity> tempList = charityRepository.findAll();
			
			charitySet = new HashSet<Charity>(tempList);
		
		} catch (PersistenceException e) {
			System.out.println(e.getMessage());

		} finally {

		}

		return charitySet;
	}

	@Override
	public String editCharity(Charity charity) {
		String message = null;

		try {
		Charity foundCharity = charityRepository.getOne(charity.getCharityId());
		foundCharity.setCategory(charity.getCategory());
		foundCharity.setCharityName(charity.getCharityName());
		foundCharity.setCharityImpact(charity.getCharityImpact());
		foundCharity.setCharityWeb(charity.getCharityWeb());
		message = "success";
		} catch (PersistenceException e) {
			System.out.println(e.getMessage());
			message="fail";

		} finally {


		}
		
		return message;
	}


}
