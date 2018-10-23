<%@page import="com.cp.core.enums.PaymentTermsType"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/responsive/common" %>
<%@ taglib prefix="formElement"	tagdir="/WEB-INF/tags/responsive/formElement"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>




	<div id="globalMessages">
		<common:globalMessages/>
	</div>
	<div class="cusListheader">
		<spring:theme code="dist.cust.details" text="Customers Details" />
	</div>
	<form:form action="savecustomer" method="post" commandName="dashboardCustomerForm">
		<div class="cust-details-edit-wrapper">
			<div class="left custedittd">
			 <input type="hidden" name="customerUid" id="customerUid"
												value="${b2Bcustomer.uid}" />
				<form:label path="customerName"><spring:theme code="dist.edit.customer.name" text="CustomerName"/></form:label>
				<form:input id="customerName" path="customerName" class="text form-control"  readonly="true" inputCSS="text" mandatory="true" value="${b2Bcustomer.name}"/> 
			</div>
			<div class="left custedittd">
				<form:label path="firstName"><spring:theme code="dist.edit.customer.firstname" text="Customer FirstName"/></form:label>
				<form:input id="firstName" path="firstName" class="text form-control" readonly="true" inputCSS="text" mandatory="true" value="${b2Bcustomer.firstName}"/> 
			</div>
			<div class="left custedittd">
				<form:label path="lastName"><spring:theme code="dist.edit.customer.lastname" text="Customer LastName"/></form:label>
				<form:input id="lastName" path="lastName" class="text form-control" readonly="true" inputCSS="text" mandatory="true" value="${b2Bcustomer.lastName}"/> 
			</div>
			<div class="left custedittd">
				<form:label path="email"><spring:theme code="dist.edit.customer.mail" text="Customer Email"/></form:label>
				<form:input id="email" path="email" class="text form-control" readonly="true" inputCSS="text" mandatory="true" value="${b2Bcustomer.email}"/> 
			</div>
			<div class="left custedittd">
				<form:label path="customerStreetNo"><spring:theme code="dist.edit.customer.streetno" text="StreetNumber"/></form:label>
				<form:input id="customerStreetNo" path="customerStreetNo" class="text form-control" readonly="true" disabled="disabled" inputCSS="text" mandatory="true" value="${b2Bcustomer.defaultShipmentAddress.streetnumber}"/> 
			</div>
			<div class="left custedittd">
				<form:label path="customerStreetName"><spring:theme code="dist.edit.customer.streetname" text="StreetName"/></form:label>
				<form:input id="customerStreetName" path="customerStreetName" class="text form-control" readonly="true" disabled="disabled" inputCSS="text" mandatory="true" value="${b2Bcustomer.defaultShipmentAddress.streetname}"/> 
			</div>
			<div class="left custedittd">
				<form:label path="customerCity"><spring:theme code="dist.edit.customer.cityname" text="City/Municipality"/></form:label>
				<form:input id="customerCity" path="customerCity" class="text form-control" readonly="true" disabled="disabled" inputCSS="text" mandatory="true" value="${b2Bcustomer.city}"/> 
			</div>
			<div class="left custedittd">
				<form:label path="customerCountry"><spring:theme code="dist.edit.customer.countryname" text="CountryName"/></form:label>
				<form:input id="customerCountry" path="customerCountry" class="text form-control" readonly="true" disabled="disabled" inputCSS="text" mandatory="true" value="${b2Bcustomer.defaultShipmentAddress.country.name}"/> 
			</div>
			<div class="left custedittd">
				<form:label path="customerPostalCode"><spring:theme code="dist.edit.customer.zipcode" text="ZipCode"/></form:label>
				<form:input id="customerPostalCode" path="customerPostalCode" class="text form-control" readonly="true" inputCSS="text" mandatory="true" value="${b2Bcustomer.defaultShipmentAddress.postalcode}"/> 
			</div>
