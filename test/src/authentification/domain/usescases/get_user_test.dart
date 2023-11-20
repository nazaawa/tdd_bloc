import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_tutorial/src/authentification/domain/entity/user.dart';
import 'package:tdd_tutorial/src/authentification/domain/repository/authentification_repository.dart';
import 'package:tdd_tutorial/src/authentification/domain/usescases/get_users.dart';

import 'authentificator_repository.mock.dart';

void main() {
  late AuthentificationRepository repository;
  late GetUsers usecases;

  setUp(() {
    repository = MockAuthRepo();
    usecases = GetUsers(repository: repository);
  });
  const tReponse = [User.empty()];
  test("should call [AuthRepo.getUsers] and return [List<User>]", () async {
    when(() => repository.getUsers())
        .thenAnswer((_) async => const Right(tReponse));
    final response = await usecases();
    expect(response, equals(const Right<dynamic, List<User>>(tReponse)));
    verify(() => repository.getUsers()).called(1);
    //   verifyNoMoreInteractions(repository);
  });
}
