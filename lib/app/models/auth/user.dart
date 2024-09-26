class User {
  int id;
  String name;
  String lastName;
  String phone;
  String email;
  String? pic;
  int establishmentId;
  bool inCharge;

  User(
      {required this.id,
      required this.email,
      required this.establishmentId,
      required this.lastName,
      required this.name,
      required this.phone,
      required this.pic,
      required this.inCharge});

  static User formJson(Map<String, dynamic> json) => User(
      id: json['id'],
      email: json['email'],
      establishmentId: json['establishment_id'],
      lastName: json['lastname'],
      name: json['name'],
      phone: json['phone'],
      pic: json['pic'],
      inCharge: json['role'] == 'encargado');
}

class UserInfo {
  String name;
  String lastName;
  String phone;
  String email;
  String? pic;

  UserInfo(
      {required this.email,
      required this.lastName,
      required this.name,
      required this.phone,
      required this.pic});

  static UserInfo formJson(Map<String, dynamic> json) => UserInfo(
      email: json['email'],
      lastName: json['lastname'],
      name: json['name'],
      phone: json['phone'],
      pic: json['pic']);
}
