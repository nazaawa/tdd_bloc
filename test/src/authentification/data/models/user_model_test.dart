import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_tutorial/core/utils/typedef.dart';
import 'package:tdd_tutorial/src/authentification/data/models/user_model.dart';
import 'package:tdd_tutorial/src/authentification/domain/entity/user.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tModel = UserModel.empty();

  test("test should be a subclass of [User] entityu", () {
    expect(tModel, isA<User>());
  });

  final tJson = fixture("user.json");
  final tMap = jsonDecode(tJson) as DataMap;
  group("from map", () {
    test("should return a [UserModel] with the right data", () {
      final result = UserModel.fromMap(tMap);
      expect(result, equals(tModel));
    });
  });
  group("from Json", () {
    test("should return a [UserModel] with the right data", () {
      final result = UserModel.fromJson(tJson);
      expect(result, equals(tModel));
    });
  });
  group("to Map", () {
    test("should return a map with right data ", () {
      final result = UserModel.fromJson(tJson);
      expect(result, equals(tModel));
    });
  });
}
