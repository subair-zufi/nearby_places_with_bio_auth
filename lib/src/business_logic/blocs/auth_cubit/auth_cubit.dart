import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petronas_sample/src/business_logic/models/failure.dart';
import 'package:petronas_sample/src/business_logic/services/auth_service.dart';
import 'package:petronas_sample/src/locator.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial());
  Future authenticateUser() async {
    emit(state.copyWith(isLoading: true));
    final authTask = await getIt<AuthService>().authenticate();
    authTask.fold(
      (error) => emit(state.copyWith(isLoading: false, error: error)),
      (success) => emit(
        state.copyWith(isLoading: false, error: null, authSucceed: true),
      ),
    );
  }

  @override
  Future<void> close() {
    emit(AuthState.initial());
    return super.close();
  }
}
