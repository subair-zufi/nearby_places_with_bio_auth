// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AuthPage());
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    DirectionRoute.name: (routeData) {
      final args = routeData.argsAs<DirectionRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: DirectionPage(args.place, key: args.key));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(AuthRoute.name, path: '/'),
        RouteConfig(HomeRoute.name, path: '/home-page'),
        RouteConfig(DirectionRoute.name, path: '/direction-page')
      ];
}

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute() : super(AuthRoute.name, path: '/');

  static const String name = 'AuthRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [DirectionPage]
class DirectionRoute extends PageRouteInfo<DirectionRouteArgs> {
  DirectionRoute({required PlacesSearchResult place, Key? key})
      : super(DirectionRoute.name,
            path: '/direction-page',
            args: DirectionRouteArgs(place: place, key: key));

  static const String name = 'DirectionRoute';
}

class DirectionRouteArgs {
  const DirectionRouteArgs({required this.place, this.key});

  final PlacesSearchResult place;

  final Key? key;

  @override
  String toString() {
    return 'DirectionRouteArgs{place: $place, key: $key}';
  }
}
