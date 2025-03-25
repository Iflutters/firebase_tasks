// ignore_for_file: overridden_fields, annotate_overrides

import 'package:firebase_tasks/app/domain/entities/user_entity.dart';

///DATA TRANSFER OBJECT
class UserDTO extends UserEntity {
  String? uid;
  String name;
  String email;
  String? password;
  bool? isActive;

  DateTime? createdAt;
  DateTime? updatedAt;

  UserDTO({
    required this.name,
    required this.email,
    this.uid,
    this.password,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  }) : super(
            name: name,
            email: email,
            uid: uid,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt);

  Map<String, dynamic> toMap(UserEntity user) {
    final map = {
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'isActive': user.isActive,
      'createdAt': user.createdAt
    };
    return map;
  }

  factory UserDTO.fromMap(Map<String, dynamic> map) {
    return UserDTO(
        uid: map['uid'],
        name: map['name'],
        email: map['email'],
        isActive: map['isActive']);
  }

  @override
  String toString() {
    return 'UserDTO(uid: $uid, name: $name, email: $email, password: $password,'
        ' isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
