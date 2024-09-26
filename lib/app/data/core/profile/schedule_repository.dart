import 'package:bizne_fonda_app/app/models/profile/schedule.dart';
import 'package:bizne_fonda_app/app/models/response.dart';

abstract class ScheduleRepository {
  Future<ResponseRepository> setSchedule(List<Schedule> schedules);

  Future<ResponseRepository<List<Schedule>>> getSchedule();
}
