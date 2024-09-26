import 'package:bizne_fonda_app/app/models/pagination_data.dart';
import 'package:bizne_fonda_app/app/utils/number.dart';

class Reserve {
  int id;
  String clientName;
  double appPayment;
  double cashPayment;
  String deliveryAddress;
  String date;
  String hour;
  String organization;
  String pic;
  String details;
  int noMenu;

  Reserve(
      {required this.appPayment,
      required this.cashPayment,
      required this.deliveryAddress,
      required this.clientName,
      required this.id,
      required this.date,
      required this.hour,
      required this.organization,
      required this.pic,
      required this.details,
      required this.noMenu});

  static Reserve fromJson(Map<String, dynamic> json) {
    return Reserve(
        noMenu: json['no_menu'],
        id: json['id'],
        appPayment: parseFormattedNumber(json['total']),
        cashPayment: 0,
        deliveryAddress: '',
        clientName: json['fullname'],
        organization: json['organization'],
        pic: json['pic'],
        details: json['details'] ?? '',
        date: json['date'],
        hour: json['hour'] ?? '');
  }
}

class ReserveData {
  int noMenu1;
  int noMenu2;
  PaginationData<Reserve> data;

  ReserveData(
      {required this.noMenu1, required this.noMenu2, required this.data});

  static ReserveData fromJson(Map<String, dynamic> json) {
    return ReserveData(
        noMenu1: json['menu1'],
        noMenu2: json['menu2'],
        data: PaginationData.fromJson(json, Reserve.fromJson));
  }
}
