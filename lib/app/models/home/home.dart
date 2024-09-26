import 'package:bizne_fonda_app/app/utils/number.dart';

class Home {
  String userName;
  String establishmentName;
  int establishmentStatus;
  String? establishmentPic;
  int newOrders;
  int newBookings;
  double rating;

  Home(
      {required this.userName,
      required this.establishmentName,
      required this.establishmentPic,
      required this.establishmentStatus,
      required this.newOrders,
      required this.rating,
      required this.newBookings});

  static Home fromJson(Map<String, dynamic> json) => Home(
      userName: json['user_name'],
      establishmentName: json['establishment_name'],
      establishmentPic: json['establishment_pic'],
      establishmentStatus: json['establishment_status'],
      newOrders: json['new_orders'],
      newBookings: json['new_bookings'],
      rating: parseFormattedNumber(json['calification'].toString()));
}
