import 'package:bizne_fonda_app/app/data/core/home/home_repository.dart';
import 'package:bizne_fonda_app/app/endpoints.dart';
import 'package:bizne_fonda_app/app/models/home/home.dart';
import 'package:bizne_fonda_app/app/models/profile/training.dart';
import 'package:bizne_fonda_app/app/models/response.dart';
import 'package:bizne_fonda_app/app/services/api_service.dart';
import 'package:device_uuid/device_uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<ResponseRepository<Home>> getHome() async {
    final response = await Api().get(Endpoints.home, {});

    return response.toResponseRepository(
        fromJson: (data) => Home.fromJson(data));
  }

  @override
  Future<ResponseRepository> changeStatus(bool value) async {
    final response =
        await Api().post(Endpoints.changeStatus, {'status': value});

    return response.toResponseRepository();
  }

  @override
  Future<ResponseRepository<List<Training>>> getTrainings() async {
    final response = await Api().get(Endpoints.getTrainings, {});

    return response.toResponseRepository(
        fromJson: (data) =>
            data.map<Training>((e) => Training.fromJson(e)).toList());
  }

  @override
  Future<ResponseRepository> refreshToken() async {
    Map<String, dynamic> data = {};

    final sharedPref = await SharedPreferences.getInstance();
    final token = sharedPref.getString('fcmToken');

    data['token'] = token;
    data['uuid'] = await DeviceUuid().getUUID();

    final response = await Api().post(Endpoints.refreshToken, data);

    return response.toResponseRepository();
  }
}
