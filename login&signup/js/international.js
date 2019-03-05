$(function($) {
	var telInput = $('#tel');
	telInput.intlTelInput({
		utilsScript: 'https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/8.4.8/js/utils.js',
		initialCountry: 'kr',
	});
});