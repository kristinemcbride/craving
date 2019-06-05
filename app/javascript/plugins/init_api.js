const initRestaurantSearch = () => {
  const restoSearch = document.querySelector(".resto-input");
  restoSearch.addEventListener("keyup", event => {
    if (restoSearch.value.length > 0) {
      initService(restoSearch.value);
    }
  });
}

const fetchSelectedResult = (selectedResult) => {
  const map = new google.maps.Map(
      document.getElementById('places-api'), {
        center: new google.maps.LatLng(41.3851, 2.1734),
        zoom: 15
       });

  const request = {
    query: selectedResult,
    fields: ['formatted_address', 'name', 'photos' ,'place_id' , 'price_level']
  };

  const service = new google.maps.places.PlacesService(map);
  service.findPlaceFromQuery(request, insertSelectedResult);
}

const insertSelectedResult = (results, status) => {
  const formName = document.querySelector('#restaurant_dish_form_restaurant_name');
  const formRestaurantData = document.getElementById('restaurant_api_data');
  if (status === google.maps.places.PlacesServiceStatus.OK) {
    formName.value = results[0].name;
    formRestaurantData.value = JSON.stringify(results[0]);
  }
}

const setListenersOnResults = () => {
  const items = document.querySelectorAll('#results > li');
  const formPlaceID = document.querySelector('#restaurant_place_id');

  items.forEach(item => {
    item.addEventListener('click', (event) => {
      fetchSelectedResult(event.currentTarget.innerText);
      document.querySelector('#results').innerHTML = ''
    })
  })
}

const initService = (query) => {
  const request = {
    locationBias: { radius: 2000, center: {lat: 41.3851, lng: 2.1734}},
    type: ['restaurant', 'food']
  };
  const service = new google.maps.places.AutocompleteService();
  service.getQueryPredictions({ input: query, radius: 2000, location: new google.maps.LatLng(41.3851, 2.1734)}, displaySuggestions);
}

const displaySuggestions = (predictions, status) => {
  if (status != google.maps.places.PlacesServiceStatus.OK) return;
  insertPredictions(predictions)
  setListenersOnResults()
};

const insertPredictions = (predictions) => {

  const results = document.getElementById('results');
  results.innerHTML = '';

  predictions.forEach(function(prediction) {
    if (!prediction.types) return;
    if (prediction.types.includes('food')) {
      const template = `
       <li data-place-id='${prediction.place_id}'> ${prediction.description} </li>
      `
      results.insertAdjacentHTML('afterBegin', template);
    }
  });
}

export { initRestaurantSearch };





