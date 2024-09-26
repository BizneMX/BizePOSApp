import 'package:bizne_fonda_app/app/models/home/home.dart';
import 'package:bizne_fonda_app/app/models/profile/training.dart';
import 'package:bizne_fonda_app/app/models/response.dart';

abstract class HomeRepository {
  Future<ResponseRepository<Home>> getHome();
  Future<ResponseRepository<List<Training>>> getTrainings();
  Future<ResponseRepository> changeStatus(bool value);
  Future<ResponseRepository> refreshToken();
}
