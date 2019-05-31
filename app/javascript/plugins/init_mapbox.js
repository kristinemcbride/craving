import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const fitMapToMarkers = (map, markers) => {
 const bounds = new mapboxgl.LngLatBounds();
 markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
 map.fitBounds(bounds, { padding: 70, maxZoom: 5000 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/kristinelmcbride/cjwashb7c0att1cp541r38wtf',
      zoom: 3
  });
    map.addControl(new mapboxgl.GeolocateControl({
    positionOptions: {
    enableHighAccuracy: true
    },
    trackUserLocation: true
    }));
   const markers = JSON.parse(mapElement.dataset.markers);
   console.log(markers, "These are the parsed markers");
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '35px';
      element.style.height = '35px';

      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
    });
    fitMapToMarkers(map, markers);

    // map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));
 }
};

export { initMapbox };
