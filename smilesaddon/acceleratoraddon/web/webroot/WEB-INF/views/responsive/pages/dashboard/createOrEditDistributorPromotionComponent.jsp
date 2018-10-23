<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="formElement"	tagdir="/WEB-INF/tags/responsive/formElement"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<c:set var="promoCode" value="${promotionCode}"/>
<script type="text/javascript" src="${commonResourcePath}/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>


<spring:htmlEscape defaultHtmlEscape="true" />
	<div class="account-section-header">
	  <div class="container-lg">
	       <spring:theme code="dist.promotion.create.edit" text="Create/Edit Promotion"/>  
	  </div>
 	</div>
	<div id="createpromotiondiv" class="row">
	    <div class="container-lg col-md-12">
	        <div class="account-section-content">
	        	<div class="promotion-info">
		        	<div class="account-section-form">
		               <%--  <form:form action="create-promotion" method="post" commandName="createPromotionForm">  --%>
		                <form:form action="save-promotionForm" method="post" commandName="createPromotionForm"> 
		                   <div class="promotion-groups-container">
			                   <div class="promotion-group">
				                   <form:label path="promotionRuleGroups"><spring:theme code="dist.promotion.create.edit.group" text="Promotion Group"/></form:label>
				                   <form:select class="form-control" path="promotionRuleGroups">
				                   <c:if test="${empty promotionGroup}">
				                      <form:option value="NONE">
				                    	<spring:theme code="dist.promotion.create.edit.rule.select" text="Please Select Promotion Rule"/>
				                      </form:option>
								      <form:options items="${promotionRuleGroups}" />
								    </c:if>
								    <c:if test="${not empty promotionGroup}">
								    	<form:option value="${promotionGroup}" label="${promotionGroup}"/>
								    	 <form:options items="${promotionRuleGroups}" />
								    </c:if>
								   </form:select> </br>
								   <form:label path="promotionTemplates"><spring:theme code="dist.promotion.create.edit.template" text="Promotion Template"/></form:label>
				                   <form:select class="form-control" path="promotionTemplates">
					                  <c:if test="${empty promotionTemplate}">
					                  	<form:option value="NONE" ><spring:theme code="dist.promotion.create.edit.rule.above.select" text="Please Select Above Promotion Rule"/></form:option>
									    <form:options items="${promotionTemplates}" />
									    </c:if>
									    <c:if test="${not empty promotionTemplate}">
					                  	<form:option value="${promotionTemplate}" label="${promotionTemplate}"/>
									    <form:options items="${promotionTemplates}" />
								    </c:if>
								   </form:select> </br>
								   <form:label inputCSS="text" path="promotionCode"> <spring:theme code="dist.promotion.create.edit.promotion.code" text="Promotion Code"/> </form:label> <br>
								   <form:input id="promotionCode" path="promotionCode" class="text form-control" inputCSS="text" mandatory="true" value="${promotionCode}"/> <br>
				                   <form:label inputCSS="text" path="promotionName"> <spring:theme code="dist.promotion.create.edit.promotion.name" text="Promotion Name"/> </form:label> <br>
				                   <form:input id="promotionName" path="promotionName" class="text form-control" inputCSS="text" mandatory="true" value="${promotionName}"/> <br>
			                  	   <form:label inputCSS="text" path="promotionDescription"> <spring:theme code="dist.promotion.create.edit.promotion.description"/> </form:label> <br>
			                  	   <form:input id="promotionDescription" path="promotionDescription" class="text form-control" inputCSS="text" mandatory="true" value="${promotionDescription}"/> <br>
								   <form:label inputCSS="text" path="promotionPriority"> <spring:theme code="dist.promotion.create.edit.promotion.priority"/> </form:label> <br>
								   <c:if test="${empty promotionPriority}"> 
			                  	   <form:input id="promotionPriority" path="promotionPriority" class="text form-control" inputCSS="text" mandatory="true" value=""/> <br>
								   </c:if>
								   <c:if test="${not empty promotionPriority}">
			                  	   <form:input id="promotionPriority" path="promotionPriority" class="text form-control" inputCSS="text" mandatory="true" value="${promotionPriority}"/> <br>
								   </c:if>
								   <form:label inputCSS="text" path="promotionStartDate"> <spring:theme code="dist.promotion.create.edit.promotion.start.date"/> </form:label> <br>
			                  	   <c:if test="${not empty promotionStartDate}">
			                  	   <form:input id="promotionStartDate" path="promotionStartDate" class="text form-control" inputCSS="text" mandatory="true" value="${promotionStartDate}"/> <br>
			                  	   </c:if>
			                  	   <c:if test="${empty promotionStartDate}">
			                  	   <form:input id="promotionStartDate" path="promotionStartDate" class="text form-control" inputCSS="text" mandatory="true" /> <br>
			                  	   </c:if>
			                  	   <form:label inputCSS="text" path="promotionEndDate"> <spring:theme code="dist.promotion.create.edit.promotion.end.date"/> </form:label> <br>
			                  	   <c:if test="${not empty promotionEndDate}">
			                  	   	<form:input id="promotionEndDate" path="promotionEndDate" class="text form-control" inputCSS="text" mandatory="true" value="${promotionEndDate}"/> <br>
			                  	   </c:if>	
			                  	   <c:if test="${empty promotionEndDate}">
			                  	   	<form:input id="promotionEndDate" path="promotionEndDate" class="text form-control" inputCSS="text" mandatory="true"/> <br>
			                  	   </c:if>	
			                  	   <!-- <div class="col-sm-6 col-sm-push-6">
		                            <div class="accountActions"> -->
		                             
		                                <ycommerce:testId code="personalDetails_savePersonalDetails_button">
			                                  <c:if test="${empty promotionEndDate}">
			                                    <button type="submit" hidden="false" id="promotionFormNextButton" class="btn btn-primary btn-block">
			                                        	<spring:theme code="Next" text="Next"/>
			                                    </button>
			                                    <input type="hidden" name="editPromotionForm" id="editPromotionForm"
												value="false" />
			                                  </c:if>
		                                      <c:if test="${not empty promotionEndDate}">
			                                    <button type="submit" hidden="false" id="promotionFormSaveButton" class="btn btn-primary btn-block">
			                                        	<spring:theme code="Save" text="Save"/>
			                                    </button>
			                                    <input type="hidden" name="editPromotionForm" id="editPromotionForm"
												value="true" />
			                                  </c:if>
		                                </ycommerce:testId>
		                               
		                            <!-- </div>
		                        </div> -->
			                   </div>
			                </div>
			            </form:form>
		            </div>
		        </div>
	            <div class="promotion-conditions">
		             <c:if test="${empty promotionEndDate}">
		            <div id="conditionForm" hidden="true" class="account-section-form">
		            </c:if>
		            <c:if test="${not empty promotionEndDate}">
		            <div id="conditionForm" class="account-section-form">
		            </c:if>
		                
		                
		                
		                
		                <form:form action="save-cartTotalConditionForm" method="post" commandName="cartTotalConditionForm">
		                   <div class="promotion-groups-container">
			                   <div class="promotion-group">
			                   		<div class="account-section-header">
										 <div class="container-lg">
												 <spring:theme code="Conditions"/> 
												 <%-- <button type="button" id="conditionFormSaveButton" class="btn btn-primary" align="right">
		                                        		<spring:theme code="Add condition" text="Add Condition">
		                                    			</spring:theme>
		                                    	 </button> --%>
										 </div>
									</div>
										</br>
									<form:label path="ruleConditions"><spring:theme code="dist.promotion.create.edit.promotion.conditions" text="Available-conditions"/></form:label>
									<div class="control">
										<form:select class="form-control" path="ruleConditions">
										<c:if test="${empty conditon}">
						                  	<form:option value="NONE"><spring:theme code="dist.promotion.create.edit.promotion.condition.select" text="Please select available conditions"/></form:option>
										    <form:options items="${ruleConditions}" />
										</c:if>
										<c:if test="${not empty conditon}">
						                  	<form:option value="${conditon}" label="${conditon}"/>
										    <form:options items="${ruleConditions}" />
										</c:if>
										</form:select> </br>
									</div>  
									
									<!-- <div hidden="true" class="form-group" id="cart-total-condition"> -->
									<c:if test="${empty conditon}">
									<div class="form-group" hidden="true" id="cart-total-condition">
									</c:if>
									<c:if test="${not empty conditon}">
									<div class="form-group" id="cart-total-condition">
									</c:if>
										<label type="hidden" class="control-label" id="conditionOperatorLabel" for="code"><spring:theme code="dist.promotion.create.edit.promotion.condition.operator" text="Operator"/></label>
										<div class="control">
										
										    <form:select path="conditionOperator" class="form-control" >
										    <c:if test="${empty conditionOperator}">
												    <option value="" disabled="disabled" selected="selected">
															<spring:theme code="dist.promotion.create.edit.promotion.condition.operator.select" text="Please select operator"/>	
													</option>
													<option>=</option><option><</option><option>></option><option>>=</option><option><=</option>
											</c:if>
											 <c:if test="${not empty conditionOperator}">
											 	<option>${conditionOperator}</option>
													<option>=</option><option><</option><option>></option><option>>=</option><option><=</option>
											 </c:if>
											</form:select> </br>
											
											<form:label path="conditionCurrency"><spring:theme code="dist.promotion.create.edit.promotion.condition.currency" text="Currency"/></form:label>
											<form:select path="conditionCurrency" class="form-control">
											<c:if test="${empty currency}">
												<form:option value="NONE">
												<spring:theme code="dist.promotion.create.edit.promotion.condition.currency.select" text="Please select currency"/>
												</form:option>
												<option>${conditionCurrency}</option>
											</c:if>
											<c:if test="${not empty currency}">
												<form:option value="${currency}" label="${currency}" >
												</form:option>
												<option>${conditionCurrency}</option>
											</c:if>
											</form:select> </br> 
												
											 <c:if test="${empty conditionValue}"> 
											<formElement:formInputBox idKey="conditionValue" labelKey="Value" path="conditionValue" inputCSS="text" mandatory="true"/>  
											</c:if>	
											<c:if test="${not empty conditionValue}"> 
												<form:input id="conditionValue" path="conditionValue" class="text form-control" inputCSS="text" mandatory="true" value="${conditionValue}"/> <br>
											</c:if>
											<%-- <c:if test="${empty conditionValue}"> --%>
											<ycommerce:testId code="personalDetails_savePersonalDetails_button">
		                                    	<button type="submit" id="conditionFormSaveButton" class="btn btn-primary btn-block">
		                                    		<c:if test="${empty conditionValue}">
		                                        		<spring:theme code="Next" text="Next"/>
		                                        		<input type="hidden" name="editPromotionForm" id="editCartTotalConditionFrom"
												value="false" />
		                                        	</c:if>
		                                        	<c:if test="${not empty conditionValue}">
		                                        		<spring:theme code="Save" text="Save"/>
		                                        		<input type="hidden" name="editCartTotalConditionFrom" id="editCartTotalConditionFrom"
												value="true" />
												<input type="hidden" name="editPromoCode" id="editPromoCode"
												value="${promotionCode}" />
		                                        	</c:if>
		                                    	</button>
		                                	</ycommerce:testId>
		                                	<%-- </c:if>			 --%>				
										</div>   
									</div>
			                   </div>
			                </div>
			                <%-- <div class="row">
		                        <div class="col-sm-6 col-sm-push-6">
		                            <div class="accountActions">
		                                <ycommerce:testId code="personalDetails_savePersonalDetails_button">
		                                    <button type="submit" id="conditionFormSaveButton" class="btn btn-primary btn-block">
		                                        <spring:theme code="Save" text="Save"/>
		                                    </button>
		                                </ycommerce:testId>
		                            </div>
		                        </div>
		                    </div> --%>
			            </form:form>
		            </div>
		            
		           
		           
		           
		           
		           
		            <c:if test="${empty conditionValue}"> 
		            <div id="actionForm" hidden="true" class="account-section-form">
		            </c:if>
		            <c:if test="${not empty conditionValue}"> 
		            <div id="actionForm" class="account-section-form">
		            </c:if>
		                <%-- <form:form action="create-promotion" method="post" commandName="percentageAndFixedDiscountActionForm"> --%>
		                <form:form action="save-percentageAndFixedDiscountActionForm" method="post" commandName="percentageAndFixedDiscountActionForm">
		                   <div class="promotion-groups-container">
		                   		<div class="promotion-group">
									<!-- <div hidden="true" class="form-group" id="cart-total-action"> -->
									<div id="cart-total-condition">
											<div class="account-section-header">
												 <div class="container-lg">
														 <spring:theme code="Actions"/> 
												 </div>
											</div>
											</br>
											<label class="control-label " for="code"><spring:theme code="dist.promotion.create.edit.promotion.actions" text="Available Actions"/></label>
											<div class="control">
												<form:select class="form-control" path="ruleActions">
													<c:if test="${empty action}">
								                  	<form:option value="NONE">
								                  		<spring:theme code="dist.promotion.create.edit.promotion.action.select" text="Please select action"/>
								                  	</form:option>
												    <form:options items="${ruleActions}" />
												    </c:if>
												    <c:if test="${not empty action}">
								                  	<form:option value="${action}" label="${action}"/>
												    <form:options items="${ruleActions}" />
												    </c:if>
												</form:select> </br>
											</div>
											<c:if test="${not empty action}">
											<div class="control" id="percentage-fixed-discount-action">
											</c:if>
											<c:if test="${empty action}">
											<div class="control" hidden="true" id="percentage-fixed-discount-action">
											</c:if>
												<form:label path="actionCurrency"><spring:theme code="dist.promotion.create.edit.promotion.condition.currency" text="Currency"/> </form:label>
												<form:select path="actionCurrency" class="form-control">
												<c:if test="${empty currency}">
													<form:option value="NONE">
													<spring:theme code="dist.promotion.create.edit.promotion.condition.currency.select" text="Please select currency"/>
													</form:option>
													<option>${actionCurrency}</option>
													</c:if>
													<c:if test="${not empty currency}">
													<form:option value="${currency}" label="${currency}" >
													</form:option>
													<option>${actionCurrency}</option>
													</c:if>
												</form:select> </br>
											<c:if test="${empty actionValue}"> 
											<formElement:formInputBox idKey="actionValue" labelKey="Value" path="actionValue" inputCSS="text" mandatory="true"/>  
											</c:if>	
											<c:if test="${not empty actionValue}"> 
												<form:input id="actionValue" path="actionValue" class="text form-control" inputCSS="text" mandatory="true" value="${actionValue}"/> <br>
											</c:if>	
											 <%-- <c:if test="${empty actionValue}">  --%>
											 	<ycommerce:testId code="personalDetails_savePersonalDetails_button">
				                                    <button type="submit" class="btn btn-primary btn-block">
				                                        <c:if test="${empty actionValue}">
				                                        	<spring:theme code="Next" text="Next"/>
				                                        	<input type="hidden" name="editpercentageAndFixedDiscountActionForm" id="editpercentageAndFixedDiscountActionForm"
												value="false" />
				                                        </c:if>
				                                        <c:if test="${not empty actionValue}">
				                                        	<spring:theme code="Save" text="Save"/>
				                                        	<input type="hidden" name="editpercentageAndFixedDiscountActionForm" id="editpercentageAndFixedDiscountActionForm"
												value="true" />
												<input type="hidden" name="editPromoCode" id="editPromoCode"
												value="${promotionCode}" />
				                                        </c:if>
				                                    </button>
				                                </ycommerce:testId>
											<%--  </c:if> --%>
											</div>   
									</div> 
								</div>
		                   </div>
		                </form:form>
		            </div>
		        </div>    
		    </div>
            <div class="account-section-form">
                <form:form action="create-promotion" method="post" commandName="createPromotionForm">
                	 <%-- <c:if test="${not empty actionValue}">  --%>
                	 <%-- <input type="hidden" name="promotionCode" id="promotionCode" value="${promotionCode}" />
                	 <form:form action="create-promotion" method="post" commandName="createPromotionForm">
                	 <%-- <c:if test="${not empty actionValue}">  --%>
               	 		<div class="col-sm-3 col-sm-offset-3">
                           <div class="accountActions">
                               <ycommerce:testId code="personalDetails_savePersonalDetails_button">
                               		<c:if test="${empty actionValue}">
	                                   <div class="btn btn-primary btn-block disabled">
	                                       <spring:theme code="Create" text="Create"/>
	                                   </div>
                                   </c:if>
                               		<c:if test="${not empty actionValue}">
	                                   <button type="submit" class="btn btn-primary btn-block">
	                                       <spring:theme code="Create" text="Create"/>
	                                   </button>
                                   </c:if> 
                               </ycommerce:testId>
                           </div>
                       </div>
               	 		<div class="col-sm-3">
                            <div class="accountActions">
                               <ycommerce:testId code="personalDetails_cancelPersonalDetails_button">
                                    <button id="cancel-promotion-button" onclick="location.href='distPromotions';" type="button" class="btn btn-primary btn-block">
                                       <spring:theme code="Cancel" text="Cancel"/>
                                   </button>
                               </ycommerce:testId>
                           </div>
                       </div>
                       
                </form:form>
        	</div>
		</div>
	</div>
	
	<style>
	
		#createpromotiondiv .promotion-groups-container .promotion-group {
		    padding: 10px;
		    border: 1px solid #ccc;
		    border-radius: 10px;
		    margin-top: 5px;
		}
		#createpromotiondiv .account-section-header {
			text-align: left;
			margin: 0 10px;
		    padding: 5px;
		    font-size: 20px;
		}
		#createpromotiondiv .account-section-content {
			padding-left: 0;
    		padding-right: 0;
    		display: inline-block;
    		width: 100%;
		}
		#createpromotiondiv .account-section-content .account-section-form {
			margin: 10px 0;
		}
		@media (min-width: 1024px) {
			#createpromotiondiv .account-section-content .promotion-info {
				float: left;
				width: 49%;
			}
			#createpromotiondiv .account-section-content .promotion-conditions {
				float: right;
				width: 49%;
			}
		}
		#createpromotiondiv .promotion-groups-container .promotion-group .account-section-header {
			text-align: left;
			padding: 0;
			margin-left: 0;
		}
		#createpromotiondiv .promotion-groups-container .promotion-group .account-section-header .container-lg{
			padding: 0;
		}
	</style>
	
	
	 <script>
	 
			 $("#promotionRuleGroups").on('change', function() {
			     var level = $(this).val();
			     if(level){
				            $.ajax ({
				             type: 'GET',
				             url: 'selected-promotionRule',
				             data: { selectedPromotionGroup: '' + level + '' },
				             success : function(htmlresponse) 
				             {
				            	 var len = htmlresponse.length;
				            	 $("#promotionTemplates").empty();
				            	 $("#promotionTemplates").append("<option>Select a promotion template</option>");
				                 for (var i = 0; i < len; i++) 
				                 	{
				                     	var id = htmlresponse[i];
				                     	$("#promotionTemplates").append("<option>"+id+"</option>");
				                    }
				            	  if (len == 0)
				            		{
				            		  $("#promotionTemplates").append("<option>No promotion template is available for selected rule</option>");
				            		}
				              },
				              error:function(e)
				              {
				             		alert("Please select proper choise");}
				         	  });
			     			}
			 });
			 
			 $("select.promotionTemplates").on('change', function() {
			     var level = $(this).val();
			     if(level){
				            $.ajax ({
				             type: 'GET',
				             url: 'create-promotion-page',
				             data: { selectedPromotionTemplate: '' + level + '' },
				             success : function(htmlresponse) 
				             {
				            	 //alert("Selected promotion template is " + htmlresponse);
				            	 //alert("You have selected a template" + $(".promotionTemplate option:selected").val());
				              },
				              error:function(e)
				              {
				             		alert("Please select proper choise");}
				         	  });
			     			}
			 });
			 
			 $(document).on("click", function () {
		           var selectedBaseId = '#'+event.target.id;
		           var selectedValue = $(selectedBaseId).find(":selected").attr('value');
		           var query = '#edit-promotion-button';
		           var searchPattern = new RegExp('^' + query, 'i');
		           if (searchPattern.test(selectedBaseId)) {
		               var level = $("#promoCode").val();
						 $("#createpromotiondiv").removeAttr("hidden");
						 $.ajax ({
				             type: 'GET',
				             url: 'edit-promotions',
				             data: { selectedPromotion: '' + level + '' },
				             success : function(htmlresponse) 
				             {
				            	 document.getElementById("promotionCode").value = htmlresponse.promotionCode;
				            	 document.getElementById("promotionName").value = htmlresponse.promotionName;
				              }, 
				         	   }); 
		           }
		        })
		        
		        $("#promotionFormSaveButton").on('click', function() {
		        	 $("#conditionForm").removeAttr("hidden"); 
		        	 $("#promotionFormSaveButton").attr("hidden","true"); 
			     /* var level = $(this).val();
			     	if(level==='Cart total')
			    	 {
			    	 	$("#cart-total-condition").removeAttr("hidden");
			    	 	$("#cart-total-action").removeAttr("hidden");
			    	 }
			     	else
			    	 {
				    	 $("#cart-total-condition").attr("hidden","false");
				    	 $("#cart-total-action").attr("hidden","false");
			    	 } */
			 });
			 
			 
			 $("#ruleConditions").on('change', function() {
			     var level = $(this).val();
			     	if(level==='Cart total')
			    	 {
			    	 	$("#cart-total-condition").removeAttr("hidden");
			    	 	$("#cart-total-action").removeAttr("hidden");
			    	 }
			     	else
			    	 {
				    	 $("#cart-total-condition").attr("hidden","false");
				    	 $("#cart-total-action").attr("hidden","false");
			    	 }
			 });
			 
			 $("#ruleActions").on('change', function() {
			     var level = $(this).val();
			     	if(level==='Percentage discount on cart' || level==='Fixed discount on cart')
			    	 {
			    	 	$("#percentage-fixed-discount-action").removeAttr("hidden");
			    	 	$("#percentage-fixed-discount-action").removeAttr("hidden");
			    	 }
			     	else
			    	 {
				    	 $("#percentage-fixed-discount-action").attr("hidden","false");
				    	 $("#percentage-fixed-discount-action").attr("hidden","false");
			    	 }
			 });
			 
		         $(document).ready(function() {
							    $("#promotionStartDate").datepicker();
							    $("#promotionEndDate").datepicker();
							  });
		         
		        
 </script> 
	