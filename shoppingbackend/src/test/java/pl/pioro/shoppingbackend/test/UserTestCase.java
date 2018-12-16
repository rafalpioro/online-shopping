package pl.pioro.shoppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import pl.pioro.shoppingbackend.dao.UserDAO;
import pl.pioro.shoppingbackend.dto.Address;
import pl.pioro.shoppingbackend.dto.Cart;
import pl.pioro.shoppingbackend.dto.User;

public class UserTestCase {

	private static AnnotationConfigApplicationContext context;
	private static UserDAO userDAO;
	private User user = null;
	private Cart cart = null;
	private Address address = null;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("pl.pioro.shoppingbackend");
		context.refresh();

		userDAO = (UserDAO) context.getBean("userDAO");
	}

	// @Test
	/*
	 * public void testAdd() {
	 * 
	 * user= new User(); user.setFirstName("Raf"); user.setLastName("Pio");
	 * user.setEmail("raf.pio@gmial.com"); user.setContactNumber("123456789");
	 * user.setRole("USER"); user.setPassword("123456");
	 * 
	 * //add the user; assertEquals("Failed to add User!", true,
	 * userDAO.addUser(user));
	 * 
	 * address = new Address(); address.setAddressLineOne(" Grunwaldzka 606/c/22");
	 * address.setAddressLineTwo("wejscie od Hutniczej"); address.setCity("Gdańsk");
	 * address.setState("Pomorskie"); address.setCountry("Poland");
	 * address.setPostalCode("80-337"); address.setBilling(true);
	 * 
	 * //link the user with the address using user id
	 * address.setUserId(user.getId());
	 * 
	 * //add the address assertEquals("Failed to add Address!", true,
	 * userDAO.addAddress(address));
	 * 
	 * if(user.getRole().equals("USER")) { // create a cart for this user cart = new
	 * Cart(); cart.setUser(user);
	 * 
	 * //add the cart assertEquals("Failed to add Cart!", true,
	 * userDAO.addCart(cart));
	 * 
	 * //add a shipping addres for this user address = new Address();
	 * address.setAddressLineOne(" Pomorska 3 ");
	 * address.setAddressLineTwo("obok Biedronki"); address.setCity("Gdynia");
	 * address.setState("Pomorskie"); address.setCountry("Poland");
	 * address.setPostalCode("81-219"); //set shipping to true
	 * address.setShipping(true);
	 * 
	 * //link it whit the user
	 * 
	 * address.setUserId(user.getId());
	 * 
	 * //add the shipping address assertEquals("Failed to add Shipping address!",
	 * true, userDAO.addAddress(address)); } }
	 */

	/*
	 * @Test public void testAdd() {
	 * 
	 * user= new User(); user.setFirstName("Raf"); user.setLastName("Pio");
	 * user.setEmail("raf.pio@gmial.com"); user.setContactNumber("123456789");
	 * user.setRole("USER"); user.setPassword("123456");
	 * 
	 * if(user.getRole().equals("USER")) { // create a cart for this user cart = new
	 * Cart(); cart.setUser(user);
	 * 
	 * //attach cart with the user user.setCart(cart);
	 * 
	 * } //add the user; assertEquals("Failed to add User!", true,
	 * userDAO.addUser(user));
	 * 
	 * }
	 */

	/*
	 * @Test public void testUpdateCart() { // fetch the user by email
	 * user=userDAO.getByEmail("raf.pio@gmial.com");
	 * 
	 * //get the cart of the user cart = user.getCart();
	 * 
	 * cart.setGrandTotal(4454); cart.setCartLines(2);
	 * 
	 * assertEquals("Failed to update the Cart!", true, userDAO.updateCart(cart)); }
	 */

	/*
	 * @Test public void testAddAddress() { // add an user user = new User();
	 * user.setFirstName("Raf"); user.setLastName("Pio");
	 * user.setEmail("raf.pio@gmial.com"); user.setContactNumber("123456789");
	 * user.setRole("USER"); user.setPassword("123456");
	 * 
	 * assertEquals("Failed to add User!", true, userDAO.addUser(user));
	 * 
	 * // add address address = new Address();
	 * address.setAddressLineOne(" Grunwaldzka 606/c/22");
	 * address.setAddressLineTwo("wejscie od Hutniczej"); address.setCity("Gdańsk");
	 * address.setState("Pomorskie"); address.setCountry("Poland");
	 * address.setPostalCode("80-337"); address.setBilling(true); // add the
	 * shipping address
	 * 
	 * // attached the user to the address address.setUser(user);
	 * 
	 * assertEquals("Failed to add address!", true, userDAO.addAddress(address));
	 * 
	 * // add a shipping addres for this user address = new Address();
	 * address.setAddressLineOne(" Pomorska 3 ");
	 * address.setAddressLineTwo("obok Biedronki"); address.setCity("Gdynia");
	 * address.setState("Pomorskie"); address.setCountry("Poland");
	 * address.setPostalCode("81-219"); // set shipping to true
	 * address.setShipping(true);
	 * 
	 * address.setUser(user);
	 * 
	 * assertEquals("Failed to add  shipping address!", true,
	 * userDAO.addAddress(address));
	 * 
	 * }
	 */

	/*@Test
	public void testAddAddress() {

		user = userDAO.getByEmail("raf.pio@gmial.com");

		// add a shipping addres for this user
		address = new Address();
		address.setAddressLineOne("Górlaska 3 ");
		address.setAddressLineTwo("obok Lidla");
		address.setCity("Sopot");
		address.setState("Pomorskie");
		address.setCountry("Poland");
		address.setPostalCode("83-128");
		// set shipping to true
		address.setShipping(true);

		address.setUser(user);

		assertEquals("Failed to add  shipping address!", true, userDAO.addAddress(address));

	}*/
	
	@Test
	public void testGetAddresses() {
		
		user = userDAO.getByEmail("raf.pio@gmial.com");
		
		assertEquals("Failed to fetch the list of addresses and size does not match", 2, userDAO.listShippingAddress(user).size());
		
		assertEquals("Failed to fetch the list of billing addresses and size does not match", "Gdańsk", userDAO.getBillingAddress(user).getCity());
	}

}
