import 'package:bizne_fonda_app/app/data/core/profile/staff_repository.dart';
import 'package:bizne_fonda_app/app/endpoints.dart';
import 'package:bizne_fonda_app/app/models/profile/staff.dart';
import 'package:bizne_fonda_app/app/models/response.dart';
import 'package:bizne_fonda_app/app/services/api_service.dart';

class StaffRepositoryImpl extends StaffRepository {
  @override
  Future<ResponseRepository<List<Staff>>> getStaff() async {
    final response = await Api().get(Endpoints.getStaff, {});

    return response.toResponseRepository(
        fromJson: (data) => data.map<Staff>((e) => Staff.fromJson(e)).toList());
  }

  @override
  Future<ResponseRepository> blockUnBlock(bool isBlock, int id) async {
    final response = await Api()
        .post(Endpoints.blockUnBlock, {'status': !isBlock, 'id': id});

    return response.toResponseRepository();
  }

  @override
  Future<ResponseRepository> addStaff(String name, String lastName,
      String phone, String email, String password) async {
    final response = await Api().post(Endpoints.addStaff, {
      'name': name,
      'lastname': lastName,
      'phone': phone,
      'email': email,
      'password': password
    });

    return response.toResponseRepository();
  }
}
