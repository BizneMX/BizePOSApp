import 'package:bizne_fonda_app/app/data/core/home/summary_repository.dart';
import 'package:bizne_fonda_app/app/endpoints.dart';
import 'package:bizne_fonda_app/app/models/home/summary_data.dart';
import 'package:bizne_fonda_app/app/models/home/summary_week.dart';
import 'package:bizne_fonda_app/app/models/response.dart';
import 'package:bizne_fonda_app/app/services/api_service.dart';

class SummaryRepositoryImpl extends SummaryRepository {
  @override
  Future<ResponseRepository<SummaryData>> getSummaryData() async {
    final response = await Api().get(Endpoints.summaryData, {});

    return response.toResponseRepository(
        fromJson: (data) => SummaryData.fromJson(data));
  }

  @override
  Future<ResponseRepository<SummaryWeek>> currentWeek() async {
    final response = await Api().get(Endpoints.currentWeek, {});

    return response.toResponseRepository(
        fromJson: (data) => SummaryWeek.fromJson(data));
  }

  @override
  Future<ResponseRepository<SummaryWeek>> getWeek(int current, int move) async {
    final response = await Api().get(Endpoints.getWeek,
        {'current': current.toString(), 'move': move.toString()});

    return response.toResponseRepository(
        fromJson: (data) => SummaryWeek.fromJson(data));
  }

  @override
  Future<ResponseRepository> sendEmail() async {
    final response = await Api().post(Endpoints.sendEmail, {});

    return response.toResponseRepository();
  }
}
