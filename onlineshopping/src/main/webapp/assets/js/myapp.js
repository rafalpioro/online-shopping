$(function(){
	
	switch(menu){
	
	case 'All Products':
		$('#listProducts').addClass('active');
		break;
	case 'About Us':
		$('#about').addClass('active');
		break;
	case 'Contact Us':
		$('#contact').addClass('active');
		break;	
	default:
		$('#listProducts').addClass('active');
		$('#a_'+menu).addClass('active');
		break;
	}
	
});