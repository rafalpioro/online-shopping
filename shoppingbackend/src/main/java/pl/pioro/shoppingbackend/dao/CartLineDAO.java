package pl.pioro.shoppingbackend.dao;

import java.util.List;

import pl.pioro.shoppingbackend.dto.Cart;
import pl.pioro.shoppingbackend.dto.CartLine;

public interface CartLineDAO {

	public CartLine get(int id);
	public boolean add(CartLine cartLine);
	public boolean update(CartLine cartLine);
	public boolean delete(CartLine cartLine);
	public List<CartLine> list(int cardId);
	
	public List<CartLine> listAvailable(int cartId);
	public CartLine getByCartAndProduct(int cartId, int productId);
	
	// update a cart
	boolean updateCart(Cart cart);

}
