class Menu {
  int id;
  String name;
  String pic;
  bool menuOfDay;
  bool last;

  Menu(
      {required this.id,
      required this.name,
      required this.pic,
      required this.menuOfDay,
      required this.last});

  static Menu fromJson(Map<String, dynamic> json) => Menu(
      id: json['id'],
      name: json['name'],
      pic: json['pic'] ?? '',
      menuOfDay: json['principal'],
      last: json['last']);
}
