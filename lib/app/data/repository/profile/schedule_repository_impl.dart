import 'package:bizne_fonda_app/app/data/core/profile/schedule_repository.dart';
import 'package:bizne_fonda_app/app/endpoints.dart';
import 'package:bizne_fonda_app/app/models/profile/schedule.dart';
import 'package:bizne_fonda_app/app/models/response.dart';
import 'package:bizne_fonda_app/app/services/api_service.dart';

class ScheduleRepositoryImpl extends ScheduleRepository {
  @override
  Future<ResponseRepository<List<Schedule>>> getSchedule() async {
    final response = await Api().get(Endpoints.getSchedule, {});

    return response.toResponseRepository<List<Schedule>>(
        fromJson: (data) =>
            data.map<Schedule>((d) => Schedule.fromJson(d)).toList());
  }

  @override
  Future<ResponseRepository> setSchedule(List<Schedule> schedules) async {
    final response = await Api().post(Endpoints.setSchedule,
        {'schedule': schedules.map((e) => e.toJson()).toList()});
    return response.toResponseRepository();
  }
}
