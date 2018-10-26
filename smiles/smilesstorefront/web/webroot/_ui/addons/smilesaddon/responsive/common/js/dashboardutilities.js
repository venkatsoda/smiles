$(document).ready(function () {
	$('.accOrderList .upload-btn, .upload-orders .uploadPopup b').click(function(){
		$('.upload-orders .uploadPopup').toggle();
	});
	$('.upload-inventory .upload-btn, .upload-inventory .uploadPopup b').click(function(){
		$('.upload-inventory .uploadPopup').toggle();
	});
	$('.upload-pricing .upload-btn, .upload-pricing .uploadPopup b').click(function(){
		$('.upload-pricing .uploadPopup').toggle();
	});
//	$('.upload-trade span, .upload-trade .uploadPopup b').click(function(){
//		$('.upload-trade .uploadPopup').toggle();
//	});
//	$('.upload-product span, .upload-product .uploadPopup b').click(function(){
//		$('.upload-product .uploadPopup').toggle();
//	});
//	$('.upload-order span, .upload-order .uploadPopup b').click(function(){
//		$('.upload-order .uploadPopup').toggle();
//	});
});