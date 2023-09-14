import 'package:inventory/inventory.dart';

import '../../model/StoreCode.dart';

class StoreController extends GetxController {
  final WebRepository repository = WebRepository();
  TextEditingController codecontroller = TextEditingController();
  late StoreCode storecodedata;

  final LocationController locationController = Get.put(LocationController());

  Future storecode() async {
    Map<String, dynamic> data = {'company_code': codecontroller.text};
    // print(data);
    storecodedata = await repository.storedata(data);

    if (storecodedata.status == 0) {
      Fluttertoast.showToast(msg: storecodedata.message!);
      Get.context!.loaderOverlay.hide();
    } else {
      await SharedPref.save(
          value: jsonEncode(storecodedata.toJson()),
          prefKey: PrefKey.storeCode);

      await locationController.locationApi();
      Get.context!.loaderOverlay.hide();

      Get.toNamed(Routes.home);
      Fluttertoast.showToast(msg: storecodedata.message!);
    }
  }
}
