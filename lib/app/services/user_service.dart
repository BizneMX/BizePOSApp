import 'package:bizne_fonda_app/app/models/auth/user.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService extends GetxService {
  String? token;
  User? user;
  late bool showBanner;

  bool get tokenExist => token != null;

  bool get isLogin => user != null;

  static UserService get service => Get.find();

  Future<UserService> init() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final showBanner = prefs.getBool('showBanner') ?? true;

    this.token = token;
    this.showBanner = showBanner;

    return this;
  }

  void setShowBanner(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('showBanner', value);
    showBanner = value;
  }

  void login(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);

    this.token = token;
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');

    token = null;
    user = null;
  }
}
