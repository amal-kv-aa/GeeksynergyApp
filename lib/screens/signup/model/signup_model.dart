
import 'package:hive_flutter/hive_flutter.dart';

part 'signup_model.g.dart';
@HiveType(typeId: 1)
class UserModel{
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String password;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String? number;
  @HiveField(5)
  final String? profession;  
  UserModel({
  required this.name,
  required this.email,
  required this.password,
  required this.profession,
  this.id,
  this.number});    
}
