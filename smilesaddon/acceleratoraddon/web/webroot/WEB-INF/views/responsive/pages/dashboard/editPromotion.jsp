<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="formElement"	tagdir="/WEB-INF/tags/responsive/formElement"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="breadcrumb" tagdir="/WEB-INF/tags/responsive/nav/breadcrumb"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value="/static/css/jquery-ui/jquery-ui.min.css" />" type="text/css" media="screen, projection"/>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="${commonResourcePath}/js/jquery-3.2.1.min.js"></script>

<spring:htmlEscape defaultHtmlEscape="true" />
<style>
.container{width:1024px;border:1px solid #ccc;margin-top:50px;border-radius:10px;padding:10px;}
.createcustitle{color:#154259;font-size:24px;line-height:35px;font-weight:700;padding:10px 0;margin:0;}
.fieldmandatorytitle{padding-left:10px}
#CustompromoForm #promoImage {border:none;box-shadow:none;}
#CustompromoForm textarea{min-height:115px;height:115px;}
#imagepreview{width:200px;height:auto;display:block;border:1px solid #eee;}
.form-row{clear:both;}
.submitCustompromoForm{text-align:center;margin-top:30px;}
#submitCustompromoForm{margin:0 auto;}
.lightmodalscreen{background:rgba(0,0,0,0.45) none repeat scroll 0 0;display:none;height:100%;left:0;position:fixed!important;top:0;width:100%;z-index:500}
.checkforactions{background-color:#fff;text-align:center;padding:1.875em;display:none;height:auto;left:52%;margin-left:-20%;position:fixed;top:15%;width:30%;text-align:center;border:2px solid #cccccc;border-radius:13px;z-index:520;box-shadow:2px 3px 10px #cccccc}
.yesorcancelbtn{margin-top:20px;}
.promoquantityvalue{box-shadow:5px 0 5px -5px #ccc;}
.promoquantityvalue:before{box-shadow:-15px 0 7px -15px inset #ccc;left:-15px;position:absolute;top:0;width:15px;height:100%;content:"";}
body.page-customPromotions #ui-datepicker-div .ui-icon-circle-triangle-e,body.page-customPromotions #ui-datepicker-div .ui-icon-circle-triangle-w{display:none}
body.page-customPromotions .ui-autocomplete.ui-menu .ui-menu-item{font-size:.75em;padding:6px 1em 6px .4em;}
body.page-customPromotions .ui-autocomplete.ui-menu .ui-menu-item:nth-child(2n) {background-color:#eee;}
.close-popup{background:#000 none repeat scroll 0 0;border:2px solid #ccc;border-radius:15px;color:#ccc;cursor:pointer;font-size:1.5em;font-weight:700;line-height:1;padding:3px 3px 2px 4px;position:absolute;right:-1em;top:-1em;width:1.5em;height:1.5em;}
#checkforconditionsyesnobtn,#checkforactionyesnobtn{display:none;}
.rmmgnbtm{margin-bottom:0}
.rmmgntop h4{margin-top:0}
.error{color:red}
.texterror{border:1px solid red !important}
.form-control[readonly],input:read-only{background-color:#fff;cursor:pointer;color:#000}
.autocomplete{position:relative;display:inline-block}
.autocomplete-items{position:absolute;border:1px solid #d4d4d4;border-bottom:none;border-top:none;z-index:99;top:100%;left:0;right:0}
.autocomplete-items div{padding:10px;cursor:pointer;background-color:#fff;border-bottom:1px solid #d4d4d4}
.autocomplete-items div:nth-child(2n){background-color:#eee}
.autocomplete-items div:hover{background-color:#e9e9e9}
.autocomplete-active{background-color:#1e90ff!important;color:#fff}
.addingnewactiondiv .autocomplete-items,.addingnewconditiondiv .autocomplete-items{top:90%;width:87%;margin:0 15px;}
</style>   
<div class="container">
  <h2 class="createcustitle">View/Edit Customized Promotions</h2>
  <p class="fieldmandatorytitle">The below Fields to be filled</p>
  <form  method="get" id="viewOrEditPromoForm" commandName="viewOrEditPromoForm" action="update-CustompromoForm">
     

     <c:forEach items="${listCPPromotion}" var="cpPromo">
   
 	  <div class="form-row">
	    <div class="form-group col-md-6">
	      <label for="promoType"><spring:theme code="custom.promo.type" /></label>
	      <select class="form-control" id="promoType" name="promoType" disabled>
	         <option>${cpPromo.promoType}</option>
	        
          </select>
	    </div>
	  <div class="form-group col-md-6">
	      <label for="promoCode"><spring:theme code="custom.promo.code" /> </label>
	      <input class="form-control" id="promo" name="promo" type="text" disabled value="${cpPromo.promoCode}">
	    </div>	    
     </div>   
     <input type="hidden" value="${cpPromo.promoCode}" name="promoCode">
	 <div class="form-row">
	<div class="autocomplete form-group col-md-12">
      <label for="promoUserGroup"><spring:theme code="custom.promo.usergroup"  />  </label>
      
      <c:forEach items="${cpPromo.customerGroup}" var="custGrpList">
   
 	<input class="form-control" id="promoUserGroup" name="promoUserGroup" disabled value="${custGrpList.locName}(${custGrpList.uid})" type="text">
      
	</c:forEach>
      
      
    </div></div>
 <div class="form-row">
    <div class="form-group col-md-12">
  		<label for="promoDescription"><spring:theme code="custom.promo.description" /></label>
      <input class="form-control" id="promoDescription" name="promoDescription" disabled value="${cpPromo.promoDescription}" type="text">
	</div></div>

	
    <div class="form-row">
    <div class="form-group col-md-12">
      <label for="promoMessage"><spring:theme code="custom.promo.message" /> </label>
  		<input class="form-control" id="promoMessage" name="promoMessage" disabled value ="${cpPromo.promoMessage}" maxlength="150"></input>
    </div></div>
   
   <%--  <div class="form-row">
	    <div class="form-group col-md-6"> 
	      <label for="promoImage"><spring:theme code="custom.promo.image" /> </label>
	      <input class="form-control" id="promoImage" name="promoImage" type="file" accept="image/*">
	    </div>		    
	    <div class="form-group col-md-6">
	      <label for="promoImage">Image Preview </label>
	    	<span class="imagepreview"></span>
	    </div>
	 </div> --%>
    
    <div class="form-row">
	    <div class="form-group col-md-6">
	      <label for="promoFromDate"><spring:theme code="custom.promo.Validity" /> - Start Date </label>	      
	      <input class="form-control"  id="promoFromDate"  name="promoFromDate"  value ="<fmt:formatDate type="date" value="${cpPromo.promoStartDate}" pattern="MM/dd/yyyy"/>" type="text" onclick="return false;">
	    </div>
	    <div class="form-group col-md-6">
	      <label for="promoEndDate"><spring:theme code="custom.promo.Validity" /> - End Date</label>
	      <input class="form-control"  id="promoEndDate" name="promoEndDate"  value="<fmt:formatDate type="date" value="${cpPromo.promoEndDate}" pattern="MM/dd/yyyy"/>" type="text">
	    </div>
	 </div>
	    <div class="form-group col-md-12">
	      <label for="promoPriority"><spring:theme code="custom.promo.priority" /> </label>
	      <input class="form-control" id="promoPriority" name="promoPriority" disabled value ="${cpPromo.promoPriority}" type="text">
	    </div>
	   
	    
	<c:choose>
	<c:when test="${cpPromo.promoAppliedOnQuantityOrValue eq 'Value'}">
	 <div class="form-group col-md-12 rmmgnbtm">
	    <label for="qtyValueBase">PROMO BASED ON</label>
	    <div class="form-row">
	<div class="form-group col-md-3 promoproductcategory">
			<div class="form-group radio">
		      <label><input type="radio"  id="qtyBased" name="qtyValueBase" value ="qtyBased" disabled ><spring:theme code="custom.promo.qty.based" /> </label>
		    </div>
		    
		    
	   </div>   
		<div class="form-group col-md-3">
		   <div id="qtyValueCheckboxID1">
		   <div class="radio">
		      <label><input type="radio" checked id="valueBased" name="qtyValueBase" value="valueBased" disabled><spring:theme code="custom.promo.value.based" /> </label>
		    </div>
		    
		   </div>
		  
   		</div></div></div>
   		
   		
   		<div class="form-group col-md-12"  id = "divvalueAllowed1">
    
      <label for="promoValueText1"><spring:theme code="custom.promo.value.allowed.max" /> </label>
      <input class="form-control" id="promoValueText1" name="promoValueText" type="text" disabled value ="${cpPromo.promoMaxValue}">
    </div>
	
	</c:when>
	<c:when test="${cpPromo.promoAppliedOnQuantityOrValue eq 'Quantity'}">
	<div class="form-group col-md-12 rmmgnbtm">
	    <label for="qtyValueBase">PROMO BASED ON</label>
	    <div class="form-row">
	<div class="form-group col-md-3 promoproductcategory">
			<div class="form-group radio">
		      <label><input type="radio" checked id="qtyBased" name="qtyValueBase" value ="qtyBased" disabled><spring:theme code="custom.promo.qty.based" /> </label>
		    </div>
		    
		    
	   </div>   
		<div class="form-group col-md-3">
		   <div id="qtyValueCheckboxID1">
		   <div class="radio">
		      <label><input type="radio" id="valueBased" name="qtyValueBase" value="valueBased" disabled><spring:theme code="custom.promo.value.based" /> </label>
		    </div>
		    
		   </div>
		  
   		</div></div></div>
   		
   		<div class="form-group col-md-12" id = "divqtyAllowed1" >
	 
      <label for="promoQtyText1"><spring:theme code="custom.promo.quantity.allowed.max" /> </label>
      <input class="form-control" id="promoQtyText1" name="promoQtyText" type="text" disabled value="${cpPromo.promoMaxQuantity}">
    </div>
    
    </c:when>
	</c:choose>
	
 	
	</c:forEach>
	
	<h2>Buy Qualifier Groups</h2>
	<c:forEach items="${listBuyQualifier}" var="buyQ">
	<c:set var = "string1" value = "${buyQ.qualifierId}"/>
      <c:set var = "string2" value = "${fn:substringAfter(string1, 'BQ')}" />
   
 	<button class="accordion">Buy Qualifier ${string2}</button>
 	<div class="panel">
 	<c:if test="${not empty buyQ.products}">
 	<div class="form-group" id = "divProduct1" >
		      <label for="promoProductText1">PRODUCT </label>
		      <input class="form-control" disabled value="${buyQ.products}" id="promoProductText1" name="promoProductText1" type="text">
		    </div>  
 	</c:if>
 	   <c:if test="${not empty buyQ.categories}">
 	   <div class="form-group"  id = "divCategory1">
		      <label for="promoCategoryText1">CATEGORY </label>
		      <input class="form-control" disabled value="${buyQ.categories}" id="promoCategoryText1" name="promoCategoryText1"  type="text">
		    </div>
 	   </c:if>
		     
		    <c:if test="${not empty buyQ.quantity}">
		     <div class="form-group" id = "divqtyText1" >
		      <label for="promoQtyText1">QUANTITY </label>
		      <input class="form-control" disabled value="${buyQ.quantity}" id="promoQtyText1" name="promoQtyText1"  type="text">
		    </div>
		    </c:if>
		    <c:if test="${not empty buyQ.value}">
		    
		     <div class="form-group"  id = "divvalueText1">
		      <label for="promoValueText1">VALUE </label>
		      <input class="form-control" disabled value="${buyQ.value}" id="promoValueText1" name="promoValueText1" type="text">
		    </div>
 	</c:if>
 	
 	
 	</div>
 	
	</c:forEach>
	
	<h2>Get Qualifier Groups</h2>
	<c:forEach items="${listGetQualifier}" var="getQ">
	<c:set var = "string1" value = "${getQ.qualifierId}"/>
      <c:set var = "string2" value = "${fn:substringAfter(string1, 'GQ')}" />
   
 	<button class="accordion">Get Qualifier ${string2}</button>
 	<div class="panel">
 	<c:if test="${not empty getQ.products}">
 	<div class="form-group" id = "divProduct1" >
		      <label for="promoProductText1">PRODUCT </label>
		      <input class="form-control" disabled value="${getQ.products}" id="promoProductText1" name="promoProductText1" type="text">
		    </div>  
 	</c:if>
 	   <c:if test="${not empty getQ.categories}">
 	   <div class="form-group"  id = "divCategory1">
		      <label for="promoCategoryText1">CATEGORY </label>
		      <input class="form-control" disabled value="${getQ.categories}" id="promoCategoryText1" name="promoCategoryText1"  type="text">
		    </div>
 	   </c:if>
		     
		    <c:if test="${not empty getQ.quantity}">
		     <div class="form-group" id = "divqtyText1" >
		      <label for="promoQtyText1">QUANTITY </label>
		      <input class="form-control" disabled value="${getQ.quantity}" id="promoQtyText1" name="promoQtyText1"  type="text">
		    </div>
		    </c:if>
		    <c:if test="${not empty getQ.value}">
		    
		     <div class="form-group"  id = "divvalueText1">
		      <label for="promoValueText1">VALUE </label>
		      <input class="form-control" disabled value="${getQ.value}" id="promoValueText1" name="promoValueText1" type="text">
		    </div>
 	</c:if>
 	
 	
 	</div>
 	
	</c:forEach>
	
	<div class="form-row">
	<div class="form-group col-md-12 submitCustompromoForm" >
 	<button type="button" id="savePromo" class="btn btn-default"  >Update Promo</button>
 	
   </div> </div>
      
   </form>
		
		
   	</div>
	    
	

<div class="lightmodalscreen"></div>
<style>
.accordion {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 18px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
    transition: 0.4s;
}

.active, .accordion:hover {
    background-color: #ccc; 
}

.panel {
    padding: 0 18px;
    display: none;
    background-color: white;
    overflow: hidden;
}
</style>
<script>
var d = new Date();
var n = d.toLocaleDateString();   
//document.getElementById("promoFromDate").value = n;

var element = $('#promoFromDate');
element.prop('disabled', true);  
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.display === "block") {
            panel.style.display = "none";
        } else {
            panel.style.display = "block";
        }
         $('#viewOrEditPromoForm').on('submit', function(e){
       	  
        	e.preventDefault();
   	    	return false;
   	  }); 
    });
}

$( function() {
    var dateFormat = "mm/dd/yy",
      from = $( "#promoFromDate" )
        .datepicker({
          autoSize: true,
         
          minDate: 0,
          changeMonth: true,
          numberOfMonths: 1,
          
          onSelect: function(selected) {
               $("#promoFromDate").datepicker("option","minDate", selected)
	      }
        })
      to = $( "#promoEndDate" ).datepicker({
        minDate: 0,
        changeMonth: true,
       
        numberOfMonths: 1,
        onSelect: function(selected) {
        }
      })
 
	    function getDate( element ) {
	      var date;
      try {
	        date = $.datepicker.parseDate( dateFormat, element.value );
	      } catch( error ) {
	        date = null;
	      }	 
	      return date;
	    }
  } );
  

  
$("#savePromo").on("click", function (e) {
 
	 $.ajax({
	        url: 'update-CustompromoForm',
	        type: 'get',
	        
	        data: $('#viewOrEditPromoForm').serialize(),
	        success: function(data) {
	        	var url = ACC.config.encodedContextPath + "/my-dashboard/distPromotions";
	        	window.location.replace(url);
	                 }
	    });
	
	
        
    
 }) 

</script>
<script>
/* $(document).ready(function(){
    var test = 'str1' + $('#input1').val() + 'str2';
    alert(test);
}); */
</script>
   
