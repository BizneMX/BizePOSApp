import 'package:bizne_fonda_app/app/models/pagination_data.dart';
import 'package:bizne_fonda_app/app/models/response.dart';
import '../../../models/home/order.dart';

abstract class NewOrderRepository {
  Future<ResponseRepository<PaginationData<Order>>> getNewOrders(
      String search, int page, int count, bool? delivery);
  Future<ResponseRepository<PaginationData<Order>>> getDeliveredOrders(
      String search, int page, int count, bool? delivery);
  Future<ResponseRepository> acceptOrder(int orderId);
}
