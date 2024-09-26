import 'package:bizne_fonda_app/app/models/auth/user.dart';
import 'package:bizne_fonda_app/app/models/response.dart';

abstract class LoginRepository {
  Future<ResponseRepository<bool>> checkPhone(String phone);
  Future<ResponseRepository<(User,String)>> login(String phone, String password);
  Future<ResponseRepository> recoverPassword(String email);
}
