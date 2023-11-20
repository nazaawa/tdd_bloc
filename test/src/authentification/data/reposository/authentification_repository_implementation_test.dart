import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_tutorial/core/errors/exceptions.dart';
import 'package:tdd_tutorial/src/authentification/data/datasources/authentification_remote_data_source.dart';
import 'package:tdd_tutorial/src/authentification/data/repository/authentification_repository_implemetation.dart';

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
    test(
        "should call the  [RemoteDataSource.createUser] and complete successfully whrn the calll tp the remote source is successful ",
        () async {
      when(() => remoteDataSource.createUser(
              name: any(named: "name"),
              avatar: any(named: "avatar"),
              createdAt: any(named: "createdAt")))
          .thenAnswer((invocation) => Future.value());
      const createdAt = "whatever.createdAt";
      const name = "whatever.name";
      const avatar = "whatever.avatar";

      final result = await repository.createdUser(
        name: createdAt,
        avatar: name,
        createdAt: avatar,
      );
      expect(result, equals(const Right(null)));
    });
  });

  test(
      "should return a [ServerFailure] when the call to the remote source is unsuccessful",
      () {
    when(() => remoteDataSource.createUser(
            name: any(named: "name"),
            avatar: any(named: "avatar"),
            createdAt: any(named: "createdAt")))
        .thenThrow(const ServerException("something went wrong", 500));
  });
}
