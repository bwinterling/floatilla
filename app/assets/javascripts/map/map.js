$(document).ready(function() {
  Map.defaultLat = 39.5500;
  Map.defaultLong = -107.3167;
  Map.defaultZoom = 9;

  Map.geojson = [
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [Map.defaultLong, Map.defaultLat]
      },
      "properties": {
        "title": "Shred the gnar",
        "description": "yup",
        "marker-color": "#fc4353",
        "marker-size": "large",
        "marker-symbol": "monument"
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [Map.defaultLong + 1, Map.defaultLat - 1]
      },
      "properties": {
        "title": "Shred the gnar",
        "description": "yup",
        "marker-color": "#fc4353",
        "marker-size": "large",
        "marker-symbol": "monument"
      }
    }
  ];

  L.mapbox.map('map', 'srtsrt32.haldb884')
    .setView([Map.defaultLat, Map.defaultLong], Map.defaultZoom)
    .featureLayer.setGeoJSON(Map.geojson);
});
