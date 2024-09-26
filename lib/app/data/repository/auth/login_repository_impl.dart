import 'package:bizne_fonda_app/app/data/core/auth/login_repository.dart';
import 'package:bizne_fonda_app/app/endpoints.dart';
import 'package:bizne_fonda_app/app/models/auth/user.dart';
import 'package:bizne_fonda_app/app/models/response.dart';
import 'package:bizne_fonda_app/app/services/api_service.dart';

class LoginRepositoryImpl extends LoginRepository {
  @override
  Future<ResponseRepository<bool>> checkPhone(String phone) async {
    final response = await Api().get(Endpoints.checkPhone, {'phone': phone});

    return response.toResponseRepository(fromJson: (data) => data['new']);
  }

  @override
  Future<ResponseRepository<(User, String)>> login(
      String phone, String password) async {
    final response = await Api()
        .post(Endpoints.login, {'phone': phone, 'password': password});

    return response.toResponseRepository<(User, String)>(
        fromJson: (data) => (User.formJson(data), data['jwt_token']));
  }

  @override
  Future<ResponseRepository> recoverPassword(String email) async {
    final response =
        await Api().post(Endpoints.recoverPassword, {'email': email});

    return response.toResponseRepository();
  }
}
