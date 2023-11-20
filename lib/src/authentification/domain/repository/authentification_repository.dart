import 'package:tdd_tutorial/core/utils/typedef.dart';
import 'package:tdd_tutorial/src/authentification/domain/entity/user.dart';

abstract class AuthentificationRepository {
  const AuthentificationRepository();

  ResultVoid createdUser({
    required String name,
    required String avatar,
    required String createdAt,
  });
  ResultFuture<List<User>> getUsers();
}

