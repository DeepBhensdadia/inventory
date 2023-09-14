import 'package:flutter/cupertino.dart';
import 'package:inventory/inventory.dart';

import 'comapnydetails/company_dashboard.dart';
import 'comapnyverification/phone_number_screen.dart';

class Select_way_Screen extends StatefulWidget {
  const Select_way_Screen({Key? key}) : super(key: key);

  @override
  State<Select_way_Screen> createState() => _Select_way_ScreenState();
}

class _Select_way_ScreenState extends State<Select_way_Screen> {
  final LocationController locationController = Get.put(LocationController());

  // @override
  // Future<void> initState() async {
  //   // Login loginDetailsFromLocalData =HH
  //   // loginFromJson(SharedPref.get(prefKey: PrefKey.loginDetails)!);
  //   super.initState();
  //
  //   if (SharedPref.get(prefKey: PrefKey.loginDetails) != null) {
  //     if (SharedPref.get(prefKey: PrefKey.loginDetails) != null) {
  //       if (SharedPref.get(prefKey: PrefKey.storeCode) != null) {
  //         context.loaderOverlay.show();
  //         await locationController.locationApi();
  //         context.loaderOverlay.hide();
  //
  //         Get.toNamed(Routes.home);
  //       } else {
  //         Get.toNamed(Routes.storecode);
  //       }
  //     } else {
  //       Get.toNamed(Routes.login);
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    context.loaderOverlay.hide();
    // final LocationController locationController = Get.put(LocationController());

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenheight(context, dividedby: 10),
          ),
          const SizedBox(
            // height: 200,
            width: 250,
            child: Image(
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
          SizedBox(
            height: screenheight(context, dividedby: 10),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(colors: [
                    Color(0xffA44D80),
                    Color(0xff75689E),
                  ])),
              // margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: CupertinoButton(
                onPressed: () async {
                  context.loaderOverlay.show();
                  if (SharedPref.get(prefKey: PrefKey.loginDetails) != null) {
                    if (SharedPref.get(prefKey: PrefKey.storeCode) != null) {
                      context.loaderOverlay.show();
                      await locationController.locationApi();
                      context.loaderOverlay.hide();

                      Get.toNamed(Routes.home);
                    } else {
                      Get.toNamed(Routes.storeCode);
                    }
                  } else {
                    Get.toNamed(Routes.login);
                  }
                  // Get.toNamed(
                  //     SharedPref.get(prefKey: PrefKey.loginDetails) != null
                  //         ? SharedPref.get(prefKey: PrefKey.storeCode) != null
                  //             ? Routes.home
                  //             : Routes.storecode
                  //         : Routes.login);
                },
                child: const Text(
                  'Staff Login',
                  style: TextStyle(color: Colors.white, letterSpacing: 2),
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenheight(context, dividedby: 15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(colors: [
                    Color(0xffA44D80),
                    Color(0xff75689E),
                  ])),
              // margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: CupertinoButton(
                // padding: EdgeInsets.all(20),
                onPressed: () {
                  if (SharedPref.get(prefKey: PrefKey.dashboarddata) != null) {
                    Get.off(() => CompanyDashboard());
                  } else {
                    Get.off(() => const PhonenumberVerification());
                  }
                },
                child: const Text(
                  'Company Login',
                  style: TextStyle(color: Colors.white, letterSpacing: 2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
