// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'place_search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlaceSearchState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<PlacesSearchResult> get result => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaceSearchStateCopyWith<PlaceSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceSearchStateCopyWith<$Res> {
  factory $PlaceSearchStateCopyWith(
          PlaceSearchState value, $Res Function(PlaceSearchState) then) =
      _$PlaceSearchStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, List<PlacesSearchResult> result, Failure? error});

  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$PlaceSearchStateCopyWithImpl<$Res>
    implements $PlaceSearchStateCopyWith<$Res> {
  _$PlaceSearchStateCopyWithImpl(this._value, this._then);

  final PlaceSearchState _value;
  // ignore: unused_field
  final $Res Function(PlaceSearchState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? result = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$_PlaceSearchStateCopyWith<$Res>
    implements $PlaceSearchStateCopyWith<$Res> {
  factory _$$_PlaceSearchStateCopyWith(
          _$_PlaceSearchState value, $Res Function(_$_PlaceSearchState) then) =
      __$$_PlaceSearchStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, List<PlacesSearchResult> result, Failure? error});

  @override
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$_PlaceSearchStateCopyWithImpl<$Res>
    extends _$PlaceSearchStateCopyWithImpl<$Res>
    implements _$$_PlaceSearchStateCopyWith<$Res> {
  __$$_PlaceSearchStateCopyWithImpl(
      _$_PlaceSearchState _value, $Res Function(_$_PlaceSearchState) _then)
      : super(_value, (v) => _then(v as _$_PlaceSearchState));

  @override
  _$_PlaceSearchState get _value => super._value as _$_PlaceSearchState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? result = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_PlaceSearchState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
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

class _$_PlaceSearchState implements _PlaceSearchState {
  const _$_PlaceSearchState(
      {this.isLoading = false,
      final List<PlacesSearchResult> result = const [],
      this.error})
      : _result = result;

  @override
  @JsonKey()
  final bool isLoading;
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
    return 'PlaceSearchState(isLoading: $isLoading, result: $result, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaceSearchState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other._result, _result) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(_result),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_PlaceSearchStateCopyWith<_$_PlaceSearchState> get copyWith =>
      __$$_PlaceSearchStateCopyWithImpl<_$_PlaceSearchState>(this, _$identity);
}

abstract class _PlaceSearchState implements PlaceSearchState {
  const factory _PlaceSearchState(
      {final bool isLoading,
      final List<PlacesSearchResult> result,
      final Failure? error}) = _$_PlaceSearchState;

  @override
  bool get isLoading;
  @override
  List<PlacesSearchResult> get result;
  @override
  Failure? get error;
  @override
  @JsonKey(ignore: true)
  _$$_PlaceSearchStateCopyWith<_$_PlaceSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
