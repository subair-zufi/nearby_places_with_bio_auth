// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'location_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocationState {
  dynamic get isLoading => throw _privateConstructorUsedError;
  GoogleMapController? get controller => throw _privateConstructorUsedError;
  LatLng? get userLocation => throw _privateConstructorUsedError;
  List<PlacesSearchResult> get result => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationStateCopyWith<LocationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationStateCopyWith<$Res> {
  factory $LocationStateCopyWith(
          LocationState value, $Res Function(LocationState) then) =
      _$LocationStateCopyWithImpl<$Res>;
  $Res call(
      {dynamic isLoading,
      GoogleMapController? controller,
      LatLng? userLocation,
      List<PlacesSearchResult> result,
      Failure? error});

  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$LocationStateCopyWithImpl<$Res>
    implements $LocationStateCopyWith<$Res> {
  _$LocationStateCopyWithImpl(this._value, this._then);

  final LocationState _value;
  // ignore: unused_field
  final $Res Function(LocationState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? controller = freezed,
    Object? userLocation = freezed,
    Object? result = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      userLocation: userLocation == freezed
          ? _value.userLocation
          : userLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<PlacesSearchResult>,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }

  @override
  $FailureCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc
abstract class _$$_LocationStateCopyWith<$Res>
    implements $LocationStateCopyWith<$Res> {
  factory _$$_LocationStateCopyWith(
          _$_LocationState value, $Res Function(_$_LocationState) then) =
      __$$_LocationStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {dynamic isLoading,
      GoogleMapController? controller,
      LatLng? userLocation,
      List<PlacesSearchResult> result,
      Failure? error});

  @override
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$_LocationStateCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res>
    implements _$$_LocationStateCopyWith<$Res> {
  __$$_LocationStateCopyWithImpl(
      _$_LocationState _value, $Res Function(_$_LocationState) _then)
      : super(_value, (v) => _then(v as _$_LocationState));

  @override
  _$_LocationState get _value => super._value as _$_LocationState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? controller = freezed,
    Object? userLocation = freezed,
    Object? result = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_LocationState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading,
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      userLocation: userLocation == freezed
          ? _value.userLocation
          : userLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      result: result == freezed
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<PlacesSearchResult>,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$_LocationState implements _LocationState {
  const _$_LocationState(
      {this.isLoading = false,
      this.controller,
      this.userLocation,
      final List<PlacesSearchResult> result = const [],
      this.error})
      : _result = result;

  @override
  @JsonKey()
  final dynamic isLoading;
  @override
  final GoogleMapController? controller;
  @override
  final LatLng? userLocation;
  final List<PlacesSearchResult> _result;
  @override
  @JsonKey()
  List<PlacesSearchResult> get result {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  final Failure? error;

  @override
  String toString() {
    return 'LocationState(isLoading: $isLoading, controller: $controller, userLocation: $userLocation, result: $result, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.controller, controller) &&
            const DeepCollectionEquality()
                .equals(other.userLocation, userLocation) &&
            const DeepCollectionEquality().equals(other._result, _result) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(controller),
      const DeepCollectionEquality().hash(userLocation),
      const DeepCollectionEquality().hash(_result),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_LocationStateCopyWith<_$_LocationState> get copyWith =>
      __$$_LocationStateCopyWithImpl<_$_LocationState>(this, _$identity);
}

abstract class _LocationState implements LocationState {
  const factory _LocationState(
      {final dynamic isLoading,
      final GoogleMapController? controller,
      final LatLng? userLocation,
      final List<PlacesSearchResult> result,
      final Failure? error}) = _$_LocationState;

  @override
  dynamic get isLoading;
  @override
  GoogleMapController? get controller;
  @override
  LatLng? get userLocation;
  @override
  List<PlacesSearchResult> get result;
  @override
  Failure? get error;
  @override
  @JsonKey(ignore: true)
  _$$_LocationStateCopyWith<_$_LocationState> get copyWith =>
      throw _privateConstructorUsedError;
}
