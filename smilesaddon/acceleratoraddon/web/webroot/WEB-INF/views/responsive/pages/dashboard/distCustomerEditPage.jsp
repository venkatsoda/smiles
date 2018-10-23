<%@page import="com.cp.core.enums.PaymentTermsType"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/desktop/template" %>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/desktop/nav" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/desktop/common" %>
<template:page pageTitle="${pageTitle}">


	<div id="globalMessages">
		<common:globalMessages/>
	</div>
	<div class="cusListheader">
		Customers Details
	</div>
		<form name="registerForm" action="${pageContext.servletContext.contextPath}/my-account/savecustomer/${b2Bcustomer.uid}"  method='POST'>
		<input type="hidden" name="CSRFToken" value="${CSRFToken}" />
		<div class="customerEdit">
			<div class="left custedittd">
				<span>
					<spring:theme code="dist.account.customer.name" text="CustomerName"/>
				</span>
				<input type="text" name="CustomerName" value="${b2Bcustomer.name}"  readonly="readonly" disabled="disabled">	
			</div>
			<div class="left custedittd">
				<span>
					<spring:theme code="dist.account.customer.firstname" text="CustomerFirstName"/>
				</span>
				<input type="text" name="FirstName" value="${b2Bcustomer.firstName}"  readonly="readonly" disabled="disabled"/>	
			</div>
			<div class="left custedittd">
				<span>
					<spring:theme code="dist.account.customer.lastname" text="CustomerLastName"/>
				</span>
				<input type="text" name="LastName" value="${b2Bcustomer.lastName}"  readonly="readonly"  disabled="disabled"/>
			</div>
			<div class="left custedittd">
				<span>
					<spring:theme code="dist.account.customer.email" text="CustomerEmail"/>
				</span>
				<input type="text" name="email"  readonly="readonly" value="${b2Bcustomer.email}" disabled="disabled"/>
			</div>
			<div class="left custedittd">
				<span>
					<spring:theme code="dist.account.customer.streetno" text="CustomerStreetNumber"/>
				</span>
				<input type="text" name="customerStreetNo" value="${b2Bcustomer.defaultShipmentAddress.streetnumber}"/>
			</div>
			<div class="left custedittd">
				<span>
					<spring:theme code="dist.account.customer.streetname" text="CustomerStreetName"/>
				</span>
				<input type="text" name="customerStreetName" value="${b2Bcustomer.defaultShipmentAddress.streetname}"/>
			</div>
			<div class="left custedittd">
				<span>
					<spring:theme code="dist.account.customer.cityname" text="City/Municipality"/>
				</span>
				<input type="text" name="customerTown" value="${b2Bcustomer.city}" readonly="readonly"  disabled="disabled" />
			</div>
			<div class="left custedittd">
				<span>
					<spring:theme code="dist.account.customer.countryname" text="CustomerCountryName"/>
				</span>
				<input type="text" name="CustomerCountryName" value="${b2Bcustomer.defaultShipmentAddress.country.name}"/>
			</div>
			<div class="left custedittd">
				<span>
					<spring:theme code="dist.account.customer.postalcode" text="CustomerPostCode"/>
				</span>
				<input type="text" name="customerPostalCode" value="${b2Bcustomer.defaultShipmentAddress.postalcode}"/>
			</div>
			<div class="left custedittd">
				<span>
					<spring:theme code="dist.account.customer.contactperson" text="ContactPersonName"/>
				</span>
				<input type="text" name="contactPersonName" value="${b2Bcustomer.defaultB2BUnit.contactPersonName}"/>
			</div>
			<div class="left custedittd">
				<span>
					<spring:theme code="login.email" text="Mobile No"/>
				</span>
				<input type="text" name="mobilePhoneNumber" value="${b2Bcustomer.uid}" readonly="readonly" disabled="disabled"/>
			</div>
			<div class="left custedittd">
				<span>
					<spring:theme code="dist.account.customer.code" text="CustomerCode"/>
				</span>
				<input type="text" name="customerCode" value="${b2Bcustomer.defaultB2BUnit.CRMCustomerNumber}"/>
			</div>
			<div class="left custedittd">
				<span>
					<spring:theme code="dist.account.customer.taxno" text="TaxNo"/>
				</span>
				<input type="text" name="customerTaxNo" value="${b2Bcustomer.defaultB2BUnit.taxNo}"/>
			</div>
			<div class="left custedittd">
				<span>
					<spring:theme code="dist.account.customer.vatno" text="VatNo"/>
				</span>
				<input type="text" name="customerVatRegNo" value="${b2Bcustomer.defaultB2BUnit.vatID}"/>
			</div>
			
			    <c:forEach items="${b2Bcustomer.defaultB2BUnit.salesRepresentatives}" var="reps">
			    
        <div class="left custedittd">
				<span>
					<spring:theme code="dist.account.customer.salesrepo.contactNumber" text="Sales SalesRepresentative ContactNumber"/>
				</span>
				<input type="text" name="salesRepresentiveContactNumber" value="${reps.contactNumber}"/>
			</div>
			<div class="left custedittd">
				<span>
					<spring:theme code="dist.account.customer.salesrepo.email" text="Sales SalesRepresentative Email"/>
				</span>
				<input type="text" name="salesRepresentiveEmail" value="${reps.email}"/>
			</div>
			     
        </c:forEach>
  
			<div class="left custedittd">
				<span>
					<spring:theme code="dist.account.salesrepo.name" text="List Of SalesRepresentatives"/>
				</span>
				<select name="salesRepresents" id="salesRepresents">
				<option value="" selected="selected" disabled="disabled">Please Select </option>
		          <c:forEach var="salerep" items="${distb2bunit.salesRepresentatives}">
		            <option value="${salerep.custNumOfBusPartnerERP}" <c:if test="${b2bunit.salesRepresentatives.contains(salerep)}">selected="selected"</c:if> >${salerep.partnerName1}</option>
		          </c:forEach>
		        </select>
			</div>
			<div class="left custedittd">
				<span>
					<spring:theme code="dist.account.customer.transportzone" text="Route Code"/>
				</span>
						<%-- <input type="text" name="transportationZone" value="${b2Bcustomer.defaultB2BUnit.transportationZone}"> --%>
						
						<select class="form-control" name="transportationZone" id="transportationZone">
						<option value="" selected="selected" disabled="disabled">Please Select </option>
							<c:if test="${not empty routes}">
								<c:forEach var="route" items="${routes}">
					            	<option value="${route.routeCode}" <c:if test="${b2bunit.transportationZone eq route.routeCode}">selected="selected"</c:if> >${route.routeDescription}</option>
					         	 </c:forEach>
				         	 </c:if>
						</select>
			</div>
			
			<div class="left custedittd">
				<span>
					<spring:theme code="dist.account.paymentterm.name" text="Payment Term"/>
				</span>
				<c:set var="paymentTermenumValues" value="<%=PaymentTermsType.values()%>"/>
				<select name="paymentTerm" id="paymentTerm">
		          <c:forEach var="paymentTerm" items="${paymentTermenumValues}">
		            <option value="${paymentTerm}" <c:if test="${b2bunit.paymentTerms eq paymentTerm}">selected="selected"</c:if> >
		            <c:if test="${paymentTerm eq 'COD'}">
		            	<spring:theme code="dist.account.paymentterm.cod" text="Cash On Delivery"/>
		            </c:if>
		            <c:if test="${paymentTerm eq 'D7'}">
		            	<spring:theme code="dist.account.paymentterm.7day" text="7 Day Credit"/>
		            </c:if>
		            <c:if test="${paymentTerm eq 'D14'}">
		            	<spring:theme code="dist.account.paymentterm.14day" text="14 Day Credit"/>
		            </c:if>
		            <c:if test="${paymentTerm eq 'D30'}">
		            	<spring:theme code="dist.account.paymentterm.30day" text="30 Day Credit"/>
		            </c:if>
		            </option>
		          </c:forEach>
		        </select>
			</div>
			</div>
			<div class="customerBtn">
				<input type="submit" value="Save">
			</div>
		</form>
		
		
</template:page>
