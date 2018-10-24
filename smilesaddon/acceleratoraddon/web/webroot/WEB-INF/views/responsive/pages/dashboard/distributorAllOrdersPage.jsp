<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template" %>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="org-common" tagdir="/WEB-INF/tags/addons/commerceorgaddon/responsive/common" %>
<%@ taglib prefix="company" tagdir="/WEB-INF/tags/addons/commerceorgaddon/responsive/company" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

				 <th width="13%"><spring:theme code="dist.order.history.orderstatus"
									text="Order Status" /></th> 
					<th width="20%"><spring:theme
							code="dist.order.history.fulfilledBy" text="Fulfilled By" /></th>
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



						<%-- <td><c:if test="${orderLine.distributor ne null }">
										${orderLine.b2bCustomerData.name}
										</c:if> <c:if
								test="${orderLine.distributor eq null and orderLine.occ ne null }">
										${orderLine.occ.name}
										</c:if></td> --%>


					</tr>

				</c:forEach>
			</tbody>
		</table>
	</div>
</template:page>
