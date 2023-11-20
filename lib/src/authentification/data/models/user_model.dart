import 'dart:convert';

import 'package:tdd_tutorial/core/utils/typedef.dart';
import 'package:tdd_tutorial/src/authentification/domain/entity/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.id,
      required super.name,
      required super.avatar,
      required super.createdAt});
  const UserModel.empty(): this(avatar: "", name: "",createdAt: "", id: 0);

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source));

  UserModel.fromMap(DataMap map)
      : this(
            avatar: map["avatar"] as String,
            id: map["id"] as int,
            name: map["name"],
            createdAt: map['createdAt']);

  DataMap toMap() => {
        "id": id,
        "avatar": avatar,
        "name": name,
        "createdAt": createdAt,
      };

  String toJson() => jsonEncode(toMap());

  UserModel copyWith({
    String? avatar,
    int? id,
    String? createdAt,
    String? name,
  }) {
    return UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        createdAt: createdAt ?? this.createdAt);
  }
}
