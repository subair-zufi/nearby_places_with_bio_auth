import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:petronas_sample/src/business_logic/models/failure.dart';
import 'package:petronas_sample/src/business_logic/services/location_service.dart';
import 'package:petronas_sample/src/locator.dart';

part 'place_search_state.dart';
part 'place_search_cubit.freezed.dart';

class PlaceSearchCubit extends Cubit<PlaceSearchState> {
  PlaceSearchCubit() : super(PlaceSearchState.initial());

  searchPlace(String query) async {
    emit(state.copyWith(isLoading: true));
    final searchTask = await getIt<LocationService>().fetchPlaces(query);
    searchTask.fold((l) => emit(state.copyWith(isLoading: false, error: l)),
        (r) => emit(state.copyWith(isLoading: false, result: r, error: null)));
  }
}
