import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:petronas_sample/src/business_logic/models/failure.dart';
import 'package:petronas_sample/src/business_logic/services/location_service.dart';
import 'package:petronas_sample/src/locator.dart';

part 'location_state.dart';
part 'location_cubit.freezed.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationState.initial());

  Future fetchUserLocation() async {
    emit(state.copyWith(isLoading: true));
    final fetchLocationTask = await getIt<LocationService>().currentLocation();
    fetchLocationTask.fold(
      (f) => emit(state.copyWith(isLoading: false, error: f)),
      (data) async {
        emit(
          state.copyWith(
              isLoading: false,
              userLocation: LatLng(data.latitude, data.longitude),
              error: null),
        );
        await fetchNearByPetrolStations(LatLng(data.latitude, data.longitude));
      },
    );
  }

  onCreateMap(GoogleMapController controller) async {
    emit(state.copyWith(controller: controller));
    const locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((event) {
      emit(state.copyWith(
          userLocation: LatLng(event.latitude, event.longitude)));
      state.controller!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(event.latitude, event.longitude), zoom: 15),
      ));
    });
    await Future.delayed(const Duration(microseconds: 400));
    // fetchNearByPetrolStations();
  }

  fetchNearByPetrolStations(LatLng location) async {
    emit(state.copyWith(isLoading: true));
    final fetchLocationsTask =
        await getIt<LocationService>().fethNearByPetrolStations(location);
    fetchLocationsTask.fold(
        (f) => emit(state.copyWith(isLoading: false, error: f)), (data) async {
      emit(state.copyWith(isLoading: false, result: data, error: null));
      if (state.controller != null && state.result.isNotEmpty) {
        for (PlacesSearchResult res in state.result) {
          if (res.geometry != null) {
            await Future.delayed(const Duration(seconds: 3));
            await state.controller!
                .animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(
                      res.geometry!.location.lat, res.geometry!.location.lng),
                  zoom: 15),
            ));
          }
        }
      }
    });
  }
}
