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
    const geolocate = new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      trackUserLocation: true
    });

    // debugger
    map.addControl(geolocate);

    map.on('load', function()
    {
      geolocate.trigger();
    });

   const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '35px';
      element.style.height = '35px';
      element.setAttribute('data-resto-id', marker.resto_id)

      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);

      element.addEventListener('click', (event) => {
          fetch("");
          const clickedRestoId = event.currentTarget.dataset.restoId;
          const dishes = Array.from(document.querySelectorAll('.dish-carousel-display'));
          dishes.forEach((dish) => {
            dish.classList.add('carousel-item-hidden');
            dish.classList.remove('carousel-item', 'active');
          });
          const selectedDishes = dishes.filter((dish) => dish.dataset.restoId === clickedRestoId);
          console.log(selectedDishes);
          selectedDishes.forEach((selectedDish) => {
            selectedDish.classList.add('carousel-item');
            selectedDish.classList.remove('carousel-item-hidden');

          });
          selectedDishes[0].classList.add('active')
      });

    });
    fitMapToMarkers(map, markers);

    // map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));
 }
 };


export { initMapbox };




