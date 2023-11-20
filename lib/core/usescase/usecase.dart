import 'package:tdd_tutorial/core/utils/typedef.dart';

abstract class UsecaseWithParams<Type, Params> {
  UsecaseWithParams();
  ResultFuture<Type> call(Params params);
}

abstract class UsecaseWithoutParams<Type> {
  UsecaseWithoutParams();
  ResultFuture<Type> call();
}
