part of 'place_search_cubit.dart';

@freezed
class PlaceSearchState with _$PlaceSearchState {
  const factory PlaceSearchState({
    @Default(false) bool isLoading,
    @Default([]) List<PlacesSearchResult> result,
    Failure? error,
  }) = _PlaceSearchState;
  factory PlaceSearchState.initial() => const PlaceSearchState();
}
