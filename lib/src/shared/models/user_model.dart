import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int? id;
  final String name;
  final String email;
  final String phone;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  Map<String, dynamic> toJsonSupabase() => <String, dynamic>{
        'name': name,
        'email': email,
        'phone': phone,
      };

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, email: $email, phone: $phone}';
  }
}
