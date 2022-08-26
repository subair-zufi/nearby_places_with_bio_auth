part of 'location_cubit.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState({
    @Default(false) isLoading,
    GoogleMapController? controller,
    LatLng? userLocation,
    @Default([]) List<PlacesSearchResult> result,
    Failure? error,
  }) = _LocationState;

  factory LocationState.initial() =>  const LocationState();
}
