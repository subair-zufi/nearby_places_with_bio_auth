part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoading,
    Failure? error,
    @Default(false) bool authSucceed
  })=  _AuthState;
  factory AuthState.initial() =>const AuthState();
}
