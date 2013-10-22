$(document).ready(function(){
	var geocoder  = new google.maps.Geocoder();

	function createMarker(coords, map){
		var marker = new google.maps.Marker({
			position: coords,
			map: map
		})
	}

	function initialize(){
		var coords = new google.maps.LatLng(50.397, 30.644);
		var featureOpts = [
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
		var MY_MAPTYPE_ID = 'custom_style';
		var input = document.getElementById('addressField');
		var autocompleteOptions = {
			componentRestrictions: {country: 'ua'}
		};


		var mapOptions = {
			center: coords,
			zoom: 6,
			mapTypeControlOptions: {
				mapTypeIds: [google.maps.MapTypeId.ROADMAP, MY_MAPTYPE_ID]
			},
			mapTypeId: MY_MAPTYPE_ID,
			disableDefaultUI: true
		};
		var styledMapOptions = {
			name: 'UFO Style'
		};
		var map = new google.maps.Map(document.getElementById("map"), mapOptions);
		var customMapType = new google.maps.StyledMapType(featureOpts, styledMapOptions);
		map.mapTypes.set(MY_MAPTYPE_ID, customMapType);
		var autocomplete = new google.maps.places.Autocomplete(input, autocompleteOptions);

		google.maps.event.addListener(map, "click", function(){
			codeAddress_eng();
		});
	}


	google.maps.event.addDomListener(window, 'load', initialize);

});