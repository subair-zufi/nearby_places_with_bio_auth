import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:injectable/injectable.dart';
import 'package:petronas_sample/src/business_logic/models/failure.dart';
import 'package:petronas_sample/src/constants/api_key.dart';
import 'package:petronas_sample/src/constants/error_codes.dart';

abstract class LocationService {
  Future<Either<Failure, Position>> currentLocation();
  Future<Either<Failure, List<PlacesSearchResult>>> fethNearByPetrolStations(
      LatLng location);
  Future<Either<Failure, List<LatLng>>> getPolyLinePoints(
      LatLng startLocation, LatLng endLocation);
  Future<Either<Failure, double>> getDistance(
      LatLng startLocation, LatLng endLocation);
}

@LazySingleton(as: LocationService)
class LocationImpl extends LocationService {
  @override
  Future<Either<Failure, Position>> currentLocation() async {
    try {
      //Initialization
      bool serviceEnabled;
      LocationPermission permission;

      //Handling location service
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location service is off
        return left(Failure(
            message: "Location Service is disabled",
            code: ErrorCode.locationOff));
      }

      // Handling device permission
      permission = await Geolocator.checkPermission();
      // Not have permission
      if (permission == LocationPermission.denied) {
        // Permission requested
        permission = await Geolocator.requestPermission();
        // Permission denied when requested
        if (permission == LocationPermission.denied) {
          throw Failure(
              message: "Location permissions are denied",
              code: ErrorCode.permissionDenied);
        }

        // Denied forever
        if (permission == LocationPermission.deniedForever) {
          throw Failure(
              message:
                  "Location permissions are permanently denied, we cannot request permissions.",
              code: ErrorCode.permissionDeniedForever);
        }
      }

      return right(await Geolocator.getCurrentPosition());
    } catch (e) {
      return left(
          Failure(message: "Unknown error occured", code: ErrorCode.unknown));
    }
  }

  @override
  Future<Either<Failure, List<PlacesSearchResult>>> fethNearByPetrolStations(
      LatLng location) async {
    try{
      final places = GoogleMapsPlaces(apiKey: apiKey);
    PlacesSearchResponse response = await places.searchNearbyWithRadius(
      Location(lat: location.latitude, lng: location.longitude),
      100000,
      type: "gas_station",
      keyword: 'petronas',
    );
    // Set<Marker> markers = response.results
    //     .map((e) => Marker(
    //         markerId: MarkerId(e.name),
    //         icon: BitmapDescriptor.defaultMarkerWithHue(
    //             BitmapDescriptor.hueAzure),
    //         position:
    //             LatLng(e.geometry!.location.lat, e.geometry!.location.lng)))
    //     .toSet();

    print("markers: ${response.results.length}");
    if (response.errorMessage != null) {
      return left(Failure(message: response.errorMessage.toString()));
    }
    return right(response.results);
    }catch (e, stack){
      print(stack);
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LatLng>>> getPolyLinePoints(
      LatLng startLocation, LatLng endLocation) async {
    PolylinePoints polylinePoints = PolylinePoints();

    String googleAPiKey = apiKey;

    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(startLocation.latitude, startLocation.longitude),
      PointLatLng(endLocation.latitude, endLocation.longitude),
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      return left(Failure(
          message: result.errorMessage.toString(), code: ErrorCode.unknown));
    }
    return right(polylineCoordinates);
  }

  @override
  Future<Either<Failure, double>> getDistance(
      LatLng startLocation, LatLng endLocation) async {
    final getPolylineCordsTask =
        await getPolyLinePoints(startLocation, endLocation);
    List<LatLng> polylineCoordinates =
        getPolylineCordsTask.fold((f) => throw (f), (r) {
      return r;
    });
    double totalDistance = 0;
    for (var i = 0; i < polylineCoordinates.length - 1; i++) {
      totalDistance += _calculateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude);
    }
    print("totalDistance  $totalDistance");
    return right(totalDistance);
  }

  double _calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}
// https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=cruise&location=37.4219983%2C-122.084&radius=1500&type=restaurant&key=AIzaSyBtFss8DzpsvR2IgKgNah-sQRQqrv8tSDE