<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"  %>

<div class="container">

	<div class="row">	
	
	<c:if test="${not empty message}">
	
		<div class="col-md-12">
			
				<div class="alert alert-success alert-dismissible" role="alert">
				
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    				<span aria-hidden="true">&times;</span></button>
				${message}
				
				</div>
		
		</div>
	</c:if>
		<div class="col-md-8 offset-md-2">
			
			<div class="card card-primary">
				
				<div class="card-header">
				
					<h4>Products Management</h4>
				
				</div>
				
				<div class="card-block">
					<sf:form modelAttribute="product" action="${contextRoot}/manage/products" method="POST">
						
						<div class="form-group row">
						
							<label class="control-label col-md-4" for="name">Enter Product Name: </label>
							<div class="col-md-8">
								
								<sf:input type="text" path="name" id="name" placeholder="Product Name" class="form-control"/>
								<sf:errors path="name" cssClass="form-text" element="em"/>
							</div>
						</div>
						
						<div class="form-group row">
						
							<label class="control-label col-md-4" for="brand">Enter Brand Name: </label>
							<div class="col-md-8">
								
								<sf:input type="text" path="brand" id="brand" placeholder="Brand Name" class="form-control"/>
								<sf:errors path="brand" cssClass="form-text" element="em"/>
							</div>
						</div>
						
						<div class="form-group row">
						
							<label class="control-label col-md-4" for="description">Product Description: </label>
							<div class="col-md-8">
								
								<sf:textarea path="description" id="description" rows="4" placeholder="Write a description" class="form-control"></sf:textarea>
								<sf:errors path="description" cssClass="form-text" element="em"/>
							</div>
						</div>
						
						<div class="form-group row">
						
							<label class="control-label col-md-4" for="unitPrice">Enter Unit Price: </label>
							<div class="col-md-8">
								<sf:input type="number" path="unitPrice" id="unitPrice" placeholder="Unit Price in PLN" class="form-control"/>
								<sf:errors path="unitPrice" cssClass="form-text" element="em"/>
							</div>
						</div>
						
						<div class="form-group row">
						
							<label class="control-label col-md-4" for="quantity">Enter Quantity: </label>
							<div class="col-md-8">
								<sf:input type="number" path="quantity" id="quantity" placeholder="Quantity Available" class="form-control"/>
							</div>
						</div>
						
						<div class="form-group row">
						
							<label class="control-label col-md-4" for="categoryId">Select Category: </label>
							<div class="col-md-8">
								<sf:select class="form-control" id="categoryId" path="categoryId"
									items="${categories}"
									itemLabel="name"
									itemValue="id"
								/>
								
							</div>
						</div>
						
						<div class="form-group row">
		
							<div class="col-md-8 offset-md-4">
								
								<input type="submit" name="submit" id="submit" value="Submit" class="btn btn-primary"/>
								
								<sf:hidden path="id"/>
								<sf:hidden path="code"/>
								<sf:hidden path="supplierId"/>
								<sf:hidden path="active"/>
								<sf:hidden path="purchases"/>
								<sf:hidden path="views"/>
							</div>
						</div>
				
					</sf:form>
				</div>
			</div>		
		</div>	
	</div>
</div>