<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"  %>
<%@include file="../shared/flows-header.jsp"%>

			<div class="container">
			
				<div class="row">
					<div class="col-md-6 offset-md-3">
						<div class="card">
							<div class="card-header bg-primary text-white">
								<h4>Sign Up - Personal</h4>
							</div>
							<div class="card-block">
								<sf:form method="POST" class="form-horizontal" id="registerForm" modelAttribute="user">
									<div class="form-group row">
										<label class="control-label col-md-4">First Name</label>
										<div class="col-md-8">
											<sf:input type="text" path="firstName" class="form-control" placeholder="First Name"/>
										</div>
									</div>
									<div class="form-group row">
										<label class="control-label col-md-4">Last Name</label>
										<div class="col-md-8">
											<sf:input type="text" path="lastName" class="form-control" placeholder="Last Name"/>
										</div>
									</div>
									<div class="form-group row">
										<label class="control-label col-md-4">Email</label>
										<div class="col-md-8">
											<sf:input type="text" path="email" class="form-control" placeholder="abc@zyx.com"/>
										</div>
									</div>
									<div class="form-group row">
										<label class="control-label col-md-4">Contact Number</label>
										<div class="col-md-8">
											<sf:input type="text" path="contactNumber" class="form-control" placeholder="XXXXXXXXXX" maxlenght="10"/>
										</div>
									</div>
									<div class="form-group row">
										<label class="control-label col-md-4">Password</label>
										<div class="col-md-8">
											<sf:input type="password" path="password" class="form-control" placeholder="Password" />
										</div>
									</div>
									<div class="form-group row">
										<label class="control-label col-md-4">Select Role</label>
										<div class="col-md-8">
											<label class="radio-inline">
												<sf:radiobutton path="role" value="USER" checked="checked"/>User
											</label>
											<label class="radio-inline">
												<sf:radiobutton path="role" value="SUPPLIER" />Supplier
											</label>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-3 mx-auto">
											<div class="text-center ">
										
											<button type="submit" class="btn btn-primary" name="_eventId_billing">
											Next - Billing <span class="fas fa-chevron-right"></span>
											
											</button>
											</div>
										</div>
									</div>
								</sf:form>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			
<%@include file="../shared/flows-footer.jsp"%>	
