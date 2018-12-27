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
	case 'Manage Products':
		$('#manageProducts').addClass('active');
		break;
	case 'User Cart':
		$('#userCart').addClass('active');
		break;	
	default:
		if(menu=="Home") break;
		$('#listProducts').addClass('active');
		$('#a_'+menu).addClass('active');
		break;
	}
	
	//to tacke the csrf token
	var token=$('meta[name="_csrf"]').attr('content');
	var header=$('meta[name="_csrf_header"]').attr('content');
	
	if(token.length>0 && header.length>0){
		// set the token header for ajax request
		$(document).ajaxSend(function(e, xhr, options){
			xhr.setRequestHeader(header,token);
		})
		
	}
	
	
	//code for jquery dataTable
	
	var $table=$('#productlistTable');
	
	//execute the below code only where we have this table
	
	if($table.length){
		
		var jsonUrl='';
		if(window.categoryId==''){
			jsonUrl = window.contextRoot +'/json/data/all/products';
		}
		else{
			jsonUrl = window.contextRoot +'/json/data/category/'+window.categoryId+'/products';
		}
		
		$table.DataTable({
			lengthMenu:[[3,5,10,-1],['3 Records','5 Records','10 Records','All Records']],
			pageLength: 5,
			ajax:{
				url: jsonUrl,
				dataSrc:''
				
			},
			columns:[
				
						{
							data: 'code',
							mRender: function(data, type, row){
								return '<img src="'+window.contextRoot+'/resources/images/'+data+'.jpg" class="dataTableImg"/>';
							}
						},
						{
							data: 'name'
						},
						{
							data: 'brand'
						},
						{
							data: 'unitPrice',
							mRender: function(data, type, row){
								
								return data  + ' PLN';
							}
						},
						{
							data: 'quantity',
							mRender: function(data, type, row){
								if(data<1){
									return '<span style="color:red">Out of Stock!</span>';
								}
								return data;
							}
						},
						{
							data: 'id',
							bSortable: false,
							mRender: function(data, type, row){
								var str = '';
								str +='<a href="'+window.contextRoot+'/show/'+data+'/product" class="btn btn-primary"><span class="fas fa-eye"></span></a> &#160;';
								
								if(userRole=='ADMIN'){
									str +='<a href="'+window.contextRoot+'/manage/'+data+'/product" class="btn btn-warning"><span class="fas fa-pencil-alt"></span></a>';
								}
								else{
									if(row.quantity<1){
										str+='<a href="javascript:void(0)" class="btn btn-success disabled"><span class="fa fa-shopping-cart"></span></a>';
									}
									else{
											str +='<a href="'+window.contextRoot+'/cart/add/'+data+'/product" class="btn btn-success"><span class="fa fa-shopping-cart"></span></a>';
										}
								
									}
								
								
								return str;
							}
						}
					]
			
			
			});
		}
	//dismissing alert after 3 seconds
	var $alert = $('.alert');

	if($alert.length){
		setTimeout(function(){
			$alert.fadeOut('slow');
		},4000)
	}
	
	//-----------------
	
	$('.switch input[type="checkbox"]').on('change',function(){
		
		var checkbox = $(this);
		var checked = checkbox.prop('checked');
		var dMsg = (checked)?'You want to activate the product?': 'You want to deactivate the product?';
		var value = checkbox.prop('value');
		
		bootbox.confirm({
			size: 'medium',
			title: 'Product Activation $ Deactivation',
			message: dMsg,
			callback: function(confirmed){
				if(confirmed){
					bootbox.alert({
						size: 'medium',
						title: 'Information',
						message: 'You are going to perform operation on product' + value
					});
				}
				else{
					checkbox.prop('checked', !checked);
				}
			}
		});
	});
	
	//data table for admin
	
