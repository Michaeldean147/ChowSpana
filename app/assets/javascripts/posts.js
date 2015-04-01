function placeMarkers(map, markerJSON) {
  console.log(map.addSource);
  map.addSource('markers', {
    'type': 'geojson',
    'data': {
      'type': 'featureCollection',
      'features': markerJSON
    }
  });

}
