import 'package:equatable/equatable.dart';

class User  extends Equatable {
  final int id;
  final String name;
  final String avatar;
  final String createdAt;

  const User({required this.id, required this.name, required this.avatar, required this.createdAt});
  const User.empty(): this(avatar: "", name: "",createdAt: "", id: 0);
  @override
  List<Object?> get props => [id,name, createdAt];
}

