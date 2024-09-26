import 'package:bizne_fonda_app/app/endpoints.dart';
import 'package:bizne_fonda_app/app/models/home/order.dart';
import 'package:bizne_fonda_app/app/models/pagination_data.dart';

import 'package:bizne_fonda_app/app/models/response.dart';
import 'package:bizne_fonda_app/app/services/api_service.dart';

import '../../core/home/new_order_repository.dart';

class NewOrderRepositoryImpl extends NewOrderRepository {
  @override
  Future<ResponseRepository<PaginationData<Order>>> getNewOrders(
      String search, int page, int count, bool? delivery) async {
    final response = await Api().get(Endpoints.orders, {
      'page': page.toString(),
      'count': count.toString(),
      'search': search,
      'type': '1',
      'delivery': delivery == null ? '' : delivery.toString()
    });

    return response.toResponseRepository(
        fromJson: (json) => PaginationData.fromJson(json, Order.fromJson));
  }

  @override
  Future<ResponseRepository<PaginationData<Order>>> getDeliveredOrders(
      String search, int page, int count, bool? delivery) async {
    final response = await Api().get(Endpoints.orders, {
      'page': page.toString(),
      'count': count.toString(),
      'search': search,
      'type': '2',
      'delivery': delivery == null ? '' : delivery.toString()
    });

    return response.toResponseRepository(
        fromJson: (json) => PaginationData.fromJson(json, Order.fromJson));
  }

  @override
  Future<ResponseRepository> acceptOrder(int orderId) async {
    final response =
        await Api().post(Endpoints.acceptOrder, {'id': orderId.toString()});

    return response.toResponseRepository();
  }
}
