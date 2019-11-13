package com.impactviewer;

import java.util.List;
import java.util.Set;


public interface CategoryDAOI {

	boolean newCategory(Category category);

	List<Category> getAllCategories();

	Category findCategoryById(int id);

	boolean editCategory(Category category);

	Set<Charity> getCharitiesByCat(int catId);

	Category findCategoryByName(String catName);


}
