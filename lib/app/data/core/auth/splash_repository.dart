import 'package:bizne_fonda_app/app/models/response.dart';

abstract class SplashRepository {
  Future<ResponseRepository<String>> validateToken(String token);
}
