import 'package:get/get.dart';
import 'package:inventory/inventory.dart';

import '../../model/Phone_model.dart';
import '../../web_service/web_repository.dart';
import 'otp_screen.dart';

class PhoneController extends GetxController {
  final WebRepository repository = WebRepository();
  TextEditingController phonecontroller = TextEditingController();
  late Phonedata phonenumberdata;

  Future phonecode() async {
    Map<String, dynamic> phone = {'mobileno': phonecontroller.text};

    phonenumberdata = await repository.phonedata(phone);

    if (phonenumberdata.status == 0) {
      Fluttertoast.showToast(msg: phonenumberdata.message!);
      Get.context!.loaderOverlay.hide();
    } else {
      Get.off(VerifyOTP());
      Fluttertoast.showToast(msg: phonenumberdata.message!);

      Get.context!.loaderOverlay.hide();
    }
  }
}
