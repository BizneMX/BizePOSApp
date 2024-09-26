import 'package:bizne_fonda_app/app/utils/number.dart';

class SummaryData {
  double total;
  int foods;

  SummaryData({required this.total, required this.foods});

  static SummaryData fromJson(Map<String, dynamic> json) => SummaryData(
      total: parseFormattedNumber(json['total'].toString()),
      foods: json['count']);
}
