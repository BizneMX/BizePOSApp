import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/models/pagination_data.dart';
import 'package:bizne_fonda_app/app/models/response.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class PaginationController<T> extends GetxController {
  final RxList<T> list = <T>[].obs;
  var noData = false.obs;

  var page = 1;
  var total = 0;

  final int size;
  var loading = false;

  var scrollController = ScrollController();

  final Future<ResponseRepository<PaginationData<T>>> Function(int, int)
      loadData;

  PaginationController({required this.loadData, this.size = 10});

  @override
  void onInit() {
    super.onInit();

    getLoad(clear: true);
    scrollController.addListener(pagination);
  }

  @override
  void onClose() {
    scrollController.removeListener(pagination);
    super.onClose();
  }

  void suscribeScrollController(ScrollController scrollController) {
    this.scrollController.removeListener(pagination);
    this.scrollController = scrollController;
    this.scrollController.addListener(pagination);
  }

  Future<void> getLoad({bool clear = false}) async {
    if (clear) {
      page = 0;
      list.clear();
    } else {
      if (list.length == total) return;
    }

    EasyLoading.show();
    loading = true;
    final response = await loadData(size, page + 1);
    loading = false;
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      await Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    list.addAll(response.data!.data);
    total = response.data!.total;
    noData.value = total == 0;
    page++;
  }

  void pagination() {
    if (loading) return;
    if (scrollController.position.pixels + 500 >=
        scrollController.position.maxScrollExtent) {
      getLoad();
    }
  }
}
