package com.impactviewer;

import java.util.*;

import javax.persistence.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CategoryService implements CategoryDAOI {

	@Autowired
	private CategoryRepository categoryRepository;

	@Override
	public boolean newCategory(Category category) {
		boolean result = false;
		try {
			categoryRepository.save(category);
			result = true;
		} catch (PersistenceException e) {
			System.out.println(e.getMessage());
		} finally {

		}
		return result;
	}

	@Override
	public List<Category> getAllCategories() {
		ArrayList<Category> catList = null;
		try {
			List<Category> tempList = categoryRepository.findAll();
			if (tempList != null) {
				catList = new ArrayList<Category>(tempList);
			}
		} catch (PersistenceException e) {
			System.out.println(e.getMessage());
		} finally {

		}
		return catList;
	}

	@Override
	public Set<Charity> getCharitiesByCat(int catId) {
		HashSet<Charity> catSet = null;
		try {
			List<Charity> tempList = categoryRepository.allCharitiesInCat(catId);
			if (tempList != null) {
				catSet = new HashSet<Charity>(tempList);
			}
		} catch (PersistenceException e) {
			System.out.println(e.getMessage());
		} finally {

		}
		return catSet;
	}

	@Override
	public Category findCategoryById(int id) {
		Category foundCategory = null;

		try {
			foundCategory = categoryRepository.getOne((Integer) id);
		} catch (PersistenceException e) {
			System.out.println(e.getMessage());
		} finally {

		}

		return foundCategory;
	}

	@Override
	public boolean editCategory(Category category) {
		boolean result = false;
		
		try {
			
			Category foundCategory = categoryRepository.getOne(category.getCatId());
			foundCategory.setCatName(category.getCatName());
			categoryRepository.save(category);
			
		} catch (PersistenceException e) {
			System.out.println(e.getMessage());
		} finally {
		}	
		return result;
	}

	@Override
	public Category findCategoryByName(String catName) {
		Category foundCategory = null;
		
		try {
			foundCategory = categoryRepository.findCatByName(catName);
		}catch (PersistenceException e) {
			System.out.println(e.getMessage());
		}finally {

		}
			
		return foundCategory;	
	}

}
