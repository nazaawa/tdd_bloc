import 'package:equatable/equatable.dart';
import 'package:tdd_tutorial/core/errors/exceptions.dart';

abstract class Failure extends Equatable {
  const Failure(this.message, this.statusCode);
  final String message;
  final int statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

class ApiFailure extends Failure {
  const ApiFailure(super.message, super.statusCode);

  ApiFailure.fromException(ApiException e) : this(e.message, e.statusCode);
}
