$(document).ready(function(){

	$(".btn-block-top").click(function(){
		$.get( "https://api.blockcypher.com/v1/btc/main", function(data1) {
			$.get("https://api.blockcypher.com/v1/btc/main/blocks/"+data1.height, function(data){
				var htmlOutput = '';
			if(data.error != undefined){
				htmlOutput += data.error;
			}
			else{
				htmlOutput += '<p>Height: '+data.height+'</p><p>Hash: '+data.hash+'</p><p>Time: '+data.time+'</p><p>Fees: '+data.fees+' satoshis</p>';

			}
			$(".results").html( htmlOutput );
			});
			
		});
	});

	$(".btn-block-height").click(function(){
		var htmlOutput = '';
		if($(".input-block-height").val() == ""){
			htmlOutput += "Block Height input is blank. Please fill it.";
			$(".results").html( htmlOutput );
		}
		else{
			$.get( "https://api.blockcypher.com/v1/btc/main/blocks/"+$(".input-block-height").val(), function(data) {
				if(data.error != undefined){
					htmlOutput += data.error;
				}
				else{
					htmlOutput += '<p>Height: '+data.height+'</p><p>Hash: '+data.hash+'</p><p>Time: '+data.time+'</p><p>Fees: '+data.fees+' satoshis</p>';
				}
				$(".results").html( htmlOutput );
			});
		}
	});

	$(".btn-address-hash").click(function(){
		var htmlOutput = '';
		if($(".input-address-hash").val() == ""){
			htmlOutput += "Address Hash input is blank. Please fill it.";
			$(".results").html( htmlOutput );
		}
		else{
			$.get( "https://api.blockcypher.com/v1/btc/main/addrs/"+$(".input-address-hash").val(), function(data) {
				if(data.error != undefined){
					htmlOutput += data.error;
				}
				else{
					htmlOutput += '<p>Address: '+data.address+'</p><p>Balance: '+data.balance+'</p><p>Number of Transactions: '+data.n_tx+'</p>';
				}
				$(".results").html( htmlOutput );
			});
		}
	});
});