<%-- 			<div class="left custedittd">
				<form:label path="contactPersonName"><spring:theme code="dist.edit.customer.contactperson" text="ContactPersonName"/></form:label>
				<form:input id="contactPersonName" path="contactPersonName" class="text form-control" readonly="true" disabled="disabled" inputCSS="text" mandatory="true" value="${b2Bcustomer.defaultB2BUnit.contactPersonName}"/> 
			</div> --%>
			<div class="left custedittd">
				<form:label path="mobilePhoneNumber"><spring:theme code="dist.edit.customer.contactpersonumber" text="Mobile No"/></form:label>
				<form:input id="mobilePhoneNumber" path="mobilePhoneNumber" class="text form-control" readonly="true" inputCSS="text" mandatory="true" value="${b2Bcustomer.primaryPhoneNumber}"/> 
			</div>
<%-- 			<div class="left custedittd">
				<form:label path="customerCode"><spring:theme code="dist.edit.customer.code" text="CustomerCode"/></form:label>
				<form:input id="customerCode" path="customerCode" class="text form-control" readonly="true" disabled="disabled" inputCSS="text" mandatory="true" value="${b2Bcustomer.defaultB2BUnit.CRMCustomerNumber}"/> 
			</div> --%>
			<div class="left custedittd">
				<form:label path="storeCode"><spring:theme code="dist.edit.store.code" text="storeCode"/></form:label>
				<form:input id="storeCode" path="storeCode" class="text form-control" readonly="true" disabled="disabled" inputCSS="text" mandatory="true" value="${b2Bcustomer.defaultB2BUnit.uid}"/> 
			</div>
			<div class="left custedittd">
				<form:label path="storeName"><spring:theme code="dist.edit.store.name" text="storeName"/></form:label>
				<form:input id="storeName" path="storeName" class="text form-control" readonly="true" disabled="disabled" inputCSS="text" mandatory="true" value="${b2Bcustomer.defaultB2BUnit.contactPersonName}"/> 
			</div>
			<div class="left custedittd">
				<form:label path="pwd"><spring:theme code="register.pwd" text="Password"/></form:label>
				<form:password cssClass="form-control" id="pwd" path="pwd" autocomplete="off" placeholder="O comprimento mínimo é de 8 caracteres" /> 
			</div>  
			<div class="left custedittd">
				<formElement:formSelectBox idKey="customerTypeOfStore" labelKey="register.customerTypeOfStore" path="customerTypeOfStore" selectCSSClass="form-control"
					skipBlank="false" skipBlankMessageKey="form.select.empty" items="${retype}"	mandatory="true" selectedValue="${reGroup}"/>
			</div>
			<h1 class="custselval">${reGroup} </h1>
			<div class="left custedittd">
				<form:label path="serviceable"><spring:theme code="dist.edit.customer.serviceable" text="Serviceable"/></form:label>
					<c:choose>
						<c:when test="${b2Bcustomer.serviceable}">
							&nbsp; &nbsp;<form:checkbox id="serviceable" name="serviceable" path="serviceable" checked="checked"/>
						</c:when>
						<c:otherwise>
							&nbsp; &nbsp;<form:checkbox id="serviceable" name="serviceable" path="serviceable"/>
						</c:otherwise>
					</c:choose>
			</div>
<!-- 			<div class="customerBtn"> -->
			<div>
				<input type="submit" class="btn save-cust-edit" value="Save">
			</div>
		</div>
	</form:form>
		
		


<style>
	@media (min-width: 1024px) {
		.custedittd:nth-of-type(odd){
			width: 50%;
			float: left;
			padding: 10px 10px 0 50px;
		}
		.custedittd:nth-of-type(even){
			width: 50%;
			float: right;
			padding: 10px 50px 0 10px;
		}
	}
	
	.cust-details-edit-wrapper{
		border: 1px solid #ccc;
		border-radius: 10px;
		padding: 5px;
	}
	.customerBtn {
		text-align: center;
	}
	
	.customerBtn .save-cust-edit {
		margin-top: 10px;
		width: 150px;
		height: 40px;
	}
</style>
<script type="text/javascript">
$('.custselval').hide();
$('#customerTypeOfStore').val($('.custselval').html());

 </script>
