import 'package:bizne_fonda_app/app/data/core/auth/banner_repository.dart';
import 'package:bizne_fonda_app/app/endpoints.dart';
import 'package:bizne_fonda_app/app/models/auth/banner.dart';
import 'package:bizne_fonda_app/app/models/response.dart';
import 'package:bizne_fonda_app/app/services/api_service.dart';

class BannerRepositoryImpl extends BannerRepository {
  @override
  Future<ResponseRepository<List<BannerModel>>> getBanners() async {
    final response = await Api().get(Endpoints.banners, {});

    return response.toResponseRepository<List<BannerModel>>(
        fromJson: (data) =>
            data.map<BannerModel>((d) => BannerModel.fromJson(d)).toList());
  }
}
