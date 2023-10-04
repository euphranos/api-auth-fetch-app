// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String id;
  final String email;
  final String fistName;
  final String lastName;
  final String avatar;
  UserModel({
    required this.id,
    required this.email,
    required this.fistName,
    required this.lastName,
    required this.avatar,
  });

  UserModel copyWith({
    String? id,
    String? email,
    String? fistName,
    String? lastName,
    String? avatar,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      fistName: fistName ?? this.fistName,
      lastName: lastName ?? this.lastName,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'first_name': fistName,
      'last_name': lastName,
      'avatar': avatar,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: (map['id']).toString(),
      email: map['email'] as String,
      fistName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      avatar: map['avatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, fistName: $fistName, lastName: $lastName, avatar: $avatar)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.fistName == fistName &&
        other.lastName == lastName &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        fistName.hashCode ^
        lastName.hashCode ^
        avatar.hashCode;
  }
}
