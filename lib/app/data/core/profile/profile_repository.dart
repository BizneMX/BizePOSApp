import 'package:bizne_fonda_app/app/models/auth/user.dart';
import 'package:bizne_fonda_app/app/models/response.dart';

abstract class ProfileRepository {
  Future<ResponseRepository> logout();

  Future<ResponseRepository<String>> getQr();

  Future<ResponseRepository<User>> getProfile();

  Future<ResponseRepository<UserInfo>> editProfile(
      String name, String lastName, String phone, String email);

  Future<ResponseRepository<UserInfo>> uploadFile(String base64);

  Future<ResponseRepository> changePassword(
      String password, String newPassword, String confirmPassword);
}
