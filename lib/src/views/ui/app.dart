import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petronas_sample/src/business_logic/blocs/auth_cubit/auth_cubit.dart';
import 'package:petronas_sample/src/business_logic/blocs/location_bloc/location_cubit.dart';
import 'package:petronas_sample/src/business_logic/blocs/place_search/place_search_cubit.dart';
import 'package:petronas_sample/src/views/app_theme.dart';
import 'package:petronas_sample/src/views/routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> AuthCubit()),
        BlocProvider(create: (_)=> LocationCubit()),
        BlocProvider(create: (_)=> PlaceSearchCubit()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: AppTheme.light,
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: appRouter.delegate(),
      ),
    );
  }
}
