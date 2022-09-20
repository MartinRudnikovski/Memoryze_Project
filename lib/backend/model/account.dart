import 'package:hive/hive.dart';

part 'account.g.dart';

@HiveType(typeId: 2)
class Account extends HiveObject{

  Account({
    required this.email,
    this.password,
    required this.name,
    this.middleName,
    required this.surname,
  });

  @HiveField(0)
  String email;

  @HiveField(1)
  String? password;

  @HiveField(2)
  String name;

  @HiveField(3)
  String? middleName;

  @HiveField(4)
  String surname;

}