import 'package:bizne_fonda_app/app/models/profile/staff.dart';
import 'package:bizne_fonda_app/app/models/response.dart';

abstract class StaffRepository {
  Future<ResponseRepository<List<Staff>>> getStaff();

  Future<ResponseRepository> blockUnBlock(bool isBlock,int id);

  Future<ResponseRepository> addStaff(String name, String lastName,
      String phone, String email, String password);
}
