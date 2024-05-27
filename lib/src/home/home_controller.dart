import 'package:inventory/inventory.dart';
import 'package:inventory/model/login_model.dart';

import '../../model/StoreCode.dart';
import '../../model/searchassetsmodel.dart';
import '../../model/updated_history.dart';

enum StoreType { W, S }

class HomeController extends GetxController {
  final WebRepository repository = WebRepository();

  // final LoginController loginController = Get.put(LoginController());
  final TextEditingController assetno = TextEditingController();
  final TextEditingController location = TextEditingController();
  // final TextEditingController physicalqat = TextEditingController();

  Rx<StoreType> selectedStore = StoreType.W.obs;

  late AssetDetails assetDetails;
  late UpdatedHistory historyqat;
  Login? login;

  void select(StoreType val) => selectedStore(val);

  Future submit() async {
    StoreCode storecodeFromLocalData =
        storecodeFromJson(SharedPref.get(prefKey: PrefKey.storeCode)!);
    assetDetails = await repository.assetDetails(AssetCredintial(
        companyId: storecodeFromLocalData.result!.companyId.toString(),
        tagNumber: assetno.text,
        mainCategory: location.text)); //selectedStore.value.name.toString()));
    Get.context!.loaderOverlay.hide();

    if (assetDetails.status == 0) {
      Fluttertoast.showToast(msg: assetDetails.message.toString());
      assetno.clear();
      return;
    } else if (assetDetails.status == 1) {
      assetno.clear();
      Get.toNamed(Routes.asset);
      return;
    } else {
      Fluttertoast.showToast(msg: 'Data already updated.');
    }
  }

  Future submit2() async {
    StoreCode storecodeFromLocalData =
        storecodeFromJson(SharedPref.get(prefKey: PrefKey.storeCode)!);
    assetDetails = await repository.assetDetails(AssetCredintial(
        companyId: storecodeFromLocalData.result!.companyId.toString(),
        tagNumber: assetno.text,
        mainCategory: location.text)); //selectedStore.value.name.toString()));
    Get.context!.loaderOverlay.hide();

    if (assetDetails.status == 0) {
      Fluttertoast.showToast(msg: assetDetails.message.toString());
      assetno.clear();
      return;
    } else if (assetDetails.status == 1) {
      assetno.clear();
      Get.offAndToNamed(Routes.asset);
      return;
    } else {
      Fluttertoast.showToast(msg: 'Data already updated.');
    }
  }

  Future Historyqat() async {
    Login loginDetailsFromLocalData =
        loginFromJson(SharedPref.get(prefKey: PrefKey.loginDetails)!);

    Map<String, dynamic> data = {
      "user_id": loginDetailsFromLocalData.result!.userId.toString(),
    };
    historyqat = await repository.updatedhistory(data);

    if (historyqat.status == 0) {
      Fluttertoast.showToast(msg: historyqat.message);
      Get.context!.loaderOverlay.hide();
    } else if (historyqat.result == null) {
      Fluttertoast.showToast(msg: historyqat.message);
      Get.context!.loaderOverlay.hide();
    } else {
      Get.to(() => const HistoryScreen());
      Get.context!.loaderOverlay.hide();
    }
  }

  Future Historyqat2() async {
    Login loginDetailsFromLocalData =
        loginFromJson(SharedPref.get(prefKey: PrefKey.loginDetails)!);

    Map<String, dynamic> data = {
      "user_id": loginDetailsFromLocalData.result!.userId.toString(),
    };
    historyqat = await repository.updatedhistory(data);

    if (historyqat.status == 0) {
      Fluttertoast.showToast(msg: historyqat.message);
      Get.context!.loaderOverlay.hide();
    } else if (historyqat.result == null) {
      Fluttertoast.showToast(msg: historyqat.message);
      Get.context!.loaderOverlay.hide();
    } else {
      Get.back();
    }
  }

  RxList<assetsdetails> assetsdetaillist = <assetsdetails>[].obs;
  RxBool show = false.obs;

  Future AssetsList({required String searchkey}) async {
    StoreCode StorecodeFromLocalData =
        storecodeFromJson(SharedPref.get(prefKey: PrefKey.storeCode)!);
    // Get.context!.loaderOverlay.show();
    Searchassetsmodel assetslistzv = await repository.assetslist(
        search: searchkey,
        companyid: StorecodeFromLocalData.result?.companyId.toString() ?? "");

    assetsdetaillist.value = assetslistzv.data ?? [];
    show.value = true;
    Get.context!.loaderOverlay.hide();
  }
}
