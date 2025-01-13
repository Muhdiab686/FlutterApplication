import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? name;
  final String? email;
  final int? code;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  const User({
    this.name,
    this.email,
    this.code,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'] as String?,
        email: json['email'] as String?,
        code: json['code'] as int?,
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'code': code,
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'id': id,
      };

  @override
  List<Object?> get props {
    return [
      name,
      email,
      code,
      updatedAt,
      createdAt,
      id,
    ];
  }
}
