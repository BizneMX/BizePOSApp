class Staff {
  int id;
  String name;
  String phone;
  String? pic;
  bool isBlock;

  Staff(
      {required this.id,
      required this.name,
      required this.phone,
      required this.pic,
      required this.isBlock});

  static Staff fromJson(Map<String, dynamic> json) => Staff(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      pic: json['pic'],
      isBlock: json['status'] == 0);
}
