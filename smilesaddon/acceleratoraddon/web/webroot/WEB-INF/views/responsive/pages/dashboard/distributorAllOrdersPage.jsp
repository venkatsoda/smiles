<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="user" tagdir="/WEB-INF/tags/responsive/user"%>
<%-- <%@ taglib prefix="cms" uri="/cms2lib/cmstags/cmstags.tld"%> --%>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/responsive/common"%>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/desktop/nav"%>
<%@ taglib prefix="formUtil" tagdir="/WEB-INF/tags/responsive/form"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format"%>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="breadcrumb" tagdir="/WEB-INF/tags/responsive/nav/breadcrumb"%>
<script type="text/javascript" src="${commonResourcePath}/js/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

<div id="dist-all-orders">
	<div id="globalMessages">
		<%-- <common:globalMessages /> --%>
	</div>
	<div class="common-section-header">
	<breadcrumb:breadcrumb breadcrumbs="${breadcrumbs}" />
		<div class="accOrderList">
			<div class="title"><spring:theme code="dist.orderHistory" text="Order History" /></div>
			<div class="all-products-btns">
				<span class="download-order download-btn">
					<c:url value="/my-dashboard/download-orders" var="downloadOrdersUrl"/>
					<a id="downloadOrder" href="javascript:downloadOrder('${downloadOrdersUrl}');"><spring:theme code="dist.order.download.status" text="Download Orders Status" /></a>						
				</span>
				<span class="upload-btn"><span><spring:theme code="dist.order.upload.status" text="Upload Orders Status" /></span></span>
				<span class="download-order download-btn">
					<c:url value="/my-dashboard/download-ordersDetails" var="downloadOrdersDetailsUrl"/>
					<a href="javascript:downloadOrder('${downloadOrdersDetailsUrl}');"><spring:theme code="dist.order.download.details" text="Download Orders Details" /></a>						
				</span>
			</div>
		</div>
		<div class="downUp">
			<%-- <div class="download-order">
				<c:url value="/my-account/download-orders" var="downloadOrdersUrl"/>
				<a href="${downloadOrdersUrl}">Download Orders Status</a>						
			</div> --%>
			<div class="upload-orders">
				<!-- <span>Upload Orders Status</span> -->
				<div class="uploadPopup">
					<c:url value="/my-dashboard/upload-orders?CSRFToken=${CSRFToken.token}" var="uploadOrdersUrl"/>
					<form action = "${uploadOrdersUrl}" method = "post" enctype = "multipart/form-data">				
						<input type = "file" name = "file" size = "50" />
						<input type="hidden"
							name="CSRFToken" value="${CSRFToken.token}" />
		        		<input type = "submit" value = "<spring:theme code="dist.upload.file"/>"/>
		        		<b class="close-upload">X</b>
		     		</form>	
	     		</div>
			</div>
				<%-- <div class="download-order">
					<c:url value="/my-account/download-ordersDetails" var="downloadOrdersDetailsUrl"/>
					<a href="${downloadOrdersDetailsUrl}">Download Orders Details</a>						
				</div> --%>
		</div>
	</div>
	
	<div class="account">
		<div class="left-nav-companion">
			<div class="search-section">
				<div class="leftSearch">
				     <c:url value="/my-dashboard/searchCustomerOrders" var="searchCustomerOrdersUrl"/>
					<form:form name="searchOrder" action="${searchCustomerOrdersUrl}" method="post" commandName="dashboardOrderForm">
						<div id="searchOrder">
							<font size="3px"><spring:theme code="dist.order.searchby.number" text="Search by Orders" /> </font>
							<div class="searchOrderDiv">
								<div class="search-option">
									<div><spring:theme code="dist.order.number" text="Order Number" /></div>
									<input type="text" class="form-control" id="orderNumber" name="orderNumber" />
								</div>
								<div class="search-option">
									<div><spring:theme code="dist.order.searchby.status" text="By Status" /></div>
									<select class="orderStatus form-control" name="orderStatus" id="orderStatus">
										<option value="" selected="selected"></option>
										<option value="all"><spring:theme code="dist.order.search.option.all" text="All" /></option>
										<option value="no" ><spring:theme code="dist.order.search.option.inprocess" text="In Process" /></option>
										<option value="yes"><spring:theme code="dist.order.search.option.delivered" text="Delivered" /></option>
										<option value="cancelled"><spring:theme code="dist.order.search.option.cancelled" text="Cancelled" /></option>
										<option value="OutForDelivery"><spring:theme code="dist.order.search.option.outfordelivery" text="Out For Delivery" /></option>
										<%-- <option value="hold"><spring:theme code="dist.order.search.option.hold" text="Hold" /></option> --%>
										<option value="Rejected"><spring:theme code="dist.order.search.option.rejected" text="Refusal" /></option>
									</select>
								</div>
								<div class="search-option">
									<div>&#160;</div>
									<input type="submit" name='search' value="<spring:theme code="dist.order.search.button" text="Search" />"></input>
								</div>
							</div>
						</div>
						<input type="hidden" id="email" name="email" value="" /> 
					</form:form>
				</div>
				<div class="rightSearch">
					 <c:url value="/my-dashboard/advancedSearchOrderHistory" var="advancedSearchOrderHistoryUrl"/>
					<form:form name="searchOrder" action="${advancedSearchOrderHistoryUrl}" method="post" commandName="dashboardOrderForm">
							
						<div id="advanceSearch">
							<font size="3px"><spring:theme code="dist.order.search.date" text="Search by Date" /> </font>
							<div class="advanceSearchDiv">
								<div class="search-option">
									<div><spring:theme code="dist.order.search.date.from" text="From" /></div>
									<form:input id="fromDate" path="fromDate" class="form-control" inputCSS="text" value="${fromDate}"/> 
								</div>
								<div class="search-option">
								 	<div><spring:theme code="dist.order.search.date.till" text="Till" /></div>
									<form:input id="toDate" path="toDate" class="form-control" inputCSS="text"/>  
								</div>
								<!-- <div>
								 	<span>Select status</span>
								 	<select>
										<option id="InProcess" value="In Process">In Process</option>
										<option id="Dispatched" value="Dispatched">Dispatched</option>
										<option id="Delivered" value="Delivered">Delivered</option>
										<option id="PaymentReceived" value="payment Received">Payment Received</option>
									</select>
								</div> -->
								<div class="search-option">
									<div>&#160;</div>
								 	<input type="submit" name='search' value="<spring:theme code="dist.order.search.button" text="Search" />"></input>
								 </div>
							 </div>
						</div>
						</form:form>
				</div>
			</div>
			<div class="standard-table product-table historytablediv">
				<p><spring:theme code="dist.order.help"/></p>
			
             <div class="table-responsive">
				<table style="font-size: 12px">
					<thead>
						<tr>
							<th width="20%" ><spring:theme code="dist.order.history.orderdate"
									text="Order Date" /></th>
							<th width="17%"><spring:theme code="dist.order.history.ordernumber"
									text="Order Number" /></th>
							<th width="18%"><spring:theme code="dist.order.history.total"
									text="Order Total" /></th>

							<%-- <th width="13%"><spring:theme code="dist.order.history.orderstatus"
									text="Order Status" /></th> --%>
							<th width="20%"><spring:theme code="dist.order.history.fulfilledBy"
									text="Fulfilled By" /></th>
							<th width="20%"><spring:theme code="dist.order.history.orderstatus"
									text="Change Status" /></th>
							<th width="5%"><spring:theme code="dist.customer.action"
									text="Action" />&nbsp;&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty orderHistoryList}"> <spring:theme code="dist.order.nosearch" text="Sorry, No Orders Found!" /></c:if>
						<c:set var="now" value="<%=new java.util.Date()%>" />
						<c:forEach items="${orderHistoryList}" var="orderLine"
							varStatus="loop">


							<tr class="${loop.index %2 == 0 ? '' : 'alt-color' }">
								<td class="no-text-wrap"><fmt:setTimeZone value="GMT-3" />
									<fmt:formatDate type="both" value="${orderLine.created}" timeStyle = "short"/></td>
								<td>
										<a href="<c:url value="order-detail/${orderLine.code}" />"
											class="icon-link">${orderLine.code} </a>
									</td>
								<td class="no-text-wrap"><format:price
										priceData="${orderLine.totalPrice}" displayFreeForZero="false" />
							

								</td>


								<%-- <td class="orderStatusText">
									<c:if test="${orderLine.status eq 'COMPLETED'}">
										<spring:theme
											code="account.order.history.orderstatus.completed"
											text="Completed" />
									</c:if> <c:if test="${orderLine.status eq 'CANCELLED'}">
										<spring:theme
											code="account.order.history.orderstatus.cancelled"
											text="Cancelled" />
									</c:if> 
									<c:if test="${orderLine.status eq 'CREATED'}">
											<spring:theme code="account.order.history.orderstatus.created"
												text="In Process" />
									</c:if>
									<c:if test="${orderLine.status eq 'OUT_FOR_DELIVERY'}">
											<spring:theme code="account.order.history.orderstatus.outfordelivery"
												text="Out For Delivery" />
									</c:if>
									<c:if test="${orderLine.status eq 'SENT_TO_FULFILLMENT'}">
										<spring:theme
											code="account.order.history.orderstatus.senttofulfillment"
											text="In Process" />
									</c:if>
									<c:if test="${orderLine.status eq 'HOLD'}">
											<spring:theme code="account.order.history.orderstatus.hold"
												text="Hold" />
									</c:if>
									<c:if test="${orderLine.status eq 'REJECTED'}">
											<spring:theme code="dist.order.history.orderstatus.rejected"
												text="Refusal" />
									</c:if>
									</td> --%>
								<td><c:if test="${orderLine.distributor ne null }">
										${orderLine.b2bCustomerData.name}
										</c:if> <c:if
										test="${orderLine.distributor eq null and orderLine.occ ne null }">
										${orderLine.occ.name}
										</c:if></td>
								<td><select id="status" name="status"
									onchange="document.getElementById('${orderLine.code}').value=this.value;">
										<option id="InProcess" value="In Process"><spring:theme code="dist.order.search.option.inprocess" text="In Process" />
										</option>
										<option id="Delivered"
											<c:if test="${orderLine.status eq 'COMPLETED'}">selected=selected</c:if>
											value="Delivered"><spring:theme code="dist.order.search.option.delivered" text="Delivered" /></option>
										<option id="Cancelled"
											<c:if test="${orderLine.status eq 'CANCELLED'}">selected=selected</c:if>
											value="Cancelled"><spring:theme code="dist.order.search.option.cancelled" text="Cancelled" /></option>
										<option id="OutForDelivery"
											<c:if test="${orderLine.status eq 'OUT_FOR_DELIVERY'}">selected=selected</c:if>
											value="OutForDelivery"><spring:theme code="dist.order.search.option.outfordelivery" text="Out For Delivery" /></option>
										<%-- <option id="Hold"
											<c:if test="${orderLine.status eq 'HOLD'}">selected=selected</c:if>
											value="Hold"><spring:theme code="dist.order.search.option.hold" text="Hold" /></option> --%>
										<option id="Rejected"
											<c:if test="${orderLine.status eq 'REJECTED'}">selected=selected</c:if>
											value="Rejected"><spring:theme code="dist.order.search.option.rejected" text="Refusal" /></option>
										
									
								</select></td>
								<td style="text-align: center;">
								 <c:url value="/my-dashboard/statusUpdate" var="statusUpdateUrl"/>
									<form:form action="${statusUpdateUrl}" method="post" commandName="dashboardOrderForm">
										<form:hidden path="orderNumber" id="orderNumber" value="${orderLine.code}" /> 
											<form:hidden path="orderStatus" id="${orderLine.code}" />											
											<input type="submit" name="submit" value="&#x2714;"
											title="<spring:theme code="dist.order.status.submit" text="Change Status"/> class="orderStatusSubmit" />
									</form:form>
								</td>

							</tr>

						</c:forEach>
					</tbody>
				</table>
				</div>

			</div>
			<!-- /.standard-table.product-table-->

		</div>
		<!-- /.left-nav-companion -->
	</div>
	<!-- /.account -->
