import 'package:bizne_fonda_app/app/data/core/auth/splash_repository.dart';
import 'package:bizne_fonda_app/app/endpoints.dart';
import 'package:bizne_fonda_app/app/models/response.dart';
import 'package:bizne_fonda_app/app/services/api_service.dart';

class SplashRepositoryImpl extends SplashRepository {
  @override
  Future<ResponseRepository<String>> validateToken(String token) async {
    final response =
        await Api().post(Endpoints.validateToken, {'token': token});

    return response.toResponseRepository(fromJson: (data) => data);
  }
}
