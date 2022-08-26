import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:petronas_sample/src/business_logic/blocs/location_bloc/location_cubit.dart';
import 'package:petronas_sample/src/business_logic/models/failure.dart';
import 'package:petronas_sample/src/business_logic/services/location_service.dart';
import 'package:petronas_sample/src/locator.dart';
import 'package:petronas_sample/src/views/utils/snack_bar.dart';
import 'package:dartz/dartz.dart' as ei;

class DirectionPage extends StatelessWidget {
  final PlacesSearchResult place;
  const DirectionPage(this.place, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
      bloc: context.read<LocationCubit>()..fetchUserLocation(),
      builder: (context, state) {
        if (state.userLocation != null) {
          final initilalCameraPosition = CameraPosition(
            target: state.userLocation!,
            zoom: 12,
          );
          final startLocation = LatLng(
              place.geometry!.location.lat, place.geometry!.location.lng);
          final endLocation = LatLng(
              state.userLocation!.latitude, state.userLocation!.longitude);
          Set<Marker> markers = Set();
          markers.add(Marker(
            //add distination location marker
            markerId: MarkerId(startLocation.toString()),
            position: startLocation, //position of marker
            infoWindow: const InfoWindow(
              //popup info
              title: 'Destination Point ',
              snippet: 'Destination Marker',
            ),
            icon: BitmapDescriptor.defaultMarker, //Icon for Marker
          ));
          return Scaffold(
            appBar: AppBar(),
            floatingActionButton: state.isLoading
                ? FloatingActionButton(
                    onPressed: () {},
                    child: const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const SizedBox(),
            body: FutureBuilder<ei.Either<Failure, List<LatLng>>>(
                future: getIt<LocationService>()
                    .getPolyLinePoints(startLocation, endLocation),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return snapshot.data!.fold(
                    (l) => Center(child: Text(l.message)),
                    (r) {
                      Map<PolylineId, Polyline> polylines = {};
                      PolylineId id = const PolylineId("poly");
                      Polyline polyline = Polyline(
                        polylineId: id,
                        color: Colors.deepPurpleAccent,
                        points: r,
                        width: 8,
                      );
                      polylines[id] = polyline;
                      return GoogleMap(
                        initialCameraPosition: initilalCameraPosition,
                        mapType: MapType.normal,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        zoomGesturesEnabled: true,
                        zoomControlsEnabled: true,
                        scrollGesturesEnabled: true,
                        onMapCreated: (ctrl) {
                          context.read<LocationCubit>().onCreateMap(ctrl);
                        },
                        markers: markers,
                        polylines: Set<Polyline>.of(polylines.values),
                      );
                    },
                  );
                }),
          );
        } else {
          return const SizedBox();
        }
      },
      listener: (_, state) {
        if (state.error != null) {
          showSnackBar(context, Text(state.error!.message));
        }
      },
    );
  }
}
