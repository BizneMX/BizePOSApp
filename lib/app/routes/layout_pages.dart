import 'package:bizne_fonda_app/app/modules/home/bindings/error_binding.dart';
import 'package:bizne_fonda_app/app/modules/home/bindings/historial_binding.dart';
import 'package:bizne_fonda_app/app/modules/home/bindings/home_binding.dart';
import 'package:bizne_fonda_app/app/modules/home/bindings/make_a_charge_binding.dart';
import 'package:bizne_fonda_app/app/modules/home/bindings/menu_of_day_binding.dart';
import 'package:bizne_fonda_app/app/modules/home/bindings/new_orders_binding.dart';
import 'package:bizne_fonda_app/app/modules/home/bindings/notifications_binding.dart';
import 'package:bizne_fonda_app/app/modules/home/bindings/pay_food_binding.dart';
import 'package:bizne_fonda_app/app/modules/home/bindings/reserves_binding.dart';
import 'package:bizne_fonda_app/app/modules/home/bindings/reserves_history_binding.dart';
import 'package:bizne_fonda_app/app/modules/home/bindings/success_payment_binding.dart';
import 'package:bizne_fonda_app/app/modules/home/bindings/summary_binding.dart';
import 'package:bizne_fonda_app/app/modules/profile/bindings/training_binding.dart';
import 'package:bizne_fonda_app/app/modules/home/views/error_view.dart';
import 'package:bizne_fonda_app/app/modules/home/views/historial_view.dart';
import 'package:bizne_fonda_app/app/modules/home/views/home_view.dart';
import 'package:bizne_fonda_app/app/modules/home/views/make_a_charge_view.dart';
import 'package:bizne_fonda_app/app/modules/home/views/menu_of_day_view.dart';
import 'package:bizne_fonda_app/app/modules/home/views/new_orders_view.dart';
import 'package:bizne_fonda_app/app/modules/home/views/notifications_view.dart';
import 'package:bizne_fonda_app/app/modules/home/views/pay_food_view.dart';
import 'package:bizne_fonda_app/app/modules/home/views/reserves_history_view.dart';
import 'package:bizne_fonda_app/app/modules/home/views/reserves_view.dart';
import 'package:bizne_fonda_app/app/modules/home/views/success_payment_vIew.dart';
import 'package:bizne_fonda_app/app/modules/home/views/summary_view.dart';
import 'package:bizne_fonda_app/app/modules/profile/views/training_view.dart';
import 'package:bizne_fonda_app/app/modules/layout/bindings/pdf_web_view_binding.dart';
import 'package:bizne_fonda_app/app/modules/layout/bindings/web_view_binding.dart';
import 'package:bizne_fonda_app/app/modules/layout/views/pdf_web_view.dart';
import 'package:bizne_fonda_app/app/modules/layout/views/web_view.dart';
import 'package:bizne_fonda_app/app/modules/profile/bindings/add_staff_binding.dart';
import 'package:bizne_fonda_app/app/modules/profile/bindings/change_password_binding.dart';
import 'package:bizne_fonda_app/app/modules/profile/bindings/edit_profile_binding.dart';
import 'package:bizne_fonda_app/app/modules/profile/bindings/my_staff_binding.dart';
import 'package:bizne_fonda_app/app/modules/profile/bindings/profile_binding.dart';
import 'package:bizne_fonda_app/app/modules/profile/bindings/qr_code_binding.dart';
import 'package:bizne_fonda_app/app/modules/profile/bindings/schedules_binding.dart';
import 'package:bizne_fonda_app/app/modules/profile/views/add_staff_view.dart';
import 'package:bizne_fonda_app/app/modules/profile/views/change_password_view.dart';
import 'package:bizne_fonda_app/app/modules/profile/views/edit_profile_view.dart';
import 'package:bizne_fonda_app/app/modules/profile/views/my_staff_view.dart';
import 'package:bizne_fonda_app/app/modules/profile/views/profile_view.dart';
import 'package:bizne_fonda_app/app/modules/profile/views/qr_code_view.dart';
import 'package:bizne_fonda_app/app/modules/profile/views/schedules_view.dart';
import 'package:bizne_fonda_app/app/routes/app_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LayoutPage {
  final String route;
  final Widget Function() page;
  final Bindings bindings;
  final bool showFooter;
  final bool canPop;

  LayoutPage(
      {required this.bindings,
      required this.page,
      required this.route,
      this.canPop = true,
      this.showFooter = true});
}

