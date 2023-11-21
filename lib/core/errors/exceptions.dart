import 'package:equatable/equatable.dart';
import 'package:tdd_tutorial/core/errors/failure.dart';

class ApiException extends Equatable implements Failure {
  const ApiException(this.message, this.statusCode);
  @override
  final String message;
  @override
  final int statusCode;
  @override
  List<Object?> get props => [message, statusCode];
}
