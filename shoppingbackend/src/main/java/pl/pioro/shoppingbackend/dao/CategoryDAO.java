package pl.pioro.shoppingbackend.dao;

import java.util.List;

import pl.pioro.shoppingbackend.dto.Category;

public interface CategoryDAO {

	List<Category> list();
	Category get(int id);
		
}
