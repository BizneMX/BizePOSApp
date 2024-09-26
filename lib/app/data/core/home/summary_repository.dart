import 'package:bizne_fonda_app/app/models/home/summary_data.dart';
import 'package:bizne_fonda_app/app/models/home/summary_week.dart';
import 'package:bizne_fonda_app/app/models/response.dart';

abstract class SummaryRepository {
  Future<ResponseRepository<SummaryData>> getSummaryData();

  Future<ResponseRepository<SummaryWeek>> currentWeek();

  Future<ResponseRepository<SummaryWeek>> getWeek(int current, int move);

  Future<ResponseRepository> sendEmail();
}