</div>
<script>
$(document).ready(function() {
	
    $("#toDate").val('dd/MM/YYYY');
    $("#fromDate").val('dd/MM/YYYY');
    
    /* $('input[id$=toDate]').datepicker({
	    dateFormat: 'dd/mm/yy'
	    
	});
	  
	 $('input[id$=fromDate]').datepicker({
		 dateFormat: 'dd/mm/yy'
	}); */
    
  });  
  
 $('#toDate').datepicker({
	 dateFormat: 'dd/mm/yy',
     autoclose: true
 });
 
 $('#fromDate').datepicker({
	 dateFormat: 'dd/mm/yy',
     autoclose: true
 });
function downloadOrder(downloadUrl)
 {   
	    var orderStatus = $("#orderStatus").val();
    	var fromDate= $("#fromDate").val();
    	var toDate= $("#toDate").val();
    	var valuefromDate = document.getElementById('fromDate').value;
    	var valuetoDate = document.getElementById('toDate').value;
    	if(valuefromDate.length==0)
        {
    		valuefromDate='dd/MM/YYYY';
        }
    	if(valuefromDate=='dd/MM/YYYY' ){
    	  //alert('From date is invalid');
    	}
    	if(valuetoDate.length==0)
        {
    		valuetoDate='dd/MM/YYYY';
        }
    	if(valuefromDate=='dd/MM/YYYY' && valuetoDate=='dd/MM/YYYY')
    	{
    		var fullDate = new Date();
    		var twoDigitMonth = ((fullDate.getMonth().length+1) === 1)? (fullDate.getMonth()+1) :(fullDate.getMonth()+1);
    		toDate= fullDate.getDate()  + "/" + twoDigitMonth + "/" +fullDate.getFullYear();
    		var url=downloadUrl+"?from="+fromDate+"&to="+toDate+"&orderStatus="+orderStatus;
	    	window.location.href=url;
        } else {
		    	var url=downloadUrl+"?from="+fromDate+"&to="+toDate+"&orderStatus="+orderStatus;
		    	window.location.href=url;
       }
   
 }
</script>