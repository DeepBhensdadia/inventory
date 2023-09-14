import 'package:inventory/inventory.dart';
import 'package:inventory/src/comapnydetails/dashboard_controller.dart';
import 'package:inventory/src/select_wayscreen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  final LocationController locationController = Get.put(LocationController());

  @override
  void initState() {
    checkInternet();
    super.initState();
  }

  void checkInternet() async {
    context.loaderOverlay.show();
    if (await InternetConnectionChecker().hasConnection) {
      Future.delayed(const Duration(seconds: 2), () async {
        if (SharedPref.get(prefKey: PrefKey.loginDetails) != null) {
          if (SharedPref.get(prefKey: PrefKey.storeCode) != null) {
            context.loaderOverlay.show();
            await locationController.locationApi();
            Get.toNamed(Routes.home);
            context.loaderOverlay.hide();
          } else {
            context.loaderOverlay.hide();
            Get.toNamed(Routes.storeCode);
          }
        } else if (SharedPref.get(prefKey: PrefKey.dashboarddata) != null) {
          context.loaderOverlay.show();

          // Get.off(() => const CompanyDashboard());

          final dash = Get.put(DashboardController());
          await dash.dashboard();
        } else {
          context.loaderOverlay.hide();
          Get.off(() => const Select_way_Screen());
        }
      });
    } else {
      SnackBar snackBar = const SnackBar(
        content: Text('No Internet'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      context.loaderOverlay.hide();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(image: AssetImage('assets/images/logo.png')),
      ),
    );
  }
}
