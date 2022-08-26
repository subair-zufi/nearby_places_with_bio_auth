import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:petronas_sample/src/business_logic/blocs/auth_cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petronas_sample/src/views/routes/app_router.dart';
import 'package:petronas_sample/src/views/utils/snack_bar.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _authenticate() {
      context.read<AuthCubit>().authenticateUser();
    }

    return Scaffold(
      body: Center(
        child: BlocConsumer<AuthCubit, AuthState>(
          bloc: context.read<AuthCubit>()..authenticateUser(),
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const FlutterLogo(size: 96),
                const SizedBox(
                  height: 80,
                ),
                ElevatedButton(
                    onPressed: _authenticate, child: const Text('Authenticate'))
              ],
            );
          },
          listener: (_, state) async {
            if (state.error != null) {
              showSnackBar(context, Text(state.error!.message));
              await Future.delayed(const Duration(seconds: 1));
              await AutoRouter.of(context).push(const HomeRoute());
            }
            if (state.authSucceed == true) {
              AutoRouter.of(context).push(const HomeRoute());
            }
          },
        ),
      ),
    );
  }
}