var $adminProductsTable=$('#adminProductsTable');
	
	//execute the below code only where we have this table
	
	if($adminProductsTable.length){
		
		var jsonUrl=window.contextRoot+'/json/data/admin/all/products';
		
		
		$adminProductsTable.DataTable({
			lengthMenu:[[10, 30, 50,-1],['10 Records','30 Records','50 Records','All Records']],
			pageLength: 30,
			ajax:{
				url: jsonUrl,
				dataSrc:''
				
			},
			columns:[
						{
							data: 'id'
						},
						{
							data: 'code',
							mRender: function(data, type, row){
								return '<img src="'+window.contextRoot+'/resources/images/'+data+'.jpg" class="adminDataTableimg"/>';
							}
						},
						{
							data: 'name'
						},
						{
							data: 'brand'
						},
						{
							data: 'quantity',
							mRender: function(data, type, row){
								if(data<1){
									return '<span style="color:red">Out of Stock!</span>';
								}
								return data;
							}
						},
						{
							data: 'unitPrice',
							mRender: function(data, type, row){
								
								return data  + ' PLN';
							}
						},
						{
							data: 'active',
							bSortable: false,
							mRender: function(data, type, row){
								
								var str ='';
								
								str += '<label class="switch">';
								if(data){
									str += '<input type="checkbox" checked="checked" value="'+row.id+'"/>';
								}else{
									str += '<input type="checkbox"  value="'+row.id+'"/>';
								}
								str += '<div class="slider round"></div></label>';
								
							 return str;	
							}
						},
						{
							data: 'id',
							bSortable: false,
							mRender: function(data, type, row){
								var str ='';
								
								str += '<a href="'+window.contextRoot+'/manage/'+data+'/product" class="btn btn-warning">';
								str += '<span class="fas fa-pencil-alt"></span></a>';
								
								return str;
							}
						}
					],
					
					initComplete: function(){
						var api = this.api();
						api.$('.switch input[type="checkbox"]').on('change',function(){
							
							var checkbox = $(this);
							var checked = checkbox.prop('checked');
							var dMsg = (checked)?'You want to activate the product?': 'You want to deactivate the product?';
							var value = checkbox.prop('value');
							
							bootbox.confirm({
								size: 'medium',
								title: 'Product Activation or Deactivation',
								message: dMsg,
								closeButton: false,
								callback: function(confirmed){
									if(confirmed){
										
										var activationUrl = window.contextRoot + '/manage/product/' + value + '/activation';
										
										$.post(activationUrl, function(data){
											bootbox.alert({
												size: 'medium',
												title: 'Information',
												closeButton: false,
												message: data
											});
										});
									}
									else{
										checkbox.prop('checked', !checked);
									}
								}
							});
						});
					}
			
			
			});
		}
	
	// validate code for category
	
	var $categoryForm = $('#categoryForm');
	
	if($categoryForm.length){
		
		$categoryForm.validate({
			rules:{
				
				name:{
					required: true,
					minlength: 2
				},
				description:{
					required: true
				}
				
			},
			messages:{
				name:{
					required: 'Please add the category name',
					minlength: 'The category name should not be less than 2 characters'
				},
				description:{
					required: 'Please add a description for this category'
				}
			},
			errorElement: 'em',
			errorPlacement: function(error, element){
				// add the class of help-block
				error.addClass('help-block');
				//add the error element after the input element
				error.insertAfter(element);
			}			
		});
	}
	
	// login validation
var $loginForm = $('#loginForm');
	
	if($loginForm.length){
		
		$loginForm.validate({
			rules:{
				
				username:{
					required: true,
					email: true
				},
				password:{
					required: true
				}
				
			},
			messages:{
				username:{
					required: 'Please enter the user name',
					email: 'Please enter valid email address'
				},
				password:{
					required: 'Please enter the password'
				}
			},
			errorElement: 'em',
			errorPlacement: function(error, element){
				// add the class of help-block
				error.addClass('help-block');
				//add the error element after the input element
				error.insertAfter(element);
			}			
		});
	}
	
});


