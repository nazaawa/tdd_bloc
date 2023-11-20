import 'package:tdd_tutorial/core/usescase/usecase.dart';
import 'package:tdd_tutorial/core/utils/typedef.dart';
import 'package:tdd_tutorial/src/authentification/domain/entity/user.dart';
import 'package:tdd_tutorial/src/authentification/domain/repository/authentification_repository.dart';

class GetUsers extends UsecaseWithoutParams<List<User>> {
  final AuthentificationRepository _repository;

  GetUsers({required AuthentificationRepository repository})
      : _repository = repository;
  @override
  ResultFuture<List<User>> call()async => _repository.getUsers();
}
