import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:petronas_sample/src/views/ui/screens/auth_page.dart';
import 'package:petronas_sample/src/views/ui/screens/direction_page.dart';
import 'package:petronas_sample/src/views/ui/screens/home_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: AuthPage, initial: true),
  AutoRoute(page: HomePage),
  AutoRoute(page: DirectionPage)
])
class AppRouter extends _$AppRouter {}
