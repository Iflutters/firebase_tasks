class UserEntity {
  String? uid;
  String name;
  String email;
  String? password;
  bool? isActive;

  DateTime? createdAt;
  DateTime? updatedAt;

  UserEntity(
      {this.uid,
      required this.email,
      this.password,
      required this.name,
      this.isActive = true,
      this.createdAt,
      this.updatedAt});

  @override
  String toString() {
    return 'UserEntity(uid: $uid, name: $name, email: $email,'
    'password: $password, isActive: $isActive,'
    ' createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
