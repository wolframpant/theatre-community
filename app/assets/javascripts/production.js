// get JSON object
// on success, parse it and
// hand it over to MapBox for mapping
$.ajax({
  dataType: 'text',
  url: 'productions/index.json',
  success: function(data) {
    var geojson;
    geojson = $.parseJSON(data);
    return map.featureLayer.setGeoJSON(geojson);
  }
});
