$(document).ready(function(){
	alert(11)
	var geocoder, map, markers = [];
	geocoder = new google.maps.Geocoder();

	function createMarker(coords, map){
		new google.maps.Marker({
			position: coords,
			map: map
		});
	}

	function getCoordinatsFromAddress(address){
		geocoder.geocode({ 'address': address}, function(results, status){
			if(status == google.maps.GeocoderStatus.OK){
				var latitude = results[0].geometry.location.lat();
				var longitude = results[0].geometry.location.lng();
				map.setCenter(new google.maps.LatLng(latitude,longitude));
				map.setZoom(15);
				createMarker(new google.maps.LatLng(latitude,longitude), map)
			}
		});
	}

	function initialize(){
		var coords, featuresOpts, addressFrom, addressTo, autocompleteOptions, mapOptions, customMapType,
			MY_MAPTYPE_ID = 'custom_style';
		coords = new google.maps.LatLng(50.397, 30.644);
		featuresOpts = [
			{
				"featureType": "water",
				"elementType": "geometry.fill",
				"stylers": [
					{ "gamma": 1.38 },
					{ "saturation": -38 },
					{ "lightness": 65 },
					{ "color": "#647d80" }
				]
			},
			{
				"featureType": "road",
				"elementType": "geometry",
				"stylers": [
					{ "color": "#000000" }
				]
			},
			{
				"featureType": "landscape",
				"elementType": "geometry",
				"stylers": [
					{ "lightness": -61 },
					{ "color": "#222b29" }
				]
			},
			{
				"featureType": "road",
				"elementType": "labels.text.stroke",
				"stylers": [
					{ "color": "#000000" }
				]
			},
			{
				"elementType": "labels.text.fill",
				"stylers": [
					{ "color": "#dadbda" }
				]
			},
			{
				"featureType": "poi",
				"elementType": "geometry.fill",
				"stylers": [
					{ "color": "#3d403a" }
				]
			},
			{
				"featureType": "road",
				"elementType": "geometry.stroke",
				"stylers": [
					{ "lightness": 85 },
					{ "color": "#515a55" }
				]
			},
			{
				"featureType": "administrative",
				"elementType": "labels.text.fill",
				"stylers": [
					{ "color": "#ffffff" }
				]
			},
			{
				"featureType": "administrative",
				"elementType": "labels.text.stroke",
				"stylers": [
					{ "color": "#000000" },
					{ "weight": 3 }
				]
			},
			{
				"featureType": "poi",
				"elementType": "labels.text.fill",
				"stylers": [
					{ "color": "#ffffff" }
				]
			},
			{
				"elementType": "labels.text.stroke",
				"stylers": [
					{ "color": "#000000" }
				]
			}
		];
		addressFrom = $("[name='address-from']")[0];
		addressTo = $("[name='address-to']")[0];
		autocompleteOptions = {
			componentRestrictions: {country: 'ua'}
		};

		mapOptions = {
			center: coords,
			zoom: 6,
			mapTypeControlOptions: {
				mapTypeIds: [google.maps.MapTypeId.ROADMAP, MY_MAPTYPE_ID]
			},
			mapTypeId: MY_MAPTYPE_ID,
			disableDefaultUI: true
		};
		map = new google.maps.Map($("#map")[0], mapOptions);
		customMapType = new google.maps.StyledMapType(featuresOpts, {name: 'UFO Style'});
		map.mapTypes.set(MY_MAPTYPE_ID, customMapType);
		var lol = new google.maps.places.Autocomplete(addressFrom, autocompleteOptions);

		addressFrom.addEventListener("blur", function(){
			getCoordinatsFromAddress(addressFrom.value)
		});
		google.maps.event.addListener(map, "click", function(){

		});
	}
	google.maps.event.addDomListener(window, 'load', initialize);

});