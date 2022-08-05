import 'package:animation/transition_page/model/review.dart';

class Location {
  final String name;
  final String urlImage;
  final String latitude;
  final String longitude;
  final String addressLine1;
  final String addressLine2;
  final int starRating;
  final List<Review> reviews;

  Location({
    required this.reviews,
    required this.name,
    required this.urlImage,
    required this.latitude,
    required this.longitude,
    required this.addressLine1,
    required this.addressLine2,
    required this.starRating,
  });
}

List<Location> locations = [
  Location(
    name: 'ATCOASTAL',
    urlImage: 'assets/transitionlocation/sea.jpg',
    addressLine1: 'La Cresenta-Montrose, CA91020 Glendale',
    addressLine2: 'NO. 791187',
    starRating: 4,
    latitude: 'NORTH LAT 24',
    longitude: 'EAST LNG 17',
    reviews: Reviews.allReviews,
  ),
  Location(
    name: 'SYRACUSE',
    urlImage: 'assets/transitionlocation/mountain.jpg',
    addressLine1: 'La Cresenta-Montrose, CA91020 Glendale',
    addressLine2: 'NO. 11641',
    starRating: 4,
    latitude: 'SOUTH LAT 14',
    longitude: 'EAST LNG 27',
    reviews: Reviews.allReviews,
  ),
  Location(
    name: 'OCEANIC',
    urlImage: 'assets/transitionlocation/sea2.jpg',
    addressLine1: 'La Cresenta-Montrose, CA91020 Glendale',
    addressLine2: 'NO. 791187',
    starRating: 4,
    latitude: 'NORTH LAT 24',
    longitude: 'WEST LNG 08',
    reviews: Reviews.allReviews,
  ),
  Location(
    name: 'MOUNTAINOUS',
    urlImage: 'assets/transitionlocation/mountain2.jpg',
    addressLine1: 'La Cresenta-Montrose, CA91020 Glendale',
    addressLine2: 'NO. 791187',
    starRating: 4,
    latitude: 'SOUTH LAT 39',
    longitude: 'WEST LNG 41',
    reviews: Reviews.allReviews,
  ),
];
