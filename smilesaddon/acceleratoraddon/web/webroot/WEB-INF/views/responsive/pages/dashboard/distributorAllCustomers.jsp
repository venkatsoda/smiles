<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="breadcrumb" tagdir="/WEB-INF/tags/responsive/nav/breadcrumb"%>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/responsive/common"%>
<%@ taglib prefix="formUtil" tagdir="/WEB-INF/tags/responsive/form"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- <script type="text/javascript" src="https://github.com/padolsey-archive/jquery.fn/blob/master/sortElements/jquery.sortElements.js"></script> -->



<breadcrumb:breadcrumb breadcrumbs="${breadcrumbs}" />

	<div id="globalMessages">
		<common:globalMessages />
	</div>
<div class="cust-list-filters">
	<c:url value="/my-dashboard/new-customers/searchCustomer"
		var="searchCustomerByCNPJandNameandServiceable" />
		<div class="search-customer">
	<form:form name="searchCustomer"
		action="${searchCustomerByCNPJandNameandServiceable}" method="get" commandName="DashboardCustomerForm">
		
			<span><spring:theme code="dist.customer.serchByCNPJ"
					text="CNPJ :" /></span> 
					<span><input type="text" id="customerUid" name="customerUid"/></span> 
		
			<span><spring:theme code="dist.customer.serchByName"
					text="CNPJ Nome :" /></span> <span><input type="text" id="customerName" name="customerName"/></span>
	
			<span><spring:theme code="dist.customer.serviceable"
					text="Serviceable :" /></span> <span><input type="checkbox"
				id="serviceable" name="serviceable"/></span>
	<input type="submit" name='search' value="<spring:theme code="dist.order.search.button" text="Search" />"></input>
	</form:form>
</div>
<%-- <div class="cust-list-filters">
        <div>
	     	<span><spring:theme code="dist.customer.serchByCNPJ" text="CNPJ :" /></span>
	     	<span><input type="text" id="myInput2" class="form-control" onkeyup="myFunction2()" placeholder="Pesquisar por CNPJ" title="Insira o CNPJ ID"></span>
     	</div>
		<div>	
			<span><spring:theme code="dist.customer.serchByName" text="CNPJ Nome :" /></span>
			<span><input type="text" id="myInput" class="form-control" onkeyup="myFunction()" placeholder="Pesquisar por CNPJ Nome"" title="Insira o CNPJ nome"></span>
        </div>

        <div>	
			<span><spring:theme code="dist.customer.serviceable"
									text="Serviceable :" /></span>
			<span><input type="checkbox" id="button1"/></span>
			
        </div>
    </div> --%>

    

        <div class="all-products-btns" style="float: right;"> 
        	<span class="download-order download-btn">
					<c:url value="/my-dashboard/download-customers" var="downloadCustomersUrl"/>
					<a id="downloadCustomers" href="${downloadCustomersUrl}"><spring:theme code="dist.customer.download" text="Download Customers" /></a>						
			</span>
        </div>
        
    </div>

	<div class="cusListheader">
	
		<spring:theme code="dist.custHistory" />
	</div>
	
	<div class="last">		
		<div class="standard-table customer-table">
			<div class="table-responsive">
				<table style="font-size: 12px" id="myTable">
					<thead>
						<tr>
							<th width="3%"><spring:theme code="dist.customer.serviceable"
									text="Serviceable" /></th>
							<th width="20%"><spring:theme
									code="dist.customer.cnpj" text="CNPJ" /></th>
							<th width="13%"><spring:theme
									code="dist.customer.store.name" text="Name" /></th>
							<%-- <th  width="14%"><spring:theme
									code="dist.customer.name" text="Contact Person" /></th> --%>
							<%-- <th width="15%">
							<spring:theme
									code="dist.customer.firstname" text="First Name" /></th>
							<th width="12%"><spring:theme
									code="dist.customer.lastname" text="Last Name" /></th> --%>
							<th width="13%"><spring:theme
									code="dist.customer.mail" text="Email Id" /></th>
							<th width="13%"><spring:theme code="dist.unit.customer.contactpersonumber"
									text="contact Number" /></th>
							<th width="22%"><spring:theme
									code="dist.customer.address" text="Address" /></th>
							
							<th width="13%"><spring:theme
									code="dist.customer.last.loggedin" text="loggedin" /></th>
							<th width="3%"><spring:theme code="dist.customer.action"
									text="Action" /></th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${empty customerList}">
						<tr><td colspan="8"><spring:theme
									code="dist.customer.nosearch" text="Sorry, No Customers Found!" /></td></tr>
					</c:if>
					<c:forEach items="${customerList}" var="customer" varStatus="loop">
					<tr>
					<td>
						<c:choose>
							<c:when test="${customer.serviceable}">
								<div class="circle_green"></div>
							</c:when>
							<c:otherwise>
								<div class="circle_red"></div>
							</c:otherwise>
						</c:choose>
					</td>
					<td>${customer.customerID}:${customer.defaultB2BUnit.contactPersonName}</td>
					<td>${customer.name}</td>
					<%-- <td>${customer.firstName}</td>
					<td>${customer.lastName}</td> --%>
					<td>${customer.email}</td>
					<td>${customer.primaryPhoneNumber}</td>
					
					 <td>
						${customer.defaultShipmentAddress.streetnumber}&nbsp;
						${customer.defaultShipmentAddress.streetname}&nbsp;
						${customer.defaultShipmentAddress.town}&nbsp; 
						${customer.defaultShipmentAddress.country.name}&nbsp; 
						${customer.defaultShipmentAddress.postalcode} 
					
					</td>
					<td>
					<fmt:setTimeZone value="Asia/Manila" />
									<fmt:formatDate type="both" value="${customer.lastLogin}" /></td> 
					<td><a href="${pageContext.request.contextPath}/my-dashboard/edit-customer/${customer.uid}" class="icon-link edit-icon"><spring:theme
									code="dist.customer.edit" text="Edit" /></a></td>
					</tr>
					</c:forEach>
					</tbody>
					</table>
				</div>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript">
