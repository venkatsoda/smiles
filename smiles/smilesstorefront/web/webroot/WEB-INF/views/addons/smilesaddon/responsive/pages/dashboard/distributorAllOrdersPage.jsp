<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="org-common"
	tagdir="/WEB-INF/tags/addons/commerceorgaddon/responsive/common"%>
<%@ taglib prefix="company"
	tagdir="/WEB-INF/tags/addons/commerceorgaddon/responsive/company"%>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<spring:htmlEscape defaultHtmlEscape="true" />
<template:page pageTitle="${pageTitle}">
	<div class="account-section">
		<table style="font-size: 12px">
			<thead>
				<tr>
					<th width="20%"><spring:theme
							code="dist.order.history.orderdate" text="Order Date" /></th>
					<th width="17%"><spring:theme
							code="dist.order.history.ordernumber" text="Order Number" /></th>
					<th width="18%"><spring:theme code="dist.order.history.total"
							text="Order Total" /></th>

					<th width="13%"><spring:theme
							code="dist.order.history.orderstatus" text="Order Status" /></th>
					<%-- <th width="20%"><spring:theme
							code="dist.order.history.fulfilledBy" text="Fulfilled By" /></th> --%>
					<th width="20%"><spring:theme
							code="dist.order.history.orderstatus" text="Change Status" /></th>
					<th width="5%"><spring:theme code="dist.customer.action"
							text="Action" />&nbsp;&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty orderHistoryList}">
					<spring:theme code="dist.order.nosearch"
						text="Sorry, No Orders Found!" />
				</c:if>
				<c:set var="now" value="<%=new java.util.Date()%>" />
				<c:forEach items="${orderHistoryList}" var="orderLine"
					varStatus="loop">


					<tr class="${loop.index %2 == 0 ? '' : 'alt-color' }">
						<td class="no-text-wrap"><fmt:setTimeZone value="GMT-3" /> <fmt:formatDate
								type="both" value="${orderLine.created}" timeStyle="short" /></td>
						<td><a
							href="<c:url value="order-detail/${orderLine.code}" />"
							class="icon-link">${orderLine.code} </a></td>
						<td class="no-text-wrap"><format:price
								priceData="${orderLine.totalPrice}" displayFreeForZero="false" /></td>
								<td class="orderStatusText">
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
									</td>
<!-- status update -->
						<%-- <c:url value="/my-dashboard/statusUpdate" var="statusUpdateUrl" />
						<form:form name="dashboardOrderForm"
							id="dashboardOrderForm-${orderLine.code}"
							action="${statusUpdateUrl}" method="post"
							commandName="dashboardOrderForm">
							<input type="hidden" id="orderNumber" name="orderNumber"
								value="${orderLine.code}" />
							<input type="hidden" id="orderStatus" name="orderStatus" />
							<input type="hidden" id="reason" name="reason" />
							<td>
								<div id="reasonValidation${orderLine.code}"
									style="display: block; color: #da291b; font-weight: bold;"></div>
								<c:choose>
									<c:when test="${orderLine.status eq 'REJECTED'}">
										<select id="reason${orderLine.code}"
											name="reason${orderLine.code}"
											onchange="reasonOnchange('${orderLine.code}',this);">
											<option id="DO" value="Out of Stocks"
												<c:if test="${orderLine.statusReason eq 'Out of Stocks'}">selected=selected</c:if>>Out
												of Stocks</option>
											<option id="ICD" value="Duplicate Order"
												<c:if test="${orderLine.statusReason eq 'Duplicate Order'}">selected=selected</c:if>>Duplicate
												Order</option>
											<option id="FBD" value="Credit Limit exhausted"
												<c:if test="${orderLine.statusReason eq 'Credit Limit exhausted'}">selected=selected</c:if>>Credit
												Limit exhausted</option>
											<option id="Customer not servicable"
												value="Customer not servicable"
												<c:if test="${orderLine.statusReason eq 'Customer not servicable'}">selected=selected</c:if>>Customer
												not servicable</option>
										</select>
									</c:when>
									<c:otherwise>

										<select id="reason${orderLine.code}"
											name="reason${orderLine.code}" disabled
											onchange="reasonOnchange('${orderLine.code}',this);">

											<c:choose>
												<c:when test="${orderLine.status eq 'CANCELLED'}">
													<option id="Cancelled" value="${orderLine.statusReason}">${orderLine.statusReason}</option>


												</c:when>

												<c:otherwise>
													<option id="DO" value="Select Reason">Select
														Reason</option>

												</c:otherwise>
											</c:choose>


										</select>

									</c:otherwise>
								</c:choose>


							</td>
							<td style="text-align: center;"><input type="button"
								name="submit" class="orderStatusSubmit" value="&#x2714;"
								title="Change Status"
								onclick="validateStatusReason('${orderLine.status}','${orderLine.code}',this)">


							</td>

						</form:form>
 --%>
					</tr>

				</c:forEach>
			</tbody>
		</table>
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
</template:page>
