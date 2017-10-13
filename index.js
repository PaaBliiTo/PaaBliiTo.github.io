$(document).ready(function(){

	$.get( "https://api.blockcypher.com/v1/btc/main", function(data) {
		$( "#block-height" ).html( data.height );
	});

	$( "#block-button" ).click(function() {
		var blockhash = $('#block-input').val();
		$.get( "https://api.blockcypher.com/v1/btc/main/blocks/"+blockhash, function(data) {
			$( "#block-info" ).text( JSON.stringify(data, null, 4) );
			console.log(data);
		});
	});

	$( "#address-button" ).click(function() {
		var addresshash = $('#address-input').val();
		$.get( "https://api.blockcypher.com/v1/btc/main/addrs/"+addresshash, function(data) {
			$( "#address-info" ).text( JSON.stringify(data, null, 4) );
			console.log(data);
		});
	});
});