import 'package:get/get.dart';
import 'package:inventory/inventory.dart';
import 'package:inventory/model/StoreCode.dart';

import '../../model/historydataresponse.dart';
import '../../model/login_model.dart';

class AssetController extends GetxController {
  final TextEditingController Upcontroller = TextEditingController();
  final WebRepository repository = WebRepository();

  // final HomeController homeController = Get.find<HomeController>();
  final HomeController homeController = Get.put(HomeController());

  late AssetDetails assetDetails;
  late Historydataresponse historydata;

  Future updatedata() async {
    StoreCode storecodeFromLocalData =
        storecodeFromJson(SharedPref.get(prefKey: PrefKey.storeCode)!);

    Login loginDetailsFromLocalData =
        loginFromJson(SharedPref.get(prefKey: PrefKey.loginDetails)!);

    Map<String, dynamic> data = {
      "company_id": storecodeFromLocalData.result!.companyId.toString(),
      "table_id": homeController.assetDetails.result!.tableId.toString(),
      "available_qty": Upcontroller.text,
      "status": homeController.assetDetails.status.toString(),
      "main_category": homeController.selectedStore.value.name.toString(),
      "user_id": loginDetailsFromLocalData.result!.userId.toString(),
    };
    print(data);
    historydata = await repository.updatedata(data);

    if (historydata.status == 0) {
      Fluttertoast.showToast(msg: historydata.message);
      Get.context!.loaderOverlay.hide();
    } else {
      Get.back();
      Fluttertoast.showToast(msg: historydata.message);

      Get.context!.loaderOverlay.hide();
    }
  }
}
