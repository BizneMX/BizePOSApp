import 'package:bizne_fonda_app/app/models/auth/user.dart';
import 'package:bizne_fonda_app/app/models/profile/schedule.dart';
import 'package:bizne_fonda_app/app/models/response.dart';

abstract class CompleteProfileRepository {
  Future<ResponseRepository<(User, String)>> setPassword(
      String phone, String password, String confirmPassword);

  Future<ResponseRepository> setSchedule(List<Schedule> schedules);
}
