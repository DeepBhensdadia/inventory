import 'package:inventory/inventory.dart';

import 'asset_controller.dart';

class AssetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssetController>(
      () => AssetController(),
    );
  }
}
