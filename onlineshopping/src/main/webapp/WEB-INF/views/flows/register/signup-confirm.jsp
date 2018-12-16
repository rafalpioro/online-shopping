<%@include file="../shared/flows-header.jsp"%>
			
				<div class="row">
					<!-- column to display the personal details -->
					<div class="col-md-6">
						<div class="card ">
							<div class="card-header bg-primary text-white">
								<h4>Personal Details</h4>
							</div>
							</br>
							<div class="card-body">
								<div class="col-6 mx-auto">
									<div class="text-center">
										<h4>${registerModel.user.firstName} ${registerModel.user.lastName}</h4>
										<h5>Email: ${registerModel.user.email}</h5>
										<h5>Contact Number: ${registerModel.user.contactNumber}</h5>
										<h5>Role: ${registerModel.user.role}</h5>
									</div>
								</div>
							</div>
						
							<div class="card-footer">
								<a href="${flowExecutionUrl}&_eventId_personal" class="btn btn-primary">Edit</a>
							</div>
						</div>
					</div>
					<!-- column to display the address -->
					<div class="col-md-6">
						<div class="card ">
							<div class="card-header bg-primary text-white">
								<h4>Billing Address</h4>
							</div>
						<div class="card-body">
							<div class="col-6 mx-auto">
									<div class="text-center">
										<h4>${registerModel.billing.addressLineOne}</h4>
										<h4>${registerModel.billing.addressLineOne}</h4>
										<h4>${registerModel.billing.city}- ${registerModel.billing.postalCode}</h4>
										<h4>${registerModel.billing.state}- ${registerModel.billing.country}</h4>
									</div>
								</div>
						</div>
						
						<div class="card-footer">
							<a href="${flowExecutionUrl}&_eventId_billing" class="btn btn-primary">Edit</a>
						</div>
					</div>
				</div>
				
			</div>
			</br>
			<div class="row">
				<div class="col-3 mx-auto">
					<div class="text-center ">
				
						<a href="${flowExecutionUrl}&_eventId_submit" class="btn btn-primary">Confirm</a>
				
					</div>
				</div>
			</div>
			
<%@include file="../shared/flows-footer.jsp"%>	