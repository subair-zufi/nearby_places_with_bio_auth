import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:petronas_sample/src/business_logic/models/failure.dart';

abstract class AuthService {
  Future<Either<Failure, bool>> authenticate();
}

@LazySingleton(as: AuthService)
class AuthImpl extends AuthService {
  @override
  Future<Either<Failure, bool>> authenticate() async {
    final LocalAuthentication auth = LocalAuthentication();

    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    // final bool authSupported = await auth.isDeviceSupported();
    if (canAuthenticateWithBiometrics) {
      try {
        await auth.authenticate(
          localizedReason: 'Please authenticate to continue',
        );
        return right(true);
      } on PlatformException catch (e) {
        return left(Failure(message: e.message.toString()));
      } catch (e) {
        return left(
            Failure(message: 'Failed authentication with unknown error'));
      }
    } else {
      return left(Failure(
          message:
              "Bio metrics authentication is not supported on this device. Skips for now"));
    }
  }
}
