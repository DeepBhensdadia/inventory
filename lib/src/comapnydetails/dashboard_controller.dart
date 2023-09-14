import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:inventory/inventory.dart';

import '../../model/company_dashboard_data.dart';
import '../../web_service/web_repository.dart';
import '../comapnyverification/phonenumber_controller.dart';
import 'company_dashboard.dart';

class DashboardController extends GetxController {
  final WebRepository repository = WebRepository();
  final PhoneController phoneController = Get.put(PhoneController());

  late Dashboarddata dashboarddata;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future dashboard() async {
    Map<String, dynamic> company_id = {
      'company_id': SharedPref.get(prefKey: PrefKey.dashboarddata)!,
    };

    dashboarddata = await repository.companydata(company_id);
    Get.context!.loaderOverlay.hide();

    if (dashboarddata.status == 0) {
      Fluttertoast.showToast(msg: dashboarddata.message);
    } else {
      await SharedPref.save(
          value: jsonEncode(dashboarddata.result.metaTitle.toString()),
          prefKey: PrefKey.companytitle);
      // Get.context!.loaderOverlay.show();

      Get.off(CompanyDashboard());
      Fluttertoast.showToast(msg: dashboarddata.message);

      // Get.context!.loaderOverlay.hide();
    }
  }
}
