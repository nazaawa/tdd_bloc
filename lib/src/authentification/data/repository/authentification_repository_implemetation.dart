import 'package:dartz/dartz.dart';
import 'package:tdd_tutorial/core/utils/typedef.dart';
import 'package:tdd_tutorial/src/authentification/data/datasources/authentification_remote_data_source.dart';
import 'package:tdd_tutorial/src/authentification/domain/entity/user.dart';
import 'package:tdd_tutorial/src/authentification/domain/repository/authentification_repository.dart';

class AuthentificationRepositoryImplementation
    implements AuthentificationRepository {
  const AuthentificationRepositoryImplementation(this._remoteDataSource);
  final AuthentificationRemoteDataSource _remoteDataSource;
  @override
  ResultVoid createdUser(
      {required String name,
      required String avatar,
      required String createdAt}) async {
    _remoteDataSource.createUser(
      name: name,
      avatar: avatar,
      createdAt: createdAt,
    );
    return const Right(null);
  }

  @override
  ResultFuture<List<User>> getUsers() async {
    throw UnimplementedError();
  }
}
