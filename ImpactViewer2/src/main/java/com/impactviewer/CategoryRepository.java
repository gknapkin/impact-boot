package com.impactviewer;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CategoryRepository extends JpaRepository<Category, Integer>
{
	@Query ("SELECT c FROM Category c ORDER BY c.catName ASC") 
	Set<Category> findAllCategories();
	@Query ("SELECT c FROM Category c WHERE c.catName = ?1")
	Category findCatByName(String catName);
	@Query ("SELECT c.charity FROM Category c WHERE c.catId = ?1")
	List<Charity> allCharitiesInCat(int catId);

	

}