class LayoutPages {
  static final layoutPages = <LayoutPage>[
    LayoutPage(
        bindings: BizneWebViewBinding(),
        page: () => const BizneWebView(),
        route: Routes.webView,
        showFooter: false),
    LayoutPage(
        bindings: BiznePDFWebViewBinding(),
        page: () => const BiznePDFWebView(),
        route: Routes.pdfWebView,
        showFooter: false)
  ];
  static final homePages = <LayoutPage>[
    LayoutPage(
        bindings: HomeBinding(),
        page: () => const HomeView(),
        route: Routes.home),
    LayoutPage(
        bindings: NewOrdersBinding(),
        page: () => const NewOrderView(),
        route: Routes.newOrders),
    LayoutPage(
        bindings: HistorialBinding(),
        page: () => const HistorialView(),
        route: Routes.historial),
    LayoutPage(
        bindings: SummaryBinding(),
        page: () => const SummaryView(),
        route: Routes.summary),
    LayoutPage(
        bindings: MenuOfDayBinding(),
        page: () => const MenuOfDayView(),
        route: Routes.menuOfDay,
        showFooter: false),
    LayoutPage(
        bindings: MakeAChargeBinding(),
        page: () => const MakeAChargeView(),
        route: Routes.makeACharge,
        showFooter: false),
    LayoutPage(
        bindings: NotificationsBinding(),
        page: () => const NotificationsView(),
        route: Routes.notifications),
    LayoutPage(
        bindings: ErrorBinding(),
        page: () => const ErrorView(),
        route: Routes.error,
        showFooter: false,
        canPop: false),
    LayoutPage(
        bindings: PayFoodBinding(),
        page: () => const PayFoodView(),
        route: Routes.payFood,
        showFooter: false,
        canPop: false),
    LayoutPage(
        bindings: SuccessPaymentBinding(),
        page: () => const SuccessPaymentView(),
        route: Routes.successPayment,
        showFooter: false,
        canPop: false),
    LayoutPage(
        bindings: ReservesBinding(),
        page: () => const ReservesView(),
        route: Routes.reserves),
    LayoutPage(
        bindings: ReservesHistoryBinding(),
        page: () => const ReservesHistoryView(),
        route: Routes.reservesHistory)
  ];

  static final profilePages = <LayoutPage>[
    LayoutPage(
        bindings: ProfileBinding(),
        page: () => const ProfileView(),
        route: Routes.profile,
        showFooter: false),
    LayoutPage(
        bindings: SchedulesBinding(),
        page: () => const SchedulesView(),
        route: Routes.schedules,
        showFooter: false),
    LayoutPage(
      bindings: QrCodeBinding(),
      page: () => const QrCodeView(),
      route: Routes.qrCode,
    ),
    LayoutPage(
        bindings: EditProfileBinding(),
        page: () => const EditProfileView(),
        route: Routes.editProfile,
        showFooter: false),
    LayoutPage(
        bindings: ChangePasswordBinding(),
        page: () => const ChangePasswordView(),
        route: Routes.changePassword,
        showFooter: false),
    LayoutPage(
        bindings: MyStaffBinding(),
        page: () => const MyStaffView(),
        route: Routes.myStaff,
        showFooter: false),
    LayoutPage(
        bindings: AddStaffBinding(),
        page: () => const AddStaffView(),
        route: Routes.addStaff,
        showFooter: false),
    LayoutPage(
        bindings: TrainingBinding(),
        page: () => const TrainingView(),
        route: Routes.training),
  ];

  static final pages = <LayoutPage>[
    ...layoutPages,
    ...homePages,
    ...profilePages
  ];
}