$('th').click(function(){
    var table = $(this).parents('table').eq(0)
    var rows = table.find('tr:gt(0)').toArray().sort(comparer($(this).index()))
    this.asc = !this.asc
    if (!this.asc){rows = rows.reverse()}
    for (var i = 0; i < rows.length; i++){table.append(rows[i])}
});
function comparer(index) {
    return function(a, b) {
        var valA = getCellValue(a, index), valB = getCellValue(b, index)
        return $.isNumeric(valA) && $.isNumeric(valB) ? valA - valB : valA.localeCompare(valB)
    }
}
function getCellValue(row, index){ return $(row).children('td').eq(index).text() }

function myFunction() {
    var input, filter, table, tr, td, i;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("myTable");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
      td = tr[i].getElementsByTagName("td")[2];
      if (td) {
        if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
          tr[i].style.display = "";
        } else {
          tr[i].style.display = "none";
        }
      }       
    }
  }
  
function myFunction2() {
    var input, filter, table, tr, td, i;
    input = document.getElementById("myInput2");
    filter = input.value.toUpperCase();
    table = document.getElementById("myTable");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
      td = tr[i].getElementsByTagName("td")[1];
      if (td) {
        if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
          tr[i].style.display = "";
        } else {
          tr[i].style.display = "none";
        }
      }       
    }
  }
  


</script>
<style>
	.cusListheader {
		padding: 10px 0;
	    font-size: 28px;
	    font-weight: 600;
	    color: #154259;
	}
	
	.circle_green { 
                width:1%;
                padding:8px 8px;
                margin:0 auto;
                border:2px solid #a1a1a1;
                border-radius:25px;
                background-color:green;
            }
            
     .circle_red { 
                width:1%;
                padding:8px 8px;
                margin:0 auto;
                border:2px solid #a1a1a1;
                border-radius:25px;
                background-color:red;
            }
     .cust-list-filters {
     	margin-top: 10px;
     	padding-bottom: 10px;
     	border-bottom: 1px solid #d9d9d9
     }
     @media (min-width: 640px) {
	     .cust-list-filters div {
	     	display: inline-block;
	     	padding-right: 10px;
	     }
     }
     @media (max-width: 640px) {
     	.cust-list-filters div {
	        	padding-top: 10px;
	     }
     }
     .cust-list-filters .form-control {
     	display: inline-block;
     	width: auto;
     }
     .search-customer div{
  float:left;
}
</style>




