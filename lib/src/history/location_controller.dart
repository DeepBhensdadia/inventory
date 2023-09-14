import 'package:get/get.dart';
import 'package:inventory/inventory.dart';

import '../../model/StoreCode.dart';
import '../../model/locationModel.dart';
import '../../shared_pref/shared_pref.dart';
import '../../web_service/web_repository.dart';

class LocationController extends GetxController {
  final WebRepository repository = WebRepository();
  late LocationData location;

  Future locationApi() async {
    StoreCode storeCode =
        storecodeFromJson(SharedPref.get(prefKey: PrefKey.storeCode)!);

    Map<String, dynamic> data = {
      'company_id': storeCode.result!.companyId.toString()
    };

    location = await repository.location(data);

  }
}
