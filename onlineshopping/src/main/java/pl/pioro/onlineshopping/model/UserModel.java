package pl.pioro.onlineshopping.model;

import java.io.Serializable;

import pl.pioro.shoppingbackend.dto.Cart;

public class UserModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int id;
	private String fullName;
	private String emial;
	private String role;
	private Cart cart;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getEmial() {
		return emial;
	}
	public void setEmial(String emial) {
		this.emial = emial;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
	@Override
	public String toString() {
		return "UserModel [id=" + id + ", fullName=" + fullName + ", emial=" + emial + ", role=" + role + ", cart="
				+ cart + "]";
	}
	
	
}
