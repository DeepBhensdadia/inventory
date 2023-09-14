import 'package:http/http.dart' as http;
import 'package:inventory/inventory.dart';

import '../model/Phone_model.dart';
import '../model/StoreCode.dart';
import '../model/company_dashboard_data.dart';
import '../model/historydataresponse.dart';
import '../model/locationModel.dart';
import '../model/login_model.dart';
import '../model/updated_history.dart';

class WebRepository {
  Future<Login> login(LoginCredentials credentials) async {
    http.Response response = await WebService.postRequest(
      url: Url.login,
      body: credentials.toJson(),
    );

    return loginFromJson(response.body);
  }

  Future<AssetDetails> assetDetails(AssetCredintial assets) async {
    print(Url.Asset_details);
    http.Response response = await WebService.postRequest(
      url: Url.Asset_details,
      body: assets.toJson(),
    );
    return assetDetailsFromJson(response.body);
  }

  updatedhistory(Map<String, dynamic> data) async {
    http.Response response = await WebService.postRequest(
      url: Url.updatedhistory,
      body: data,
    );
    return updatedHistoryFromJson(response.body);
  }

  updatedata(Map<String, dynamic> data) async {
    http.Response response = await WebService.postRequest(
      url: Url.update_byid,
      body: data,
    );
    print(response.body);
    return historydataresponseFromJson(response.body);
  }

  storedata(Map<String, dynamic> data) async {
    http.Response response = await WebService.postRequest(
      url: Url.getcompany,
      body: data,
    );
    return storecodeFromJson(response.body);
  }

  location(Map<String, dynamic> data) async {
    Uri url = Uri.parse(Url.companycode);

    http.Response response = await WebService.postRequestWithParam(
        url: url.replace(queryParameters: data));
    return locationdataFromJson(response.body);
  }

  phonedata(Map<String, dynamic> phone) async {
    http.Response response = await WebService.postRequest(
      url: Url.companylogin,
      body: phone,
    );
    return phonedataFromJson(response.body);
  }

  companydata(Map<String, dynamic> phone) async {
    http.Response response = await WebService.postRequest(
      url: Url.companydashboard,
      body: phone,
    );
    return dashboarddataFromJson(response.body);
  }
}
// http://tagmyassets.com/ivapp/api/app_login
// [POST]
// email=ivapp@gmail.com
// password=123456789
//
//
// http://tagmyassets.com/ivapp/api/app_get_asset_details
// [POST]
// tag_number=1234
// main_category=W
//
// tag_number=1234
// main_category=S
//
//
// http://tagmyassets.com/ivapp/api/app_user_update_quantity_history
// [POST]
// user_id=1
