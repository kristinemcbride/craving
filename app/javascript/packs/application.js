import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox';

import {animateStarReview}  from '../components/star_review';

initMapbox();
animateStarReview();
