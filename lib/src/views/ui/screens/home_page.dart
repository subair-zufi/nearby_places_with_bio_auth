import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:petronas_sample/src/business_logic/blocs/location_bloc/location_cubit.dart';
import 'package:dartz/dartz.dart' as ei;
import 'package:petronas_sample/src/business_logic/models/failure.dart';
import 'package:petronas_sample/src/business_logic/services/location_service.dart';
import 'package:petronas_sample/src/locator.dart';
import 'package:petronas_sample/src/views/routes/app_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = [
      const _MapContainer(),
      const _LocationList(),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SingleChildScrollView(child: Column(children: children)),
    );
  }
}

class _MapContainer extends StatelessWidget {
  const _MapContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * .4,
      child: BlocBuilder<LocationCubit, LocationState>(
        bloc: context.read<LocationCubit>()..fetchUserLocation(),
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.userLocation != null) {
            final initilalCameraPosition = CameraPosition(
              target: state.userLocation!,
              zoom: 12,
            );

            Set<Marker> markers = Set();
            if (state.result.isNotEmpty) {
              for (PlacesSearchResult result in state.result) {
                markers.add(Marker(
                  //add distination location marker
                  markerId: MarkerId(result.geometry!.location.toString()),
                  position: LatLng(result.geometry!.location.lat,
                      result.geometry!.location.lng),
                  icon: BitmapDescriptor.defaultMarker,
                ));
              }
            }
            return GoogleMap(
              initialCameraPosition: initilalCameraPosition,
              mapType: MapType.normal,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              scrollGesturesEnabled: true,
              markers: markers,
              onMapCreated: (ctrl) {
                context.read<LocationCubit>().onCreateMap(ctrl);
              },
            );
          } else if (state.error != null) {
            return Center(
              child: Text(state.error!.message),
            );
          } else {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
        },
      ),
    );
  }
}

class _LocationList extends StatelessWidget {
  const _LocationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        if (state.userLocation != null && state.result.isNotEmpty) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.result.take(5).length,
            itemBuilder: (_, index) {
              final data = state.result[index];
              return _PlaceTile(data, state);
            },
          );
        }else if(state.result.isNotEmpty){
          return const Center(
            child: Text("No near by location found"),
          );
        } else if (state.error != null) {
          return Center(
            child: Text(state.error!.message),
          );
        } else {
          return const Center(
            child: Text("Loading.."),
          );
        }
      },
    );
  }
}

class _PlaceTile extends StatelessWidget {
  final PlacesSearchResult data;
  final LocationState state;
  const _PlaceTile(this.data, this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final startLocation =
        LatLng(data.geometry!.location.lat, data.geometry!.location.lng);
    final endLocation =
        LatLng(state.userLocation!.latitude, state.userLocation!.longitude);
    return ListTile(
      onTap: () {
        AutoRouter.of(context).push(DirectionRoute(place: data));
      },
      title: Text(data.name),
      subtitle: Text(data.vicinity??""),
      trailing: FutureBuilder<ei.Either<Failure, double>>(
        future:
            getIt<LocationService>().getDistance(startLocation, endLocation),
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox(
                width: 16, height: 16, child: CircularProgressIndicator());
          }
          return snapshot.data!.fold(
              (l) => Tooltip(
                    child: const Icon(
                      Icons.warning,
                      color: Colors.red,
                    ),
                  ),
              (r) => Text("${r.toStringAsFixed(1)}km"));
        },
      ),
    );
  }
}
