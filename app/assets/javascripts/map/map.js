$(function() {
  "use strict";
  Map.defaultLat = 39.5500;
  Map.defaultLong = -107.3167;
  Map.defaultZoom = 9;

  Map.plotGauges = function(geojson) {
    L.mapbox.map('map', 'srtsrt32.haldb884')
      .setView([Map.defaultLat, Map.defaultLong], Map.defaultZoom)
      .featureLayer.setGeoJSON(geojson);
  };

  Map.fetchGauges = function(callback) {
    $.ajax({
      type: 'GET',
      dataType: 'json',
      url: '/api/v1/gauges',
      success: callback
    });
  };

  Map.fetchGauges(Map.plotGauges);
});
