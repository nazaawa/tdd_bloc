import 'package:equatable/equatable.dart';
import 'package:tdd_tutorial/core/errors/failure.dart';

class ServerException extends Equatable implements Failure {
  const ServerException(this.message, this.statusCode);
  @override
  final String message;
  @override
  final int statusCode;
  @override
  List<Object?> get props => [message, statusCode];
}
