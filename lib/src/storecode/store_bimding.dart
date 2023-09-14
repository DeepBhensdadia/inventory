import 'package:inventory/inventory.dart';
import 'package:inventory/src/storecode/storecontroller.dart';

class StoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreController>(
      () => StoreController(),
    );
  }
}
