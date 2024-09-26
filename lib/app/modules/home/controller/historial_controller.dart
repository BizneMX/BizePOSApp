import 'package:bizne_fonda_app/app/data/core/home/historial_repository.dart';
import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';
import 'package:bizne_fonda_app/app/utils/pagination_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/home/order.dart';

class HistorialController extends LayoutRouteController {
  HistorialRepository repository;

  HistorialController({required this.repository});

  final TextEditingController searchController = TextEditingController();
  late PaginationController<Order> paginationController;

  DateTime? initDate;
  DateTime? endDate;

  @override
  void onInit() {
    super.onInit();

    paginationController = PaginationController(
      loadData: (int size, int page) {
        final String search = searchController.value.text;
        final initDate = this.initDate ?? DateTime.now();
        final endDate = this.endDate ?? DateTime.now();

        String formatDate(DateTime dateTime) {
          final DateFormat formatter = DateFormat('yyyy-MM-dd');
          return formatter.format(dateTime);
        }

        return repository.getHistorial(
            search, formatDate(initDate), formatDate(endDate), page, size);
      },
    );

    Get.put(paginationController, tag: 'history');
  }

  @override
  void onClose() {
    super.onClose();

    paginationController.onClose();
  }

  @override
  void dispose() {
    super.dispose();

    paginationController.dispose();
  }
}
