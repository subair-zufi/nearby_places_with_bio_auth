
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petronas_sample/src/constants/error_codes.dart';

part 'failure.freezed.dart';


@freezed
class Failure with _$Failure {
  factory Failure({required String message, ErrorCode? code}) = _Failure;
}
