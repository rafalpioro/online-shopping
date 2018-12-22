package pl.pioro.shoppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import pl.pioro.shoppingbackend.dao.CartLineDAO;
import pl.pioro.shoppingbackend.dao.ProductDAO;
import pl.pioro.shoppingbackend.dao.UserDAO;
import pl.pioro.shoppingbackend.dto.Cart;
import pl.pioro.shoppingbackend.dto.CartLine;
import pl.pioro.shoppingbackend.dto.Product;
import pl.pioro.shoppingbackend.dto.User;

public class CartLineTestCase {
	
	private static AnnotationConfigApplicationContext context;
	
	private static CartLineDAO cartLineDAO = null;
	private static ProductDAO productDAO = null;
	private static UserDAO userDAO = null;
	
	private Product product = null;
	private User user = null;
	private Cart cart = null;
	private CartLine cartLine = null;
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("pl.pioro.shoppingbackend");
		context.refresh();
		productDAO = (ProductDAO)context.getBean("productDAO");
		userDAO = (UserDAO)context.getBean("userDAO");
		cartLineDAO = (CartLineDAO)context.getBean("cartLineDAO");
	}
	
	@Test
	public void testAddNewCartLine() {
		//1. get the user
		user = userDAO.getByEmail("tg2@o2.pl");
		
		//2. fetch the cart
		cart = user.getCart();
		
		//3. get the product
		product = productDAO.get(5);
		
		//4. crate a new cartline
		cartLine = new CartLine();
		
		cartLine.setBuyingPrice(product.getUnitPrice());
		cartLine.setProductCount(cartLine.getProductCount()+1);
		cartLine.setTotal(cartLine.getProductCount()*product.getUnitPrice());
		cartLine.setAvailable(true);
		cartLine.setCartId(cart.getId());
		
		cartLine.setProduct(product);
		
		assertEquals("Faild to add the cartLine", true, cartLineDAO.add(cartLine));
		
		//update the cart
		cart.setGrandTotal(cart.getGrandTotal()+cartLine.getTotal());
		cart.setCartLines(cart.getCartLines()+1);
		
		assertEquals("Faild to update the cart", true, cartLineDAO.updateCart(cart));
	}
	
}
