<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/responsive/common"%>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


	<div id="globalMessages">
		<common:globalMessages />
	</div>

	<div class="account accDetails">
		<div class="accOrderDetails clearfix">
			<div class="left span-16">
				<h4>
					<spring:theme code="dist.order.details" text="Order Details"/>
				</h4>
				<div>
						<span><spring:theme code="dist.order.detail.ordernumber" text="Order Number"/></span>: ${orderNumber}
				</div>
				<div>
					
					<span><spring:theme code="dist.order.detail.orderplaced"
						text="Order placed on" /></span>: 
					<%-- <fmt:setTimeZone value="Asia/Manila" /> --%>
					<fmt:formatDate type="both" value="${orderData.created}" />
				</div>
				<%-- <div>
				<c:if test="${not empty paymentterms}">
					<span><spring:theme code="checkout.summary.paymentMethod.header"  htmlEscape="false" />
												</span>:
						 <c:if test="${paymentterms eq 'COD'}">
									<spring:theme code="dist.account.paymentterm.cod"
										text="Cash On Delivery" />
								</c:if>
								<c:if test="${paymentterms eq 'D7'}">
									<spring:theme code="dist.account.paymentterm.7day"
										text="7 Day Credit" />
								</c:if>
								<c:if test="${paymentterms eq 'D14'}">
									<spring:theme code="dist.account.paymentterm.14day"
										text="14 Day Credit" />
								</c:if>
								<c:if test="${paymentterms eq 'D20'}">
									<spring:theme code="dist.account.paymentterm.30day"
										text="30 Day Credit" />
								</c:if>
				</c:if>
				</div> --%>
			</div>
			<div class="left">
				<h4>
					<spring:theme code="dist.order.detail.shippingaddress"
						text="Shipping Details" />
				</h4>
				<div>
					<span><spring:theme code="dist.order.detail.shipto.name" text="Name" /></span>: <c:if test="${not empty shipTo.firstName}">${shipTo.firstName}&nbsp;</c:if> ${shipTo.lastName}
				</div>
				<c:if test="${not empty shipTo.line1}">
					<div>
						<span><spring:theme code="dist.order.detail.shipto.addline1" text="AddressLine1" /></span>: ${shipTo.line1}
					</div>	
				</c:if>
				<c:if test="${fn:length(addressData.line2) > 0}">
					<div>
						<span><spring:theme code="dist.order.detail.shipto.addline2" text="AddressLine2" /></span>: ${addressData.line2}
					</div>
				</c:if>
					<%-- <c:if test="${not empty shipTo.formattedAddress}">${shipTo.formattedAddress}&nbsp;</c:if> --%>
					<div>
						<span><spring:theme code="dist.order.detail.shipto.town" text="Town" /></span>: ${shipTo.town}
					</div>
					<div>
						<span><spring:theme code="dist.order.detail.shipto.zipcode" text="ZipCode" /></span>: ${shipTo.postalCode}
					</div>
					<div>
						<span><spring:theme code="dist.order.detail.shipto.country" text="Country" /></span>: ${shipTo.country.name}
					</div>
					<c:if test="${orderData.status eq 'REJECTED' || orderData.status eq 'CANCELLED' }">
					<div>
						<span>Status Reason</span>: ${orderData.statusReason}
					</div></c:if>
					
				</div>
						<c:if test="${not empty promoCode}">
							<h4>
								<spring:theme code="dist.order.detail.promocode"
									text="Promo Code" />
							</h4>
							<p>${promoCode}</p>
						</c:if>
						
			</div>
		</div>
		<div class="historytablediv">
		<table>
			<thead>
				<tr>
					<th width="25%"><spring:theme code="dist.order.detail.productnumber"
							text="Product Number/SKU" /></th>
					<th width="35%"><spring:theme code="dist.order.detail.productname"
							text="Product Name" /></th>
					<th width="10%"><spring:theme code="dist.order.detail.quantity"
							text="Quantity" /></th>
					<th width="15%"><spring:theme code="dist.order.detail.price"
							text="Price" /></th>
					<th class="denomination" style="text-align: left"><spring:theme code="account.order.detail.uom"
							text="UOM" /></th>
					<th width="15%" class="denomination" style="text-align: left"><spring:theme
							code="account.order.detail.subtotal" text="Subtotal" /></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderItems}" var="orderItem" varStatus="loop">
					<tr class="${loop.index %2 == 0 ? '' : 'alt-color' }">					
						<td>
						<c:set var="uom" value="PC"/>
						<c:forEach items="${cPProducts}" var="cPProduct" varStatus="loop">
								 <c:if test="${cPProduct.code == orderItem.product.code}">								 		
								 		<c:set var="uom" value="${cPProduct.salesUnit}"/>
								 </c:if>
								</c:forEach>
							
								${orderItem.product.code}
													
						</td>
						<td><%-- <a href="<c:url value="/p/${orderItem.product.code}"/>"> --%>${orderItem.product.name}</td>
						<td style="width: 100px;"><fmt:formatNumber
								value="${orderItem.quantity}"
								type="number" maxFractionDigits="0" /></td>

						<td class="denomination" style="text-align: left"><fmt:formatNumber
								value="${orderItem.basePrice.value}" type="currency"
								currencySymbol="${currentCurrency.symbol}" pattern="¤ #.##"
								minFractionDigits="2" /></td>

						<td>${uom}</td>

						<td class="denomination" style="text-align: left"><fmt:formatNumber
								value="${orderItem.totalPrice.value}" type="currency"
								currencySymbol="${currentCurrency.symbol}" pattern="¤ #.##"
								minFractionDigits="2" /></td>
					</tr>
				</c:forEach>
			</tbody>
			<tbody class="totals">
			<tr> <td colspan="4" style="font-weight: normal; font-size: 12px">
						</td>
					<td><b><spring:theme code="account.order.detail.total"
							text="Delivery" /></b></td>

					<td class="denomination" style="text-align: left"><b><fmt:formatNumber
							value="${orderData.deliveryCost.value}" type="currency"
							currencySymbol="${currentCurrency.symbol}" pattern="¤ #.##"
							minFractionDigits="2" /></b></td></tr>
			
<tr> <td colspan="4" style="font-weight: normal; font-size: 12px">
						</td>
					<td><b><spring:theme code="account.order.detail.total"
							text="Tax" /></b></td>

					<td class="denomination" style="text-align: left"><b><fmt:formatNumber
							value="${tax.value}" type="currency"
							currencySymbol="${currentCurrency.symbol}" pattern="¤ #.##"
							minFractionDigits="2" /></b></td></tr>
				<tr class="total">
					<td colspan="4" style="font-weight: normal; font-size: 12px"></td>
					<td><b><spring:theme code="account.order.detail.total"
							text="Total" /></b></td>

					<td class="denomination" style="text-align: left"><b><fmt:formatNumber
							value="${total.value}" type="currency"
							currencySymbol="${currentCurrency.symbol}" pattern="¤ #.##"
							minFractionDigits="2" /></b></td>
				</tr>
			</tbody>
		</table>
		</div>
