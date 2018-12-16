package pl.pioro.shoppingbackend.dao;

import java.util.List;

import pl.pioro.shoppingbackend.dto.Address;
import pl.pioro.shoppingbackend.dto.Cart;
import pl.pioro.shoppingbackend.dto.User;

public interface UserDAO {
	
	//add an user
	boolean addUser(User user);
	User getByEmail(String email);
	
	//add an address
	boolean addAddress(Address address);
	//alternative 
	//Address getBillingAddress(int userId);
	//List<Address> listShippingAddress(int userId);
	
	Address getBillingAddress(User user);
	List<Address> listShippingAddress(User user);
	
	// update a cart
	boolean updateCart(Cart cart);

}
