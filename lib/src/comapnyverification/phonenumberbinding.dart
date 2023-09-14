import 'package:inventory/inventory.dart';
import 'package:inventory/src/comapnyverification/phonenumber_controller.dart';

class PhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneController>(
      () => PhoneController(),
    );
  }
}
