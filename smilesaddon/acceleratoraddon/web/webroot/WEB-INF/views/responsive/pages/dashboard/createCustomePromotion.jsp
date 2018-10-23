<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="formElement"	tagdir="/WEB-INF/tags/responsive/formElement"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="breadcrumb" tagdir="/WEB-INF/tags/responsive/nav/breadcrumb"%>
<link rel="stylesheet" href="<c:url value="/static/css/jquery-ui/jquery-ui.min.css" />" type="text/css" media="screen, projection"/>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="${commonResourcePath}/js/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<spring:htmlEscape defaultHtmlEscape="true" />
<style>
.container{width:90%;border:1px solid #ccc;margin-top:50px;border-radius:10px;padding:10px;}
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
  <h2 class="createcustitle">Create Customized Promotions</h2>
  <p class="fieldmandatorytitle">The below Fields to be filled</p>
  <form  autocomplete="off" method="get" commandName="CustompromoForm" id="CustompromoForm">
     <div class="form-row">
	    <div class="form-group col-md-6">
	      <label for="promoType"><spring:theme code="custom.promo.type" /></label>
	      <select class="form-control" id="promoType" name="promoType">
	        <option value="BUYXGETY">BUYXGETY</option>
	        <option value="TAKENPAYY">TAKENPAYY</option>
	        <option value="BUYXGETDISCOUNT">BUYXGETDISCOUNT</option>
	        <option value="BUYXGETYPERC">BUYXGETYPERC</option>
          </select>
	    </div>
	    
	   <c:forEach items="${promotionRuleGroups}" var="promoRuleGroup">
   
 	 <div class = "myDiv" id="myDiv" style="display:none">${promoRuleGroup}</div>
 	
	</c:forEach>
	
	   <c:forEach items="${listOfcategories}" var="catList">
   
 	 <div class = "myDiv2" id="myDiv2" style="display:none">${catList}</div>
 	
	</c:forEach> 	
	
	
	   
	    <div class="form-group col-md-6">
	      <label for="promoCode"><spring:theme code="custom.promo.code" /> </label>
	      <input class="form-control" id="promoCode" name="promoCode" type="text" value="${promoCodeAuto}">
	    </div>	    
     </div>   
	 <div class="form-row">
	<div class="autocomplete form-group col-md-12">
      <label for="promoUserGroup"><spring:theme code="custom.promo.usergroup"  />  </label>
      <input class="form-control" id="promoUserGroup" name="promoUserGroup" placeholder="Select User Group" type="text">
    </div></div>
 <div class="form-row">
    <div class="form-group col-md-12">
  		<label for="promoDescription"><spring:theme code="custom.promo.description" /></label>
      <input class="form-control" id="promoDescription" name="promoDescription" type="text">
	</div></div>

	
    <div class="form-row">
    <div class="form-group col-md-12">
      <label for="promoMessage"><spring:theme code="custom.promo.message" /> </label>
  		<textarea class="form-control" id="promoMessage" name="promoMessage" maxlength="150"></textarea>
    </div></div>
    <div class="form-row">
	    <div class="form-group col-md-6"> 
	      <label for="promoImage"><spring:theme code="custom.promo.image" /> </label>
	      <input class="form-control" id="promoImage" name="promoImage" type="file" accept="image/*">
	    </div>		    
	    <div class="form-group col-md-6">
	      <label for="promoImage">Image Preview </label>
	    	<span class="imagepreview"></span>
	    </div>
	 </div>
    
    <div class="form-row">
	    <div class="form-group col-md-6">
	      <label for="promoFromDate"><spring:theme code="custom.promo.Validity" /> - Start Date </label>
	      <input class="form-control" readonly id="promoFromDate" name="promoFromDate" type="text" onclick="return false;">
	    </div>
	    <div class="form-group col-md-6">
	      <label for="promoEndDate"><spring:theme code="custom.promo.Validity" /> - End Date</label>
	      <input class="form-control" readonly id="promoEndDate" name="promoEndDate" type="text">
	    </div>
	 </div>
	    <div class="form-group col-md-12">
	      <label for="promoPriority"><spring:theme code="custom.promo.priority" /> </label>
	      <input class="form-control" id="promoPriority" name="promoPriority" type="text">
	    </div>
	    <div class="form-group col-md-12 rmmgnbtm">
	    <label for="qtyValueBase"><spring:theme code="custom.promo.select.qty.or.value.based" /></label>
	    <div class="form-row">
	    
	
		<div class="form-group col-md-3 promoproductcategory">
			<div class="form-group radio">
		      <label><input type="radio" checked id="qtyBased" name="qtyValueBase" value ="qtyBased" onclick="promoBaseGETQty(this)"><spring:theme code="custom.promo.qty.based" /> </label>
		    </div>
		    
		    
	   </div>   
		<div class="form-group col-md-3">
		   <div id="qtyValueCheckboxID1">
		   <div class="radio">
		      <label><input type="radio" id="valueBased" name="qtyValueBase" value="valueBased" onclick="promoBaseGETValue(this)"><spring:theme code="custom.promo.value.based" /> </label>
		    </div>
		    
		   </div>
		  
   		</div>
		
   	</div>
   	</div>
	    
	    
	<div class="form-row form-group col-md-12 rmmgntop" id = "divqtyAllowed1" >
	 <h4>MAX PROMO QTY/VALUE</h4>
      <label for="promoQtyText1"><spring:theme code="custom.promo.quantity.allowed.max" /> </label>
      <input class="form-control" id="promoQtyText1" name="promoQtyText" type="text">
    </div>
    
     <div class="form-row form-group col-md-12 rmmgntop" style="display:none" id = "divvalueAllowed1">
     <h4>MAX PROMO QTY/VALUE</h4>
      <label for="promoValueText1"><spring:theme code="custom.promo.value.allowed.max" /> </label>
      <input class="form-control" id="promoValueText1" name="promoValueText" type="text">
    </div>
	   
	   
	   <div class="addingnewconditiondiv">
    <input type="hidden" id="countconditions" value="1"/>
  <div class="addnewconditions1">
	<h2 class="col-md-12">BUY QUALIFIER</h2>
	<input id ="count" name = "count" type="hidden" value="1">
	<div class="form-row">
	
		<div class="form-group col-md-3 promoproductcategory">
			<div class="form-group radio">
		      <label><input type="radio" checked id="promoProduct1" name="radioPro1" value ="product" onclick="promoProduct(this)"><spring:theme code="custom.promo.product" /> </label>
		    </div>
		    <div class="form-group radio">
		      <label><input type="radio" id="promoCategory1" name="radioPro1" value ="category" onclick="promoCategory(this)"><spring:theme code="custom.promo.category" /> </label>
		    </div> 
		    <div class="form-group radio">
		      <label for="promoCart1"><input type="radio" id="promoCart1" name="radioPro1" value ="cart" onclick="promoCart(this)"><spring:theme code="custom.promo.cart" /> </label>
		    </div>  
	   </div>   
		<div class="form-group col-md-3 promoquantityvalue">
		   <div id="qtyValueCheckboxID1">
		   <div class="radio">
		      <label><input type="radio" checked id="promoQty1" name="radioQty1" value="QTY" onclick="promoQty(this)"><spring:theme code="custom.promo.quantity" /> </label>
		    </div>
		    <div class="radio">
		      <label><input type="radio" id="promoValue1" name="radioQty1" value="VALUE" onclick="promoValue(this)"><spring:theme code="custom.promo.value" /> </label>
		    </div>
		   
		   <div class="form-group" id = "divqtyText1" >
		      <label for="promoQtyText1"><spring:theme code="custom.promo.quantity.text" /> </label>
		      <input class="form-control" id="promoQtyText1" name="promoQtyText1"  type="text">
		    </div>
		    
		     <div class="form-group" style="display:none" id = "divvalueText1">
		      <label for="promoValueText1"><spring:theme code="custom.promo.value.text" /> </label>
		      <input class="form-control" id="promoValueText1" name="promoValueText1" type="text">
		    </div>
   		  </div>
   		</div>
		<div class="form-group col-md-3">
			<div id="ayCheckboxID1">
			   <div class="radio">
			      <label><input type="radio" checked id="promoY1" name="radioAY1" value="ANY" ><spring:theme code="custom.promo.any" /> </label>
			    </div>
			    <div class="radio">
			      <label><input type="radio" id="promoA1" name="radioAY1" value="ALL" ><spring:theme code="custom.promo.all" /> </label>
			    </div>
		   </div>
   		</div>
   		<div class="form-group col-md-3">
 			<button id="addmoreformelement1" action="createBuyQualifier" onclick="addmoreformelement(this)" type="button" class="btn btn-default">Add More Conditions</button>
   		</div>
   		
		    <div class="col-md-12">
		    <div class="form-group" id = "divProduct1" >
		      <label for="promoProductText1"><spring:theme code="custom.promo.product.text" /> </label>
		      <input class="form-control" id="promoProductText1" name="promoProductText1" type="text">
		    </div>     
		     <div class="form-group" style="display:none" id = "divCategory1">
		      <label for="promoCategoryText1"><spring:theme code="custom.promo.category.text" /> </label>
		      <input class="form-control" id="promoCategoryText1" name="promoCategoryText1" placeholder="Select Category" type="text">
		    </div>
		    </div>
   	</div>
  </div>    
 <div class="addnewconditions2"></div>
 <div class="addnewconditions3"></div>
 <div class="addnewconditions4"></div>
 <div class="addnewconditions5"></div>
</div>
<div class="addingnewactiondiv">
  <input id ="countactionGET" name = "countGET" type="hidden" value="1">
  <div class="addnewactions1">
  <div class="form-row">   
	<div id="getRadioIDaction1">
	<h2 class="col-md-12">GET QUALIFIER</h2>
	<input id ="countGET" name = "countGET" type="hidden" value="1">
   <div class="form-group col-md-3 promoproductcategory">	
	<div class="radio">
      <label><input type="radio" id="promoProductGET1" checked name="radioProductGET1" value ="product" onclick="promoProductGET(this)"><spring:theme code="custom.promo.product.get" /> </label>
    </div>
    <div class="radio">
      <label><input type="radio" id="promoCategoryGET1" name="radioProductGET1" value ="category" onclick="promoCategoryGET(this)"><spring:theme code="custom.promo.category.get" /> </label>
    </div>
    <div class="form-group" id = "divProductTextGet1" >
      <label for="promoProductTextGet1"><spring:theme code="custom.promo.product.text.get" /> </label>
      <input class="form-control" id="promoProductTextGet1" name="promoProductTextGet1" type="text">
    </div>
    
     <div class="form-group" style="display:none" id = "divCategoryTextGet1">
      <label for="promoCategoryTextGet1"><spring:theme code="custom.promo.category.text.get" /> </label>
      <input class="form-control" id="promoCategoryTextGet1" name="promoCategoryTextGet1" placeholder="Select Category"  type="text" >
    </div>
   </div>
   </div>
   
	<div class="form-group col-md-3 promoquantityvalue">
   
   <div id="qtyValueCheckboxIDGET1">
   <div class="radio">
      <label><input type="radio" id="promoQtyGET1" checked  name="promoQtyGET1" value = "qty" onclick="promoQtyGET(this)"><spring:theme code="custom.promo.quantity.get" /> </label>
    </div>
    <div class="radio">
      <label><input type="radio" id="promoValueGET1" name="promoQtyGET1" value = "value" onclick="promoValueGET(this)"><spring:theme code="custom.promo.value.get" /> </label>
    </div>
    <div class="radio">
      <label><input type="radio" id="promoPercentageGET1" name="promoQtyGET1" value="PERCENTAGE" onclick="promoPercentageGET(this)"><spring:theme code="custom.promo.percentage" /> </label>
    </div>
   </div>
   
   <div class="form-group" id = "divqtyTextGET1" >
      <label for="promoQtyTextGet1"><spring:theme code="custom.promo.quantity.text.get" /> </label>
      <input class="form-control" id="promoQtyTextGet1" name="promoQtyTextGet1" type="text">
    </div>
    
     <div class="form-group" style="display:none" id = "divvalueTextGET1">
      <label for="promoValueTextGet1"><spring:theme code="custom.promo.value.text.get" /> </label>
      <input class="form-control" id="promoValueTextGet1" name="promoValueTextGet1" type="text">
    </div>
		    
     <div class="form-group" style="display:none" id = "divpercentageTextGET1">
      <label for="promoPercentageTextGET1"><spring:theme code="custom.promo.percentage.text" /> </label>
      <input class="form-control" id="promoPercentageTextGET1" name="promoPercentageTextGET1" type="text">
    </div>
   </div>
	<div class="form-group col-md-3">
    <div id="chCheckboxID1">
   <div class="radio">
      <label><input type="radio" id="promoC1" checked name="radioCH1" value="CHEAP"><spring:theme code="custom.promo.cheap" /> </label>
    </div>
    <div class="radio">
      <label><input type="radio" id="promoH1" name="radioCH1" value="HIGH" ><spring:theme code="custom.promo.high" /> </label>
    </div>
   </div>
   </div>
   <div class="form-group col-md-3">
		<button id="addmoreformactions1" action="createGETQualifier" onclick="addmoreformactions(this)" type="button" class="btn btn-default">Add More Actions</button>
	</div>
   
   </div>
	 
   		
   </div>
  <div class="addnewactions2"></div>
  <div class="addnewactions3"></div>
  <div class="addnewactions4"></div>
  <div class="addnewactions5"></div>  
 </div>
  <div class="form-group col-md-12 submitCustompromoForm">
 	<button id="submitCustompromoForm" type="button" class="btn btn-default" action="save-CustompromoForm" >Create</button>
 	
   </div>   
   </form>
 </div>  
<div class="checkforactions">
		<div class="popuptitle">Do you want to add more Conditions?</div>
		<div class="yesorcancelbtn">
		<div id="checkforconditionsyesnobtn">
	 		<button id="checkforconditionsyes" type="button" class="btn btn-default btnok">Ok</button>
	 		<button id="checkforconditionsno" type="button" class="btn btn-default btncancel">Cancel</button>
	 	</div>
		<div id="checkforactionyesnobtn">	 	
	 		<button id="checkforactionsyes" type="button" class="btn btn-default btnok">Ok</button>
	 		<button id="checkforactionsno" type="button" class="btn btn-default btncancel">Cancel</button>
	 	</div>
		</div>
		<div class="close-popup">X</div>
</div>
<div class="lightmodalscreen"></div>
   
<script type="text/javascript">
     var d = new Date();
     var n = d.toLocaleDateString();   
 	document.getElementById("promoFromDate").value = n;
	
   	$( function() {
	    var dateFormat = "mm/dd/yy",
	      from = $( "#promoFromDate" )
	        .datepicker({
	          autoSize: true,
	          minDate: 0,
	          changeMonth: true,
	          numberOfMonths: 1,
	          onSelect: function(selected) {
	               $("#promoEndDate").datepicker("option","minDate", selected)
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
	    
	  });

    $('#promoType').on('change',function(){		
   		if($(this).val() == 'BUYXGETYPERC'){
   			$('#qtyBased').attr('disabled','disabled');
   			$('#valueBased').trigger('click');

   			$('#promoQty1').attr('disabled','disabled');
   			$('#promoValue1').trigger('click');

   			$('#promoQtyGET1').attr('disabled','disabled');
   			$('#promoValueGET1').attr('disabled','disabled');
   			$('#promoPercentageGET1').trigger('click');
   		}
   		else {
   			$('#qtyBased').removeAttr('disabled');
   			$('#qtyBased').trigger('click');

   			$('#promoQty1').removeAttr('disabled');
   			$('#promoQty1').trigger('click');

   			$('#promoQtyGET1').removeAttr('disabled');
   			$('#promoQtyGET1').trigger('click');

   			$('#promoValueGET1').removeAttr('disabled');
   			$('#promoValueGET1').trigger('click');
   		}
    });
    $('#promoType').on('change',function(){		
   		if($(this).val() == 'BUYXGETDISCOUNT'){
   			$('#promoQtyGET1').attr('disabled','disabled');
   			$('#promoValueGET1').attr('disabled','disabled');
   			$('#promoPercentageGET1').trigger('click');

   			
   		}
   		else {
   			
   		}
    });
    $('#promoType').on('change',function(){		
   		if($(this).val() == 'BUYXGETY'){
   			$('#promoValueGET1').attr('disabled','disabled');
   			$('#promoPercentageGET1').attr('disabled','disabled');
   			$('#promoQtyGET1').trigger('click');
   			

   			
   		}
   		else {
   			

   			$('#promoPercentageGET1').removeAttr('disabled');
   			$('#promoPercentageGET1').trigger('click');
   		}
    });
	//TakeNPAYY
    $('#promoType').on('change',function(){		
   		if($(this).val() == 'TAKENPAYY'){
   			
   			$('#qtyBased').trigger('click');
   			$('#valueBased').attr('disabled','disabled');

   			$('#promoProduct1').trigger('click');
   			$('#promoCategory1').attr('disabled','disabled');
   			$('#promoCart1').attr('disabled','disabled');

   			$('#promoValue1').attr('disabled','disabled');
   			$('#promoQty1').trigger('click');

   			$('#promoCategoryGET1').attr('disabled','disabled');
   			
   			$('#promoPercentageGET1').attr('disabled','disabled');
   			$('#promoValueGET1').attr('disabled','disabled');
   			$('#promoProductGET1').trigger('click');
   			$('#promoQtyGET1').trigger('click');
   		}
   		else {
   			$('#valueBased').removeAttr('disabled');
   			

   			$('#promoCategory1').removeAttr('disabled');
   			

   			$('#promoCart1').removeAttr('disabled');
   			

   			$('#promoValue1').removeAttr('disabled');
   			

   			$('#promoCategoryGET1').removeAttr('disabled');
   		

   			
   		}
    });
	function promoProduct(ele) {
	    hereidis = ele.id;
	    lastchar = hereidis[hereidis.length -1];
	    //console.log('element id = ' + hereidis);
		//console.log('lastchar:: '+lastchar); 
		$('.addnewconditions'+lastchar).find('div.error').remove();
		$('.addnewconditions'+lastchar).find('input.texterror').removeClass("texterror");		
		$('#promoQty'+lastchar+", #promoProductGET"+lastchar+", #promoQtyGET"+lastchar+", #promoValueGET"+lastchar+", #promoCategoryGET"+lastchar+", #promoProductTextGet"+lastchar+", #promoCategoryTextGet"+lastchar).removeAttr('disabled');
		$("#divProduct"+lastchar).css("display","block");
	 	$("#divCategory"+lastchar).css("display","none");
	 	$("#divCategory"+lastchar+' input[type="text"]').val("");
	}	    
	function promoCategory(ele){	  
	    hereidis = ele.id;
	    lastchar = hereidis[hereidis.length -1];
	    //console.log('element id = ' + hereidis);
		//console.log('lastchar:: '+lastchar);   	
		$('.addnewconditions'+lastchar).find('div.error').remove();
		$('.addnewconditions'+lastchar).find('input.texterror').removeClass("texterror");		
		$('#promoQty'+lastchar+", #promoProductGET"+lastchar+", #promoQtyGET"+lastchar+", #promoValueGET"+lastchar+", #promoCategoryGET"+lastchar+", #promoProductTextGet"+lastchar+", #promoCategoryTextGet"+lastchar).removeAttr('disabled');
		$("#divCategory"+lastchar).css("display","block");
    	$("#divProduct"+lastchar).css("display","none");
	 	$("#divProduct"+lastchar+' input[type="text"]').val("");	    	
	} 	    
	function promoCart(ele){	  
	    hereidis = ele.id;
	    lastchar = hereidis[hereidis.length -1];
	    //console.log('element id = ' + hereidis);
		//console.log('lastchar:: '+lastchar);   	
		$('.addnewconditions'+lastchar).find('div.error').remove();
		$('.addnewconditions'+lastchar).find('input.texterror').removeClass("texterror");		
		$('#promoQty'+lastchar+", #promoProductGET"+lastchar+", #promoQtyGET"+lastchar+", #promoValueGET"+lastchar+", #promoCategoryGET"+lastchar+", #promoProductTextGet"+lastchar+", #promoCategoryTextGet"+lastchar).attr('disabled','disabled');
		$('#promoValue'+lastchar+", #promoPercentageGET"+lastchar).trigger('click');
    	$("#divProduct"+lastchar+", #divCategory"+lastchar).css("display","none");	
    	$("#divProduct"+lastchar+' input[type="text"], #divCategory'+lastchar+' input[type="text"]').val("");	     	
	}     
	function promoQty(ele){	  
	    hereidis = ele.id;
	    lastchar = hereidis[hereidis.length -1];
	    //console.log('element id = ' + hereidis);
		//console.log('lastchar:: '+lastchar); 	 	
		$('.addnewconditions'+lastchar).find('div.error').remove();
		$('.addnewconditions'+lastchar).find('input.texterror').removeClass("texterror");		
		$("#divqtyText"+lastchar).css("display","block");
	 	$("#divvalueText"+lastchar+' input[type="text"]').val("");
	 	$("#divvalueText"+lastchar).css("display","none");    	
	} 	  
	function promoValue(ele){	    
	    hereidis = ele.id;
	    lastchar = hereidis[hereidis.length -1];
	    //console.log('element id = ' + hereidis);
		//console.log('lastchar:: '+lastchar); 	
		$('.addnewconditions'+lastchar).find('div.error').remove();
		$('.addnewconditions'+lastchar).find('input.texterror').removeClass("texterror");		
		$("#divvalueText"+lastchar).css("display","block");
    	$("#divqtyText"+lastchar+", #divpercentageText"+lastchar).css("display","none");	
    	$("#divqtyText"+lastchar+' input[type="text"], #divpercentageText'+lastchar+' input[type="text"]').val("");	    	
	} 
    function promoProductGET(ele){ 
	    hereidis = ele.id;
	    lastchar = hereidis[hereidis.length -1];
	    //console.log('element id = ' + hereidis);
		//console.log('lastchar:: '+lastchar); 	
		$('.addnewactions'+lastchar).find('div.error').remove();
		$('.addnewactions'+lastchar).find('input.texterror').removeClass("texterror");		
		$("#divProductTextGet"+lastchar).css("display","block");
    	$("#divCategoryTextGet"+lastchar).css("display","none");
	 	$("#divCategoryTextGet"+lastchar+' input[type="text"]').val("");
    }
    function promoCategoryGET(ele){ 
	    hereidis = ele.id;
	    lastchar = hereidis[hereidis.length -1];
	    //console.log('element id = ' + hereidis);
		//console.log('lastchar:: '+lastchar); 	
		$('.addnewactions'+lastchar).find('div.error').remove();
		$('.addnewactions'+lastchar).find('input.texterror').removeClass("texterror");		
		$("#divCategoryTextGet"+lastchar).css("display","block");
    	$("#divProductTextGet"+lastchar).css("display","none");
 	 	$("#divProductTextGet"+lastchar+' input[type="text"]').val("");
    }
   function promoQtyGET(ele){ 
	    hereidis = ele.id;
	    lastchar = hereidis[hereidis.length -1];
	    //console.log('element id = ' + hereidis);
		//console.log('lastchar:: '+lastchar); 	
		$('.addnewactions'+lastchar).find('div.error').remove();
		$('.addnewactions'+lastchar).find('input.texterror').removeClass("texterror");		
		$("#divqtyTextGET"+lastchar).css("display","block");
    	$("#divvalueTextGET"+lastchar+", #divpercentageTextGET"+lastchar).css("display","none");
     	$("#divvalueTextGET"+lastchar+' input[type="text"], #divpercentageTextGET'+lastchar+' input[type="text"]').val("");	    	
    }
    function promoValueGET(ele){
	    hereidis = ele.id;
	    lastchar = hereidis[hereidis.length -1];
	    //console.log('element id = ' + hereidis);
		//console.log('lastchar:: '+lastchar); 	
		$('.addnewactions'+lastchar).find('div.error').remove();
		$('.addnewactions'+lastchar).find('input.texterror').removeClass("texterror");		
		$("#divvalueTextGET"+lastchar).css("display","block");
    	$("#divqtyTextGET"+lastchar+", #divpercentageTextGET"+lastchar).css("display","none");
     	$("#divqtyTextGET"+lastchar+' input[type="text"], #divpercentageTextGET'+lastchar+' input[type="text"]').val("");	    	
   }  
	function promoPercentageGET(ele){	    
	    hereidis = ele.id;
	    lastchar = hereidis[hereidis.length -1];
	    //console.log('element id = ' + hereidis);
		//console.log('lastchar:: '+lastchar); 	
		$('.addnewactions'+lastchar).find('div.error').remove();
		$('.addnewactions'+lastchar).find('input.texterror').removeClass("texterror");		
		$("#divpercentageTextGET"+lastchar).css("display","block");
    	$("#divqtyTextGET"+lastchar+", #divvalueTextGET"+lastchar).css("display","none");	    	
    	$("#divqtyTextGET"+lastchar+' input[type="text"], #divvalueTextGET'+lastchar+' input[type="text"]').val("");	    	
	}

    function promoBaseGETQty(ele){         	
		$("#divvalueAllowed1 input[type='text']").val('');
		$("#divvalueAllowed1").removeClass('texterror');
		$("#divvalueAllowed1").parent().find('div.error').remove();
    	$("#divvalueAllowed1").css("display","none");
    	$("#divqtyAllowed1").css("display","block");
    }
    
    function promoBaseGETValue(ele){
    	if( $('#promoType').val()!='BUYXGETY')
        {
			$("#divqtyAllowed1 input[type='text']").val('');
			$("#divqtyAllowed1").removeClass('texterror');
			$("#divqtyAllowed1").parent().find('div.error').remove();
	   	 	$("#divqtyAllowed1").css("display","none");
	    	$("#divvalueAllowed1").css("display","block");
        }
    }
    
	function addmoreformelement(ele){		
		var success = true;	
	    hereidis = ele.id;
	    lastchar = hereidis[hereidis.length -1]; 
		incrementlstchar = parseInt(lastchar)+1;
	    //console.log('element id = ' + hereidis);
		//console.log('lastchar before:: '+lastchar);
		//console.log('incrementlstchar before:: '+incrementlstchar);
		$('.addnewconditions'+lastchar).find('div.error').remove();
		$('.addnewconditions'+lastchar).find('input.texterror').removeClass("texterror");		
		$('.addnewconditions'+lastchar+' input[type="text"]:visible').each(function(){
			if($(this).val() == "" && $(this).prop('disabled') == false){
				$(this).addClass('texterror');
				$(this).parent().append('<div class="error">This field id mandatory</div>');
				success = false;
			}
		});
		$('.addnewconditions'+lastchar+' input[type="text"]:visible').focus(function(){
			$(this).removeClass('texterror');
			$(this).parent().find('div.error').remove();
		});
		if (success) {
			$('.addnewconditions'+lastchar+' div.error').remove();
			$('#checkforactionyesnobtn').css("display","none");
			$('.checkforactions,.lightmodalscreen,#checkforconditionsyesnobtn').css("display","block");		
			$.ajax({
		        url: 'createBuyQualifier',
		        type: 'post',
		        
		        data: $('#CustompromoForm').serialize(),
		        success: function(data) {		        	
		        }
		    });	
	    }
	}

	function addmoreformactions(ele){	
		var success = true;
	    hereidis = ele.id;
	    lastchar = hereidis[hereidis.length -1]; 
		incrementlstchar = parseInt(lastchar)+1;
	    //console.log('element id = ' + hereidis);
		//console.log('lastchar:: '+lastchar);
		//console.log('incrementlstchar before:: '+incrementlstchar);
		$('.addnewactions'+lastchar).find('div.error').remove();
		$('.addnewactions'+lastchar).find('input.texterror').removeClass("texterror")
		$('.addnewactions'+lastchar+' input[type="text"]:visible').each(function(){
			if($(this).val() == "" && $(this).prop('disabled') == false){
				$(this).addClass('texterror');
				$(this).parent().append('<div class="error">This field id mandatory</div>');
				success = false;
			}
		});
		$('.addnewactions'+lastchar+' input[type="text"]:visible').focus(function(){
			$(this).removeClass('texterror');
			$(this).parent().find('div.error').remove();
		});
		 if (success) {
		$('.popuptitle').html('Do you want to add more Actions?');
		$('#checkforconditionsyesnobtn').css("display","none");
		$('.checkforactions,.lightmodalscreen,#checkforactionyesnobtn').css("display","block");		
		$('#addmoreformactions'+lastchar).css("display","none");		
		/* $.ajax({
		        url: 'createGETQualifier',
		        type: 'post',
		        
		        data: $('#CustompromoForm').serialize(),
		        success: function(data) {
		                   
		                 }
		    });*/	
		 }
	}
	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();

	        reader.onload = function (e) {
	            $('#imagepreview').attr('src', e.target.result);
	        }

	        reader.readAsDataURL(input.files[0]);
	    }
	}
	var array = new Array();
	array.push("All");
	
	$(".myDiv").each(function() {
		var item1 = $(this).text();
		
		array.push(item1);
	});

	//console.log('first array promotionRuleGroups:: '+array)
	var array2 = new Array();
	
	$(".myDiv2").each(function() {
		var item2 = $(this).text();
		
		array2.push(item2);
	});
	//console.log('second array2 listOfcategories:: '+array2);
	
	
	var c = $('#countconditions').val();
	 
	$('#checkforconditionsyes').on('click',function(e){
		e.preventDefault();	
		countconditions = $('#countconditions').val();
		incrementlstchar = parseInt(countconditions)+1;
		$('#countconditions').val(incrementlstchar);
		$('#count').val(incrementlstchar);
		//console.log('incrementlstchar on click:: '+incrementlstchar);
		//console.log('incrementlstchar after click:: '+$('#countconditions').val());
		if(incrementlstchar !=5)
			includehtmlcondition='<h2 class="col-md-12">BUY QUALIFIER</h2><input id ="count" type="hidden" value='+incrementlstchar+'"><div class="form-row"><div class="form-group col-md-3 promoproductcategory"><div class="form-group radio"><label><input type="radio" checked id="promoProduct'+incrementlstchar+'" name="radioPro'+incrementlstchar+'" value ="product" onclick="promoProduct(this)"><spring:theme code="custom.promo.product" /> </label></div><div class="form-group radio"><label><input type="radio" id="promoCategory'+incrementlstchar+'" value ="category" name="radioPro'+incrementlstchar+'" onclick="promoCategory(this)"><spring:theme code="custom.promo.category" /> </label></div><div class="form-group radio"><label for="promoCart'+incrementlstchar+'"><input type="radio" id="promoCart'+incrementlstchar+'" name="radioPro'+incrementlstchar+'" value ="cart" onclick="promoCart(this)"><spring:theme code="custom.promo.cart" /> </label></div></div><div class="form-group col-md-3 promoquantityvalue"><div id="qtyValueCheckboxID'+incrementlstchar+'"><div class="radio"><label><input type="radio" checked id="promoQty'+incrementlstchar+'" value= "QTY" name="radioQty'+incrementlstchar+'" onclick="promoQty(this)"><spring:theme code="custom.promo.quantity" /></label></div><div class="radio"><label><input type="radio" id="promoValue'+incrementlstchar+'" name="radioQty'+incrementlstchar+'" value="VALUE" onclick="promoValue(this)"><spring:theme code="custom.promo.value" /></label></div></div><div class="form-group" id = "divqtyText'+incrementlstchar+'" ><label for="promoQtyText'+incrementlstchar+'"><spring:theme code="custom.promo.quantity.text" /></label><input class="form-control" id="promoQtyText'+incrementlstchar+'" name="promoQtyText'+incrementlstchar+'" type="text"></div><div class="form-group" style="display:none" id = "divvalueText'+incrementlstchar+'"><label for="promoValueText'+incrementlstchar+'"><spring:theme code="custom.promo.value.text" /></label><input class="form-control" id="promoValueText'+incrementlstchar+'" name="promoValueText'+incrementlstchar+'" type="text"></div></div><div class="form-group col-md-3"><div id="ayCheckboxID'+incrementlstchar+'"><div class="radio"><label><input type="radio" checked id="promoY'+incrementlstchar+'" value="ANY" name="radioAY'+incrementlstchar+'"><spring:theme code="custom.promo.any" /></label></div><div class="radio"><label><input type="radio" value="ALL" id="promoA'+incrementlstchar+'" name="radioAY'+incrementlstchar+'"><spring:theme code="custom.promo.all" /></label></div></div></div><div class="form-group col-md-3"><button id="addmoreformelement'+incrementlstchar+'" action="createBuyQualifier" onclick="addmoreformelement(this)" type="button" class="btn btn-default">Add More Conditions</button></div><div class="col-md-12"><div class="form-group" id = "divProduct'+incrementlstchar+'" ><label for="promoProductText'+incrementlstchar+'"><spring:theme code="custom.promo.product.text" /></label><input class="form-control" id="promoProductText'+incrementlstchar+'"  name="promoProductText'+incrementlstchar+'" type="text"></div> <div class="form-group" style="display:none" id = "divCategory'+incrementlstchar+'"><label for="promoCategoryText'+incrementlstchar+'"><spring:theme code="custom.promo.category.text" /></label><input class="form-control" id="promoCategoryText'+incrementlstchar+'" name="promoCategoryText'+incrementlstchar+'" type="text" placeholder="Select Category"></div></div></div>';			
		else 
			includehtmlcondition='<h2 class="col-md-12">BUY QUALIFIER</h2><input id ="count" type="hidden" value='+incrementlstchar+'"><div class="form-row"><div class="form-group col-md-3 promoproductcategory"><div class="form-group radio"><label><input type="radio" checked id="promoProduct'+incrementlstchar+'" name="radioPro'+incrementlstchar+'" value ="product" onclick="promoProduct(this)"><spring:theme code="custom.promo.product" /> </label></div><div class="form-group radio"><label><input type="radio" id="promoCategory'+incrementlstchar+'" value ="category" name="radioPro'+incrementlstchar+'" onclick="promoCategory(this)"><spring:theme code="custom.promo.category" /> </label></div><div class="form-group radio"><label for="promoCart'+incrementlstchar+'"><input type="radio" id="promoCart'+incrementlstchar+'" name="radioPro'+incrementlstchar+'" value ="cart" onclick="promoCart(this)"><spring:theme code="custom.promo.cart" /> </label></div></div><div class="form-group col-md-3 promoquantityvalue"><div id="qtyValueCheckboxID'+incrementlstchar+'"><div class="radio"><label><input type="radio" checked id="promoQty'+incrementlstchar+'" value= "QTY" name="radioQty'+incrementlstchar+'" onclick="promoQty(this)"><spring:theme code="custom.promo.quantity" /></label></div><div class="radio"><label><input type="radio" id="promoValue'+incrementlstchar+'" name="radioQty'+incrementlstchar+'" value="VALUE" onclick="promoValue(this)"><spring:theme code="custom.promo.value" /></label></div></div><div class="form-group" id = "divqtyText'+incrementlstchar+'" ><label for="promoQtyText'+incrementlstchar+'"><spring:theme code="custom.promo.quantity.text" /></label><input class="form-control" id="promoQtyText'+incrementlstchar+'" name="promoQtyText'+incrementlstchar+'" type="text"></div><div class="form-group" style="display:none" id = "divvalueText'+incrementlstchar+'"><label for="promoValueText'+incrementlstchar+'"><spring:theme code="custom.promo.value.text" /></label><input class="form-control" id="promoValueText'+incrementlstchar+'" name="promoValueText'+incrementlstchar+'" type="text"></div></div><div class="form-group col-md-3"><div id="ayCheckboxID'+incrementlstchar+'"><div class="radio"><label><input type="radio" checked id="promoY'+incrementlstchar+'" value="ANY" name="radioAY'+incrementlstchar+'"><spring:theme code="custom.promo.any" /></label></div><div class="radio"><label><input type="radio" value="ALL" id="promoA'+incrementlstchar+'" name="radioAY'+incrementlstchar+'"><spring:theme code="custom.promo.all" /></label></div></div></div><div class="col-md-12"><div class="form-group" id = "divProduct'+incrementlstchar+'" ><label for="promoProductText'+incrementlstchar+'"><spring:theme code="custom.promo.product.text" /></label><input class="form-control" id="promoProductText'+incrementlstchar+'"  name="promoProductText'+incrementlstchar+'" type="text"></div> <div class="form-group" style="display:none" id = "divCategory'+incrementlstchar+'"><label for="promoCategoryText'+incrementlstchar+'"><spring:theme code="custom.promo.category.text" /></label><input class="form-control" id="promoCategoryText'+incrementlstchar+'" name="promoCategoryText'+incrementlstchar+'" type="text" placeholder="Select Category"></div></div></div>';
		$('.addnewconditions'+incrementlstchar).html(includehtmlcondition);
		$('#promoProduct'+incrementlstchar+', #promoQty'+incrementlstchar+', #promoValue'+incrementlstchar+', #promoY'+incrementlstchar).prop('attr','checked');
		$('.checkforactions,.lightmodalscreen').css("display","none");
		$('#addmoreformelement'+lastchar).css("display","none");
		//console.log('cal of c for incrementlstchar:: '+incrementlstchar);
		$( "#promoCategoryText"+incrementlstchar).on( "keydown", function( event ) { if ( event.keyCode === $.ui.keyCode.TAB && $( this ).autocomplete( "instance" ).menu.active ) { event.preventDefault(); } }).autocomplete({      minLength: 0,source: function( request, response ) { response( $.ui.autocomplete.filter(array2, extractLast( request.term ) ) );},focus: function() {return false;},select: function( event, ui ) {var terms = split( this.value );terms.pop();terms.push( ui.item.value );terms.push( "" );this.value = terms.join( ", " );return false; }});
   });
	$('#checkforconditionsno,.close-popup').on('click',function(e){
		e.preventDefault();
		$('.checkforactions,.lightmodalscreen').css("display","none");
		$('.addnewconditions'+c).css("display","block");	
	});
	$('#checkforactionsyes').on('click',function(e){
		e.preventDefault();
		countactionGET = $('#countactionGET').val();
		incrementlstchar = parseInt(countactionGET)+1;
		//console.log('incrementlstchar on click action:: '+incrementlstchar);
		if(incrementlstchar !=5)
			includehtmlcondition='<div class="form-row"><input id ="countGET" name = "countGET" type="hidden" value='+incrementlstchar+'"><div id="getRadioIDaction'+incrementlstchar+'"><h2 class="col-md-12">GET QUALIFIER</h2><div class="form-group col-md-3 promoproductcategory"><div class="radio"><label><input type="radio" id="promoProductGET'+incrementlstchar+'" checked name="radioProductGET'+incrementlstchar+'" value ="product" onclick="promoProductGET(this)"><spring:theme code="custom.promo.product.get" /> </label></div><div class="radio"><label><input type="radio" id="promoCategoryGET'+incrementlstchar+'" value ="category" name="radioProductGET'+incrementlstchar+'" onclick="promoCategoryGET(this)"><spring:theme code="custom.promo.category.get" /> </label></div><div class="form-group" id = "divProductTextGet'+incrementlstchar+'" ><label for="promoProductTextGet'+incrementlstchar+'"><spring:theme code="custom.promo.product.text.get" /> </label><input class="form-control" id="promoProductTextGet'+incrementlstchar+'" name="promoProductTextGet'+incrementlstchar+'" type="text"></div><div class="form-group" style="display:none" id = "divCategoryTextGet'+incrementlstchar+'"><label for="promoCategoryTextGet'+incrementlstchar+'"><spring:theme code="custom.promo.category.text.get" /> </label><input class="form-control" id="promoCategoryTextGet'+incrementlstchar+'" placeholder="Select Category" name="promoCategoryTextGet'+incrementlstchar+'" type="text" ></div></div></div><div class="form-group col-md-3 promoquantityvalue"><div id="qtyValueCheckboxIDGET'+incrementlstchar+'"><div class="radio"><label><input type="radio" value = "qty" id="promoQtyGET'+incrementlstchar+'" checked name="promoQtyGET'+incrementlstchar+'" onclick="promoQtyGET(this)"><spring:theme code="custom.promo.quantity.get" /> </label></div><div class="radio"><label><input type="radio" id="promoValueGET'+incrementlstchar+'" value = "value" name="promoQtyGET'+incrementlstchar+'" onclick="promoValueGET(this)"><spring:theme code="custom.promo.value.get" /> </label></div><div class="radio"><label><input type="radio" id="promoPercentageGET'+incrementlstchar+'" name="promoQtyGET'+incrementlstchar+'" value="PERCENTAGE" onclick="promoPercentageGET(this)"><spring:theme code="custom.promo.percentage" /> </label></div></div><div class="form-group" id = "divqtyTextGET'+incrementlstchar+'" ><label for="promoQtyTextGET'+incrementlstchar+'"><spring:theme code="custom.promo.quantity.text.get" /> </label><input class="form-control" name="promoQtyTextGet'+incrementlstchar+'" id="promoQtyTextGET'+incrementlstchar+'" type="text"></div> <div class="form-group" style="display:none" id = "divvalueTextGET'+incrementlstchar+'"><label for="promoValueTextGET'+incrementlstchar+'"><spring:theme code="custom.promo.value.text.get" /> </label><input class="form-control" name="promoValueTextGet'+incrementlstchar+'" id="promoValueTextGET'+incrementlstchar+'" type="text"></div><div class="form-group" style="display:none" id = "divpercentageTextGET'+incrementlstchar+'"><label for="promoPercentageTextGET'+incrementlstchar+'"><spring:theme code="custom.promo.percentage.text" /> </label><input class="form-control" id="promoPercentageTextGET'+incrementlstchar+'" name="promoPercentageTextGET'+incrementlstchar+'" type="text"></div></div><div class="form-group col-md-3"><div id="chCheckboxID'+incrementlstchar+'"><div class="radio"><label><input type="radio" id="promoC'+incrementlstchar+'" checked value="CHEAP" name="radioCH'+incrementlstchar+'"><spring:theme code="custom.promo.cheap" /> </label></div><div class="radio"><label><input type="radio" id="promoH'+incrementlstchar+'" value="HIGH" name="radioCH'+incrementlstchar+'"><spring:theme code="custom.promo.high" /> </label></div></div></div><div class="form-group col-md-3"><button id="addmoreformactions'+incrementlstchar+'" action="createGETQualifier" onclick="addmoreformactions(this)" type="button" class="btn btn-default">Add More Actions</button></div></div>';
			else
			includehtmlcondition='<div class="form-row"><input id ="countGET" name = "countGET" type="hidden" value='+incrementlstchar+'"><div id="getRadioIDaction'+incrementlstchar+'"><h2 class="col-md-12">GET QUALIFIER</h2><div class="form-group col-md-3 promoproductcategory"><div class="radio"><label><input type="radio" id="promoProductGET'+incrementlstchar+'" checked name="radioProductGET'+incrementlstchar+'" value ="product" onclick="promoProductGET(this)"><spring:theme code="custom.promo.product.get" /> </label></div><div class="radio"><label><input type="radio" id="promoCategoryGET'+incrementlstchar+'" value ="category" name="radioProductGET'+incrementlstchar+'" onclick="promoCategoryGET(this)"><spring:theme code="custom.promo.category.get" /> </label></div><div class="form-group" id = "divProductTextGet'+incrementlstchar+'" ><label for="promoProductTextGet'+incrementlstchar+'"><spring:theme code="custom.promo.product.text.get" /> </label><input class="form-control" id="promoProductTextGet'+incrementlstchar+'" name="promoProductTextGet'+incrementlstchar+'" type="text"></div><div class="form-group" style="display:none" id = "divCategoryTextGet'+incrementlstchar+'"><label for="promoCategoryTextGet'+incrementlstchar+'"><spring:theme code="custom.promo.category.text.get" /> </label><input class="form-control" id="promoCategoryTextGet'+incrementlstchar+'" placeholder="Select Category" name="promoCategoryTextGet'+incrementlstchar+'" type="text" ></div></div></div><div class="form-group col-md-3 promoquantityvalue"><div id="qtyValueCheckboxIDGET'+incrementlstchar+'"><div class="radio"><label><input type="radio" value = "qty" id="promoQtyGET'+incrementlstchar+'" checked name="promoQtyGET'+incrementlstchar+'" onclick="promoQtyGET(this)"><spring:theme code="custom.promo.quantity.get" /> </label></div><div class="radio"><label><input type="radio" id="promoValueGET'+incrementlstchar+'" value = "value" name="promoQtyGET'+incrementlstchar+'" onclick="promoValueGET(this)"><spring:theme code="custom.promo.value.get" /> </label></div><div class="radio"><label><input type="radio" id="promoPercentageGET'+incrementlstchar+'" name="promoQtyGET'+incrementlstchar+'" value="PERCENTAGE" onclick="promoPercentageGET(this)"><spring:theme code="custom.promo.percentage" /> </label></div></div><div class="form-group" id = "divqtyTextGET'+incrementlstchar+'" ><label for="promoQtyTextGET'+incrementlstchar+'"><spring:theme code="custom.promo.quantity.text.get" /> </label><input class="form-control" name="promoQtyTextGet'+incrementlstchar+'" id="promoQtyTextGET'+incrementlstchar+'" type="text"></div> <div class="form-group" style="display:none" id = "divvalueTextGET'+incrementlstchar+'"><label for="promoValueTextGET'+incrementlstchar+'"><spring:theme code="custom.promo.value.text.get" /> </label><input class="form-control" name="promoValueTextGet'+incrementlstchar+'" id="promoValueTextGET'+incrementlstchar+'" type="text"></div><div class="form-group" style="display:none" id = "divpercentageTextGET'+incrementlstchar+'"><label for="promoPercentageTextGET'+incrementlstchar+'"><spring:theme code="custom.promo.percentage.text" /> </label><input class="form-control" id="promoPercentageTextGET'+incrementlstchar+'" name="promoPercentageTextGET'+incrementlstchar+'" type="text"></div></div><div class="form-group col-md-3"><div id="chCheckboxID'+incrementlstchar+'"><div class="radio"><label><input type="radio" id="promoC'+incrementlstchar+'" checked value="CHEAP" name="radioCH'+incrementlstchar+'"><spring:theme code="custom.promo.cheap" /> </label></div><div class="radio"><label><input type="radio" id="promoH'+incrementlstchar+'" value="HIGH" name="radioCH'+incrementlstchar+'"><spring:theme code="custom.promo.high" /> </label></div></div></div></div>';
		$('.addnewactions'+incrementlstchar).html(includehtmlcondition);
		$('#promoProductGET'+incrementlstchar+', #promoQtyGET'+incrementlstchar+', #promoC'+incrementlstchar).prop('attr','checked');
        $('.checkforactions,.lightmodalscreen').css("display","none");       
        $('#countactionGET').val(incrementlstchar);       
        $('#countGET').val(incrementlstchar);
        $("#promoCategoryTextGet"+incrementlstchar).on( "keydown", function( event ) { if ( event.keyCode === $.ui.keyCode.TAB && $( this ).autocomplete( "instance" ).menu.active ) { event.preventDefault(); } }).autocomplete({      minLength: 0,source: function( request, response ) { response( $.ui.autocomplete.filter(array2, extractLast( request.term ) ) );},focus: function() {return false;},select: function( event, ui ) {var terms = split( this.value );terms.pop();terms.push( ui.item.value );terms.push( "" );this.value = terms.join( ", " );return false; }});
    });
	$('#checkforactionsno,.close-popup').on('click',function(e){
		e.preventDefault();
		$('.checkforactions,.lightmodalscreen').css("display","none");
	});
	$("#promoImage").on('change',function(){
		$(".imagepreview").html('<img id="imagepreview" src="" alt="Image preview" />')
	    readURL(this);
	});
	
	$('#submitCustompromoForm').click( function() {
		loading();
		var success = true;
		$('#CustompromoForm input[type="text"]:visible,#CustompromoForm textarea').removeClass('texterror');
		$('#CustompromoForm input[type="text"]:visible,#CustompromoForm textarea').parent().find('div.error').remove();
		$('#CustompromoForm input[type="text"],#CustompromoForm textarea').each(function(){
			if($(this).is(":visible")){
				if($(this).val() == "" && $(this).prop('disabled') == false){
					$(this).addClass('texterror');
					$(this).parent().append('<div class="error">This field id mandatory</div>');
					success = false;
				}
				else{
					thisval =$(this).val(); 
				    lastcharcomma = thisval[thisval.length -2];
					//console.log('input lastcharcomma is:: ' + lastcharcomma);
				    if(lastcharcomma == ','){
						thisvalreplace = thisval.replace(/\, $/, '');
						thisval = thisvalreplace;
						//console.log('input value is:: '+thisval);
						$(this).val(thisval);
				    }
				}
			}
			else{
				$(this).val('');
				$(this).removeClass('texterror');
				$(this).parent().find('div.error').remove();
			}
		});
		$('#CustompromoForm input[type="text"]:visible,#CustompromoForm textarea').focus(function(){
			$(this).removeClass('texterror');
			$(this).parent().find('div.error').remove();
		});
		if(success){
	    $.ajax({
	        url: 'save-CustompromoForm',
	        type: 'get',
	        
	        data: $('#CustompromoForm').serialize(),
	        success: function(data) {
	        	savePromotionImage();
	        	
	                 }
	    });
		}
	});
	
    function split( val ) {
        return val.split( /,\s*/ );
      }
      function extractLast( term ) {
        return split( term ).pop();
      }
      c1= $('#countconditions').val();
      countforautocomplete = parseInt(c1);
      //console.log("autocomplete count countforautocomplete:: "+countforautocomplete);
      $( "#promoCategoryText"+countforautocomplete+", #promoCategoryTextGet"+countforautocomplete)
        // don't navigate away from the field on tab when selecting an item
        .on( "keydown", function( event ) {
          if ( event.keyCode === $.ui.keyCode.TAB &&
              $( this ).autocomplete( "instance" ).menu.active ) {
            event.preventDefault();
          }
        })
        .autocomplete({
          minLength: 0,
          source: function( request, response ) {
            // delegate back to autocomplete, but extract the last term
            response( $.ui.autocomplete.filter(
            		array2, extractLast( request.term ) ) );
          },
          focus: function() {
            // prevent value inserted on focus
            return false;
          },
          select: function( event, ui ) {
            var terms = split( this.value );
            // remove the current input
            terms.pop();
            // add the selected item
            terms.push( ui.item.value );
            // add placeholder to get the comma-and-space at the end
            terms.push( "" );
            this.value = terms.join( ", " );
            return false;
          }
        });
      $( "#promoUserGroup" )
      // don't navigate away from the field on tab when selecting an item
      .on( "keydown", function( event ) {
        if ( event.keyCode === $.ui.keyCode.TAB &&
            $( this ).autocomplete( "instance" ).menu.active ) {
          event.preventDefault();
        }
      })
      .autocomplete({
        minLength: 0,
        source: function( request, response ) {
          // delegate back to autocomplete, but extract the last term
          response( $.ui.autocomplete.filter(
          		array, extractLast( request.term ) ) );
        },
        focus: function() {
          // prevent value inserted on focus
          return false;
        },
        select: function( event, ui ) {
          var terms = split( this.value );
          // remove the current input
          terms.pop();
          // add the selected item
          terms.push( ui.item.value );
          // add placeholder to get the comma-and-space at the end
          terms.push( "" );
          this.value = terms.join( ", " );
          return false;
        }
      });
      
      function savePromotionImage() {
    	  var filedata = new FormData();
    	  filedata.append("promoCode", $('#promoCode').val());
    	  filedata.append("promoImage", $("#promoImage")[0].files[0]);
 		$.ajax({
 		    type: 'POST',
 		    enctype :'multipart/form-data',
 	        crossDomain :true,
 	        processData: false,  // Important!
 	        contentType: false,
             cache: false,
 		    url: 'savePromotionsImage?CSRFToken=${CSRFToken.token}',
 		    data: filedata,
 		    success: function(data) {
 		       
 		       var url = ACC.config.encodedContextPath + "/my-dashboard/distPromotions";
	        	window.location.replace(url);
 		    }
 		});
       }
      
	
   </script>