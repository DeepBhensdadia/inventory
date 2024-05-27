import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/widgets/custom_button.dart';
import 'package:inventory/widgets/helper.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../model/searchassetsmodel.dart';
import '../../model/updated_history.dart';
import '../../widgets/customcolumn.dart';
import '../editassetscreen.dart';
import '../home/home_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final HomeController homeController = Get.find<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.AssetsList(searchkey: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
            onPressed: () {
              Get.back();
            },
          ),
          backgroundColor: Colors.white,
          title: Text(
            'Search Assets',
            style: TextStyle(
                fontFamily: 'gilroy.bold',
                color: Colors.black,
                letterSpacing: 2,
                fontSize: screenheight(context, dividedby: 32)),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                // controller: controller.assetno,
                onChanged: (value) {
                  homeController.AssetsList(searchkey: value);
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  hintText: 'Enter Your Asset No.',
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: screenheight(context, dividedby: 55)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.orange),
                      gapPadding: 0,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => homeController.show.isFalse
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : homeController.assetsdetaillist.isEmpty
                        ? const Center(
                            child: Text('No Data Available'),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: homeController.assetsdetaillist.length,
                            itemBuilder: (context, index) {
                              assetsdetails result =
                                  homeController.assetsdetaillist[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Card(
                                    elevation: 3,
                                    child: ListTile(
                                      onTap: () async {
                                        homeController.assetno.text =
                                            result.itemCode ?? "";
                                        context.loaderOverlay.show();
                                        await homeController.submit2();
                                      },
                                      title: Text(result.itemCode ?? ''),
                                      subtitle: Text(result.asset ?? ''),
                                    )),
                              );
                            },
                          ),
              ),
            ),
          ],
        ));
  }
}
