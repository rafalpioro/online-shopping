<div class="container">

	<!-- Breadcrumb -->
	<div class="row">

		<div class="col-xs-12">
			<ol class="breadcrumb">

				<li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
				<li class="breadcrumb-item"><a
					href="${contextRoot}/show/all/products">Products</a></li>
				<li class="breadcrumb-item active">${product.name}</li>

			</ol>


		</div>

	</div>

	<div class="row">

		<!-- Display the product image -->
		<div class="col-lg-4">

			<div class="thumbnail">

				<img src="${images}/${product.code}.jpg" class="img-thumbnail" />

			</div>

		</div>
		<!-- Display the product description -->
		<div class="col-lg-8">

			<h3>${product.name}</h3>

			<p>${product.description}</p>
			<hr />

			<h4>
				Price: <strong>${product.unitPrice} PLN</strong>
			</h4>
			<hr />

			<c:choose>
				<c:when test="${product.quantity<1}">
					<h6>
						Qty. Available: <span style="color:red">Out of strock!</span>
					</h6>
				</c:when>
				<c:otherwise>
					<h6>Qty. Available: ${product.quantity}</h6>
				</c:otherwise>
			</c:choose>

			<hr />
			<hr />
			
			<c:choose>
				<c:when test="${product.quantity<1}">
					<a href="javascript:void(0)"
					class="btn btn-success disabled"><strike><span class="fa fa-shopping-cart"></span>Add
					to Cart</strike></a> 
				</c:when>
				<c:otherwise>
					<a href="${contextRoot}/cart/add/${product.id}/product"
					class="btn btn-success"><span class="fa fa-shopping-cart"></span>Add
					to Cart</a> 
				</c:otherwise>
			</c:choose>
			
			<a href="${contextRoot}/show/all/products"
				class="btn btn-primary">Back</a>
		</div>
	</div>
</div>