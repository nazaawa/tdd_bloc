import 'package:equatable/equatable.dart';
import 'package:tdd_tutorial/core/usescase/usecase.dart';
import 'package:tdd_tutorial/core/utils/typedef.dart';
import 'package:tdd_tutorial/src/authentification/domain/repository/authentification_repository.dart';

class CreateUser extends UsecaseWithParams<void, CreateUsesParams> {
  CreateUser(this._repository);

  final AuthentificationRepository _repository;

  @override
  ResultFuture call(CreateUsesParams params) {
    return _repository.createdUser(
        name: params.name, avatar: params.avatar, createdAt: params.createdAt);
  }
}

class CreateUsesParams extends Equatable {
  final String name;
  final String createdAt;
  final String avatar;

  const CreateUsesParams(
      {required this.name, required this.createdAt, required this.avatar});

 const CreateUsesParams.empty() :this(avatar: "_empty.avatat", name: "_empty.name", createdAt: "_created.name");
  @override
  List<Object?> get props => [createdAt, avatar, name];
}
