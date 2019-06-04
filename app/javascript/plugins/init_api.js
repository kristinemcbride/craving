// ES6
import autocomplete from 'autocomplete.js';
global.autocomplete = autocomplete;


function setAutoCompleteList(list) {

  autocomplete('#restaurant_dish_form_restaurant_name', { hint: false }, [
    {
      source: list,
      displayKey: 'description',
      templates: {
        suggestion: function(suggestion) {
          return suggestion._highlightResult.my_attribute.value;
        }
      }
    }
  ]).on('autocomplete:selected', function(event, suggestion, dataset, context) {
    console.log(event, suggestion, dataset, context);
  });
}

var map;
var service;
var infowindow;

function searchResto() {
  // var defaultBounds = new google.maps.LatLngBounds(
  // new google.maps.LatLng(41.2851, 2.0734),
  // new google.maps.LatLng(41.4851, 2.2734));

  // var input = document.querySelector('.resto-input');
  // console.log(input)
  // var options = {
  //   bounds: defaultBounds,
  //   types: ['restaurant', 'food']
  // };

  // const autocomplete = new google.maps.places.Autocomplete(input, options);
  // console.log(autocomplete)
  const restoSearch = document.querySelector(".resto-input");
  restoSearch.addEventListener("keyup", event => {
      if (restoSearch.value.length > 0) {
        initService(restoSearch.value);
      }
  });
}

// function initMap(finalWord) {
//   var barcelona = new google.maps.LatLng(41.3851, 2.1734);

//   // infowindow = new google.maps.InfoWindow();

//   map = new google.maps.Map(
//       document.getElementById('places-api'), {center: barcelona, zoom: 15});



//   var request = {
//     query: finalWord,
//     fields: ['formatted_address', 'geometry', 'name', 'photos' ,'place_id' , 'price_level', 'types']
//   };


//   var service = new google.maps.places.PlacesService(map);
//   console.log(service);

//   service.findPlaceFromQuery(request, function(results, status) {
//     if (status === google.maps.places.PlacesServiceStatus.OK) {
//       for (var i = 0; i < results.length; i++) {
//         console.log(results[i]);
//       }
//       // map.setCenter(results[0].geometry.location);
//     }
//     console.log(results);
//   });
// }
function setListenersOnListItems() {
  const items = document.querySelectorAll('#results > li');
  const formPlaceID = document.querySelector('#restaurant_place_id');
  const formName = document.querySelector('#restaurant_dish_form_restaurant_name');

  items.forEach(item => {
    item.addEventListener('click', (event) => {
      console.log(event.currentTarget)
      formPlaceID.value = event.currentTarget.dataset.placeId;
      formName.value = event.currentTarget.innerText
      document.querySelector('#results').innerHTML = ''
    })
  })
}

function initService(finalWord) {

  var request = {
    locationBias: { radius: 2000, center: {lat: 41.3851, lng: 2.1734}},
    type: ['restaurant', 'food']
  };

  var displaySuggestions = function(predictions, status) {
    if (status != google.maps.places.PlacesServiceStatus.OK) {
      // alert(status);
      return;
    }

    const results = document.getElementById('results');
    results.innerHTML = '';

    predictions.forEach(function(prediction) {
      if (!prediction.types) return;

      if (prediction.types.includes('food')) {
        console.log(prediction)
        const template = `
         <li data-place-id='${prediction.place_id}'> ${prediction.description} </li>
        `
        results.insertAdjacentHTML('afterBegin', template);
      }
    });
    setListenersOnListItems()
  };

  var service = new google.maps.places.AutocompleteService();
  service.getQueryPredictions({ input: finalWord, radius: 2000, location: new google.maps.LatLng(41.3851, 2.1734)}, displaySuggestions);
}

export { searchResto };





