<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/desktop/template"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme"%>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="breadcrumb" tagdir="/WEB-INF/tags/responsive/nav/breadcrumb"%>

<breadcrumb:breadcrumb breadcrumbs="${breadcrumbs}" />
<div id="wrapper">
    <div id="first">
		<div class="section-header"><spring:theme code="dist.inventory.view"/></div>
		<div class="downUp downup-1 left">
			<div class="upload-inventory" align="left">
				<div class="all-products-btns">
					<span class="download-inventory download-btn">
						<c:url value="/my-dashboard/download-inventory" var="downloadInventoryUrl" />
						<a href="${downloadInventoryUrl}"><spring:theme code="dist.inventory.download" text="Download Inventory" /></a>
					</span>
					<span class="upload-btn">
						<span><spring:theme code="dist.inventory.upload" text="Upload Inventory" /></span>
					</span>
				</div>
				
				<div class="uploadPopup" >
					<c:url value="/my-dashboard/upload-inventory?CSRFToken=${CSRFToken.token}" var="uploadInventoryUrl" />
					<form action="${uploadInventoryUrl}" method="post"
						enctype="multipart/form-data">
						<input type="file" name="file" size="50" /> <input type="hidden"
							name="CSRFToken" value="${CSRFToken.token}" /><input
							type="submit" value="<spring:theme code="dist.upload.file"/>" />
							<b class="close-upload">X</b>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div id="second" >
		<div class="section-header"><spring:theme code="dist.price.view" /></div>
	
		<div class="downUp downup-1">
			<div class="upload-pricing" align="left">
				<div class="all-products-btns">
					<span class="download-pricing download-btn">
						<c:url value="/my-dashboard/download-pricing" var="downloadPricingUrl" />
						<a href="${downloadPricingUrl}"> <spring:theme code="dist.price.download" text="Download Pricing" /></a>
					</span>
					<span class="upload-btn">
						<span><spring:theme code="dist.price.upload" text="Upload Pricing" /></span>
					</span>
				</div>
				
				<div class="uploadPopup">
					<c:url value="/my-dashboard/upload-pricing?CSRFToken=${CSRFToken.token}" var="uploadPricingUrl" />
					<form action="${uploadPricingUrl}" method="post"
						enctype="multipart/form-data">
			
						<input type="file" name="file" size="50" /> <input type="hidden"
							name="CSRFToken" value="${CSRFToken.token}" /> <input
							type="submit" value="<spring:theme code="dist.upload.file"/>" />
							<b class="close-upload">X</b>
					</form>
					<div><spring:theme code="dist.price.visible" /></div>
				</div>
				
			</div> 
		</div>
	</div>
</div>
	
<style> 

#wrapper {
  width:100%;
  clear:both;
  display: inline-block;
  padding-top: 20px;
}
#first {
  width: 49%;
  float:left;
  border: 1px solid #c00;
}
#second {
  width: 49%;
  float: right;
  border: 1px solid #c00;
}
#first .downUp, #second .downUp {
	padding: 10px;
}
#first .downUp input[type=file], #second .downUp input[type=file] {
	width: 50%;
    float: left;
    margin-right: 10px;
}
.uploadPopup {
	display: none;
}
.uploadPopup form {
	padding: 5px 0;
}
.section-header {
	background: #da291b;
    color: #fff;
    font-weight: bold;
    padding: 10px;
}
@media (max-width: 639px) {
	#first {
	  width: 100%;
	  float:none;
	  border: 1px solid #c00;
	}
	#second {
	  width: 100%;
	  float:none;
	  border: 1px solid #c00;
	  margin-top: 10px;
	}
	#first .downUp input[type=file], #second .downUp input[type=file] {
		width: 100%;
	    float: none;
	    margin-right: 10px;
	}
	#first .downUp input[type=submit], #second .downUp input[type=submit] {
		width: 89%;
	    margin-top: 10px;
	}
}
</style>	
