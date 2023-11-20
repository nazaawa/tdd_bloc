import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_tutorial/src/authentification/domain/repository/authentification_repository.dart';
import 'package:tdd_tutorial/src/authentification/domain/usescases/create_user.dart';

import 'authentificator_repository.mock.dart';


void main() {
  late CreateUser usecase;
  late AuthentificationRepository repository;

  setUp(() {
    repository = MockAuthRepo();
    usecase = CreateUser(repository);
  });
  const params = CreateUsesParams.empty();

  test("should call the [AuthRepo.createUser]", () async {
    when(
      () => repository.createdUser(
        name: any(named: "name"),
        avatar: any(named: "avatar"),
        createdAt: any(named: "createdAt"),
      ),
    ).thenAnswer((_) async => const Right(null));

    final result = await usecase(params);

    expect(result, equals(const Right<dynamic, void>(null)));
    verify(() => repository.createdUser(
        name: params.name,
        avatar: params.avatar,
        createdAt: params.createdAt)).called(1);

    verifyNoMoreInteractions(repository);
  });
}
