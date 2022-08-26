import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:petronas_sample/src/locator.config.dart';

final getIt = GetIt.I;

@injectableInit
configureDependencies() => $initGetIt(getIt);
