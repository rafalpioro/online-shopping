

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

<div class="container">

	<c:if test="${not empty message}">
		<div class="alert alert-info">
			<h3 class="text-center">
				${message}
			</h3>
		</div>
	</c:if>
		
	<c:choose>
		<c:when test="${not empty cartLines}">
		<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th style="width:50%">Product</th>
							<th style="width:10%">Price</th>
							<th style="width:8%">Quantity</th>
							<th style="width:22%" class="text-center">Subtotal</th>
							<th style="width:10%"></th>
						</tr>
					</thead>
					<tbody>
					
					<c:forEach items="${cartLines}" var="cartLine">
						<tr>
							<td data-th="Product">
								<div class="row">
									<div class="col-md-3 hidden-sm"><img src="${images}/${cartLine.product.code}.jpg" alt="${cartLine.product.name}" class="img-responsive cartImg"/></div>
									<div class="col-md-9">
										<h4 class="nomargin">${cartLine.product.name}</h4>
										
											<c:if test="${cartLine.available==false}">
												<strong class="unavailable">(Not Available)</strong>
											</c:if>
										<p>Brand - ${cartLine.product.brand}</p>
										<p>Description - ${cartLine.product.description}</p>
									</div>
								</div>
							</td>
							<td data-th="Price"> ${cartLine.buyingPrice} PLN</td>
							<td data-th="Quantity">
								<input type="number" id="count_${cartLine.id}" min="1" max="3" class="form-control text-center" value="${cartLine.productCount}">
							</td>
							<td data-th="Subtotal" class="text-center">${cartLine.total} PLN</td>
							<td class="actions" data-th="">
								<button type="button" name="refreshCart" value="${cartLine.id}" class="btn btn-info btn-md"><i class="fa fa-refresh"></i></button>
								<a href="${contextRoot}/cart/${cartLine.id}/delete" class="btn btn-danger btn-md"><i class="fa fa-trash-o"></i></a>								
							</td>
						</tr>
					</c:forEach>
						
					</tbody>
					<tfoot>
						<tr class="visible-xs">
							<td class="text-center"><strong>Total ${userModel.cart.grandTotal} PLN</strong></td>
						</tr>
						<tr>
							<td><a href="${contextRoot}/show/all/products" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
							<td colspan="2" class="hidden-sm"></td>
							<td class="hidden-xs text-center"><strong>${userModel.cart.grandTotal} PLN</strong></td>
							<td><a href="#" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>
						</tr>
					</tfoot>
				</table>
		</c:when>
		<c:otherwise>
			<div class="jumbotron">
				<div class="text-center">
					<h1>Your cart is empty! </h1>
				</div>
			</div>
		</c:otherwise>
	</c:choose>


	
</div>