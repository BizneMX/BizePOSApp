class Order {
  int id;
  String date;
  String employeeNumber;
  String fullName;
  String userType;
  String pic;
  double total;
  double cash;
  bool delivery;
  bool isBooking;
  int noMenu;

  Order(
      {required this.id,
      required this.noMenu,
      required this.date,
      required this.employeeNumber,
      required this.fullName,
      required this.pic,
      required this.total,
      required this.userType,
      required this.delivery,
      required this.cash,
      required this.isBooking});

  static Order fromJson(Map<String, dynamic> json) {
    return Order(
        noMenu: json['no_menu'] ?? 0,
        id: json['id'],
        isBooking: json['is_booking'] == 1,
        date: json['date'] == null ? '' : json['date'].toString().split(',')[0],
        employeeNumber: json['employeeNumber'] ?? '',
        fullName: json['fullname'],
        pic: json['pic'] ?? '',
        total: double.parse(json['total'].toString()),
        userType: json['userType'].toString(),
        cash: double.parse(json['cash'].toString()),
        delivery: json['delivery'] != 0);
  }
}
