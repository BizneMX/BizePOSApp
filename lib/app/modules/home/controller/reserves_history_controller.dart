import 'package:bizne_fonda_app/app/models/home/reserve.dart';
import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservesHistoryController extends LayoutRouteController {
  var reserves = <(String, String), List<Reserve>>{}.obs;

  var noData = false.obs;

  final TextEditingController searchController = TextEditingController();

  DateTime? initDate;
  DateTime? endDate;
}
