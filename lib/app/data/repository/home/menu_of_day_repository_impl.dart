import 'package:bizne_fonda_app/app/endpoints.dart';
import 'package:bizne_fonda_app/app/models/home/menu.dart';

import 'package:bizne_fonda_app/app/models/response.dart';
import 'package:bizne_fonda_app/app/services/api_service.dart';

import '../../core/home/menu_of_day_repository.dart';

class MenuOfDayRepositoryImpl extends MenuOfDayRepository {
  @override
  Future<ResponseRepository> deleteMenu(int id) async {
    final response = await Api()
        .delete(Endpoints.deleteMenu, {'category_id': id.toString()});

    return response.toResponseRepository();
  }

  @override
  Future<ResponseRepository<String>> setMenu(int id, String base64) async {
    final response =
        await Api().post(Endpoints.setMenu, {'category_id': id, 'pic': base64});

    return response.toResponseRepository(fromJson: (data) => data);
  }

  @override
  Future<ResponseRepository<List<Menu>>> getMenus() async {
    final response = await Api().get(Endpoints.getMenus, {});

    return response.toResponseRepository(
        fromJson: (d) => d.map<Menu>((m) => Menu.fromJson(m)).toList());
  }
}
