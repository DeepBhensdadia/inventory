import 'package:inventory/inventory.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationController>(
      () => LocationController(),
    );
  }
}
