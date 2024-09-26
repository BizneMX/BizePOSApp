import 'package:bizne_fonda_app/app/data/core/profile/profile_repository.dart';
import 'package:bizne_fonda_app/app/endpoints.dart';
import 'package:bizne_fonda_app/app/models/auth/user.dart';
import 'package:bizne_fonda_app/app/models/response.dart';
import 'package:bizne_fonda_app/app/services/api_service.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  @override
  Future<ResponseRepository> logout() async {
    final response = await Api().get(Endpoints.logout, {});

    return response.toResponseRepository();
  }

  @override
  Future<ResponseRepository<String>> getQr() async {
    final response = await Api().get(Endpoints.getQR, {});

    return response.toResponseRepository(fromJson: (data) => data);
  }

  @override
  Future<ResponseRepository<UserInfo>> editProfile(
      String name, String lastName, String phone, String email) async {
    final response = await Api().patch(Endpoints.profile,
        {'name': name, 'lastname': lastName, 'email': email});

    return response.toResponseRepository(
        fromJson: (data) => UserInfo.formJson(data));
  }

  @override
  Future<ResponseRepository<UserInfo>> uploadFile(String base64) async {
    final response = await Api().patch(Endpoints.profile, {'pic': base64});

    return response.toResponseRepository(
        fromJson: (data) => UserInfo.formJson(data));
  }

  @override
  Future<ResponseRepository> changePassword(
      String password, String newPassword, String confirmPassword) async {
    final response = await Api().post(Endpoints.changePassword, {
      'password': password,
      'new_password': newPassword,
      'confirm_password': confirmPassword
    });

    return response.toResponseRepository();
  }

  @override
  Future<ResponseRepository<User>> getProfile() async {
    final response = await Api().get(Endpoints.profile, {});

    return response.toResponseRepository<User>(
        fromJson: (data) => User.formJson(data));
  }
}
