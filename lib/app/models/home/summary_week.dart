import 'package:bizne_fonda_app/app/models/home/summary_day.dart';
import 'package:bizne_fonda_app/app/utils/number.dart';

class SummaryWeek {
  int id;
  String week;
  double total;
  List<SummaryDay> days;

  SummaryWeek(
      {required this.days,
      required this.id,
      required this.total,
      required this.week});

  static SummaryWeek fromJson(Map<String, dynamic> json) => SummaryWeek(
          days: [
            SummaryDay.fromJson(json['data']['Lu']),
            SummaryDay.fromJson(json['data']['Ma']),
            SummaryDay.fromJson(json['data']['Mi']),
            SummaryDay.fromJson(json['data']['Ju']),
            SummaryDay.fromJson(json['data']['Vi']),
            SummaryDay.fromJson(json['data']['Sá']),
            SummaryDay.fromJson(json['data']['Do']),
          ],
          id: json['id'],
          week: json['week'],
          total: parseFormattedNumber(json['total']['total'].toString()));
}
