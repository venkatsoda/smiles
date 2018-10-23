<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="formElement"	tagdir="/WEB-INF/tags/responsive/formElement"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="breadcrumb" tagdir="/WEB-INF/tags/responsive/nav/breadcrumb"%>
<script type="text/javascript" src="${commonResourcePath}/js/jquery-3.2.1.min.js"></script>


<spring:htmlEscape defaultHtmlEscape="true" />

   <!-- Display Created Promotion -->
   <breadcrumb:breadcrumb breadcrumbs="${breadcrumbs}" />

   <div class="form-group col-md-12">
	   <div class="form-group col-md-3">
	   <button  id="createCustomPromoBtn" onclick="location.href='createCustomPromotions';" class="btn btn-primary btn-block"><spring:theme code="dist.promotion.create" text="Create Custom Promotion" /></button>
	   </div>
	   <div class="form-group col-md-9"></div>
   </div>
   
   <div class='successmessage'></div>
   <div class='errormessage'></div>
   
   <div class="cusListheader">
	   
   <div class="title"><spring:theme code="dist.promotionHistory" text="Promotions List" />
   
   </div>
   
   </div>
   <div class="standard-table promotion-table historytablediv">
			
				<div class="table-responsive">		
				<table style="font-size: 12px">
					<thead>
						<tr>
							<th width="15%"><spring:theme code="dist.promotion.history.promotioncode"
									text="Promotion Code" /></th>
							<th width="13%"><spring:theme code="dist.promotion.history.promotionname"
									text="Promotion Type" /></th>

							<th width="17%"><spring:theme code="dist.promotion.history.promotiondescription"
									text="Promotion Description" /></th>
							<th width="19%"><spring:theme code="dist.promotion.history.promotionmessage"
									text="Promotion Message" /></th>
							<th width="19%"><spring:theme code="dist.promotion.history.promotionedit"
									text="Edit Promotion" /></th>
							<%-- <th><spring:theme code="account.order.history.remarks"
									text="Remarks" /></th> --%>
							<%-- <th width="15%"><spring:theme code="account.promotion.history.promotiontemplate"
									text="Action" /></th> --%>
							<!-- <th width="5%">&nbsp;</th> -->
						</tr>
					</thead>					
					<tbody>
						<c:if test="${empty createdPromotions}"> <spring:theme code="dist.promotion.history.nopromotions"
									text="Sorry, No Promotions Found!" /></c:if>
						<%-- <c:set var="now" value="<%=new java.util.Date()%>" /> --%>

						<c:forEach items="${createdPromotions}" var="createdPromotion"
							varStatus="loop">


							<tr>
								<td class="no-text-wrap">
									${createdPromotion.promoCode}
								</td>
								<td class="no-text-wrap">
									${createdPromotion.promoType} </td>
								<td>
									
									${createdPromotion.promoDescription}
									
								</td>
								<td class="no-text-wrap">
									${createdPromotion.promoMessage}
								</td>

								<td style="text-align: right;">
									<form id="editPromoForm${createdPromotion.promoCode}" action="editPromotion/${createdPromotion.promoCode}" method="get">
									<input type="hidden" name="promoCode" id="promoCode"
											value="${createdPromotion.promoCode}" /> 
									<input type="submit" class="edit-promotion-button" id="edit-promotion-button-${createdPromotion.promoCode}" value="<spring:theme code="dist.promotion.view.edit" text="View/Edit" />"
											title="Edit Promotion" >
											</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				 
				</table>
				</div>
				
				</div>	

     <style>
    	.promotion-table p{
    		padding-top: 10px;
    	}
    	.accountActions #create-promotion-button {
    		width: auto;
    	}
    </style> 	
 	<script>
 	
 	$(document).ready(function(){
 		
 	    $("#createCustomPromoBtnNEW").click(function(){
 	    	alert("clicked");
 	    
 	    	$.ajax({url: "createCustomPromotions",type : "GET", success: function(result){
 	    		 alert("Succ meth."+result);
 	        }});
 	    	
 	    });
 	});
 	
 	
 	
 
 	  	 
 	 $(".edit-promotion-button").on("click", function () {
  		
         var selectedBaseId = '#'+event.target.id;
         var selectedValue = $(selectedBaseId).find(":selected").attr('value');
         var query = '#edit-promotion-button';
         var searchPattern = new RegExp('^' + query, 'i');
         if (searchPattern.test(selectedBaseId)) {
             var promoCode = selectedBaseId.substring(23); 
             
             $("#editPromoForm"+promoCode).submit();
             
         }
      })    
			 
 </script>
