/**
 * 
 */

$(document).ready(function()
{ 
		if ($("#alertSuccess").text().trim() == "") 
		 { 
			$("#alertSuccess").hide(); 
		 } 
		 	$("#alertError").hide(); 
}); 

// SAVE ============================================
$(document).on("click", "#btnSave", function(event) 
{ 
		// Clear alerts---------------------
		 $("#alertSuccess").text(""); 
		 $("#alertSuccess").hide(); 
		 $("#alertError").text(""); 
		 $("#alertError").hide(); 
		 
// Form validation-------------------
var status = validateItemForm(); 
		if (status != true) 
		 { 
			 $("#alertError").text(status); 
			 $("#alertError").show(); 
			 return; 
		 } 
		
		
// If valid------------------------
 $("#formItem").submit(); 
}); 
// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event) 
{ 
		 $("#hidItemIDSave").val($(this).closest("tr").find('#hidItemIDUpdate').val()); 
		 $("#investName").val($(this).closest("tr").find('td:eq(0)').text()); 
		 $("#mail").val($(this).closest("tr").find('td:eq(1)').text()); 
		 $("#projectCode").val($(this).closest("tr").find('td:eq(2)').text()); 
		 $("#projectName").val($(this).closest("tr").find('td:eq(3)').text());
		 $("#investAmount").val($(this).closest("tr").find('td:eq(3)').text());
		 
}); 
	// CLIENT-MODEL================================================================
	function validateItemForm() 
	{ 
	// CODE
		if ($("#investName").val().trim() == "") 
		 { 
			return "Insert Item Code."; 
		 } 
	// NAME
		if ($("#mail").val().trim() == "") 
		 { 
			return "Insert Item Name."; 
		 }
	// MAIL
		if ($("#projectCode").val().trim() == "") 
		 { 
			return "Insert Item Name."; 
		 }
		
		// MAIL
		if ($("#projectName").val().trim() == "") 
		 { 
			return "Insert Item Name."; 
		 }
		
	//PRICE-------------------------------
		if ($("#investAmount").val().trim() == "") 
		 { 
			return "Insert Item Price."; 
		 } 
	// is numerical value
var tmpAmount = $("#investAmount").val().trim(); 
		if (!$.isNumeric(tmpAmount)) 
		 { 
			return "Insert a numerical value for Invest Amount."; 
		 } 
// convert to decimal price
$("#itemPrice").val(parseFloat(tmpPrice).toFixed(2)); 


return true; 
}
