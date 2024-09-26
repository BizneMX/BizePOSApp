import 'package:bizne_fonda_app/app/models/auth/banner.dart';
import 'package:bizne_fonda_app/app/models/response.dart';

abstract class BannerRepository {
  Future<ResponseRepository<List<BannerModel>>> getBanners();
}
