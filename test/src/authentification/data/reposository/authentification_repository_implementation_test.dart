import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_tutorial/core/errors/exceptions.dart';
import 'package:tdd_tutorial/core/errors/failure.dart';
import 'package:tdd_tutorial/src/authentification/data/datasources/authentification_remote_data_source.dart';
import 'package:tdd_tutorial/src/authentification/data/models/user_model.dart';
import 'package:tdd_tutorial/src/authentification/data/repository/authentification_repository_implemetation.dart';
import 'package:tdd_tutorial/src/authentification/domain/entity/user.dart';

class MockAuthRemoteDataSrc extends Mock
    implements AuthentificationRemoteDataSource {}

void main() {
  late AuthentificationRemoteDataSource remoteDataSource;
  late AuthentificationRepositoryImplementation repository;

  setUp(() {
    remoteDataSource = MockAuthRemoteDataSrc();
    repository = AuthentificationRepositoryImplementation(remoteDataSource);
  });

  group("createUser", () {
    const createdAt = "whatever.createdAt";
    const name = "whatever.name";
    const avatar = "whatever.avatar";

    test(
        "should call the  [RemoteDataSource.createUser] and complete successfully whrn the calll tp the remote source is successful ",
        () async {
      when(() => remoteDataSource.createUser(
              name: any(named: "name"),
              avatar: any(named: "avatar"),
              createdAt: any(named: "createdAt")))
          .thenAnswer((invocation) => Future.value());

      final result = await repository.createdUser(
        name: createdAt,
        avatar: name,
        createdAt: avatar,
      );
      expect(result, equals(const Right(null)));
    });

    test(
        "should return a [ServerFailure] when the call to the remote source is unsuccessful",
        () async {
      when(() => remoteDataSource.createUser(
          name: any(named: "name"),
          avatar: any(named: "avatar"),
          createdAt: any(named: "createdAt"))).thenThrow(
        const ApiException("something went wrong", 500),
      );

      final result = await repository.createdUser(
        name: name,
        avatar: avatar,
        createdAt: createdAt,
      );
      expect(
          result, equals(const Left(ApiFailure("something went wrong", 500))));

      verify(() => remoteDataSource.createUser(
            name: name,
            avatar: avatar,
            createdAt: createdAt,
          )).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });

  group("getUsers", () {
    const List<UserModel> tReponse = [UserModel.empty()];
    test(
        "should call the  [RemoteDataSource.getUsers] and complete successfully when the call tp the remote source is successful ",
        () async {
      when(() => remoteDataSource.getUsers()).thenAnswer(
        (value) => Future.value(tReponse),
      );
      final result = await repository.getUsers();
      expect(result, equals(const Right<dynamic, List<User>>(tReponse)));
    });

    test(
        "should return a [ServerFailure] when the call to the remote source is unsuccessful",
        () async {
      when(() => remoteDataSource.getUsers()).thenThrow(
        const ApiException("something went wrong", 500),
      );
      final result = await repository.getUsers();
      expect(
          result, equals(const Left(ApiFailure("something went wrong", 500))));

      verify(() => remoteDataSource.getUsers()).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
}
