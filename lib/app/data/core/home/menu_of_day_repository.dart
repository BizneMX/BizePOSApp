import 'package:bizne_fonda_app/app/models/home/menu.dart';
import 'package:bizne_fonda_app/app/models/response.dart';

abstract class MenuOfDayRepository {
  Future<ResponseRepository<List<Menu>>> getMenus();
  Future<ResponseRepository<String>> setMenu(int id, String base64);
  Future<ResponseRepository> deleteMenu(int id);
}
