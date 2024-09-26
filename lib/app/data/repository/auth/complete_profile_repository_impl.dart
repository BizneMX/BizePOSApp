import 'package:bizne_fonda_app/app/data/core/auth/comple_profile_repository.dart';
import 'package:bizne_fonda_app/app/endpoints.dart';
import 'package:bizne_fonda_app/app/models/auth/user.dart';
import 'package:bizne_fonda_app/app/models/profile/schedule.dart';
import 'package:bizne_fonda_app/app/models/response.dart';
import 'package:bizne_fonda_app/app/services/api_service.dart';

class CompleteProfileRepositoryImpl extends CompleteProfileRepository {
  @override
  Future<ResponseRepository<(User, String)>> setPassword(
      String phone, String password, String confirmPassword) async {
    final response = await Api().post(Endpoints.setPassword, {
      'phone': phone,
      'password': password,
      'confirm_password': confirmPassword
    });

    return response.toResponseRepository<(User, String)>(
        fromJson: (data) => (User.formJson(data), data['jwt_token']));
  }

  @override
  Future<ResponseRepository> setSchedule(List<Schedule> schedules) async {
    final response = await Api().post(Endpoints.setSchedule,
        {'schedule': schedules.map((e) => e.toJson()).toList()});
    return response.toResponseRepository();
  }
}
