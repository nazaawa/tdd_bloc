import 'package:tdd_tutorial/src/authentification/data/models/user_model.dart';

abstract class AuthentificationRemoteDataSource {
  Future<void> createUser(
      {required String name,
      required String avatar,
      required String createdAt});

  Future<List<UserModel>> getUsers();
}
