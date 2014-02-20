$(document).ready(function() {
  Map.defaultLat = 39.5500;
  Map.defaultLong = -107.3167;
  Map.defaultZoom = 9;

  $.ajax({
    type: 'GET',
    dataType: 'json',
    url: '/api/v1/gauges',
    success: function(data){
      geojson = data
      L.mapbox.map('map', 'srtsrt32.haldb884')
        .setView([Map.defaultLat, Map.defaultLong], Map.defaultZoom)
        .featureLayer.setGeoJSON(geojson)
    }
  });

});
