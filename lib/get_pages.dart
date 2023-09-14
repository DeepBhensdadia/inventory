import 'package:inventory/inventory.dart';
import 'package:inventory/src/Asset/asset_binding.dart';
import 'package:inventory/src/Asset/asset_screen.dart';
import 'package:inventory/src/comapnydetails/company_dashboard.dart';
import 'package:inventory/src/comapnydetails/dashboardbinding.dart';
import 'package:inventory/src/comapnyverification/phone_number_screen.dart';
import 'package:inventory/src/comapnyverification/phonenumberbinding.dart';
import 'package:inventory/src/select_wayscreen.dart';
import 'package:inventory/src/storecode/store_bimding.dart';
import 'package:inventory/src/storecode/store_code_screen.dart';

List<GetPage> getPages = [
  GetPage(
    name: Routes.login,
    page: () => const LoginScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: Routes.storeCode,
    page: () => const StoreCode(),
    binding: StoreBinding(),
  ),
  GetPage(
    name: Routes.asset,
    page: () => const AssetScreen(),
    binding: AssetBinding(),
  ),
  GetPage(name: Routes.home, page: () => const HomeScreen(), bindings: [
    HomeBinding(),
    LocationBinding(),
  ]),
  GetPage(
    name: Routes.phoneNumber,
    page: () => const PhonenumberVerification(),
    binding: PhoneBinding(),
  ),
  GetPage(
    name: Routes.phoneNumber,
    page: () => const CompanyDashboard(),
    binding: dashboardBinding(),
  ),
  GetPage(
    name: Routes.phoneNumber,
    page: () => const PhonenumberVerification(),
    binding: PhoneBinding(),
  ),
  GetPage(
    name: Routes.history,
    page: () => const HistoryScreen(),
  ),
  GetPage(
    name: Routes.splash,
    page: () => const Splash_Screen(),
  ),
  GetPage(
    name: Routes.selectWay,
    page: () => const Select_way_Screen(),
  ),
  GetPage(
    name: Routes.storeCode,
    page: () => const StoreCode(),
  ),
];
