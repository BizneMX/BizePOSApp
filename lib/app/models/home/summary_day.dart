import 'package:bizne_fonda_app/app/models/profile/schedule.dart';
import 'package:bizne_fonda_app/app/utils/number.dart';

class SummaryDay {
  DayOfWeeks day;
  int foods;
  double cash;
  double fee;
  double total;

  SummaryDay(
      {required this.day,
      required this.foods,
      required this.cash,
      required this.fee,
      required this.total});

  static SummaryDay fromJson(Map<String, dynamic> json) => SummaryDay(
      day: valueStrDayOfWeekTo1(json['date']),
      foods: json['foods'],
      cash: parseFormattedNumber(json['cash'].toString()),
      fee: parseFormattedNumber(json['fee'].toString()),
      total: parseFormattedNumber(json['total'].toString()));

  
}
