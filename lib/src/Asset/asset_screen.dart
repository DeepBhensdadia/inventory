import 'dart:io';

import 'package:inventory/inventory.dart';

import 'asset_controller.dart';

class AssetScreen extends StatefulWidget {
  const AssetScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AssetScreen> createState() => _AssetScreenState();
}

class _AssetScreenState extends State<AssetScreen> {
  final AssetController assetController = Get.find<AssetController>();

  final HomeController homeController = Get.find<HomeController>();

  File? profilepic;

  // final String data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              SizedBox(height: screenheight(context, dividedby: 17)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new,
                        color: Colors.black),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: screenheight(context, dividedby: 4)),
                      Text(
                        'Assets De',
                        style: TextStyle(
                            fontSize: screenheight(context, dividedby: 35),
                            fontFamily: 'gilroy.bold'),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                            color: Colors.purple,
                            width: 3,
                          ),
                        )),
                        child: Text(
                          'tails',
                          style: TextStyle(
                            fontSize: screenheight(context, dividedby: 37),
                            fontFamily: 'gilroy.bold',
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.watch_later_outlined,
                      color: Colors.purple,
                      size: 30,
                    ),
                    onPressed: () async {
                      context.loaderOverlay.show();

                      await homeController.Historyqat();
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                // borderOnForeground: false,
                elevation: 3,
                child: SizedBox(
                    // color: Colors.black26,
                    // height: 300,
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Column(
                          children: [
                            customrownew(
                              name: "Item Code",
                              value: homeController.assetDetails.result!.date,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            customrownew(
                              name: "Assets",
                              value: homeController.assetDetails.result!.asset,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            customrownew(
                              name: "Category",
                              value: homeController
                                  .assetDetails.result!.subLocation,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            customrownew(
                              name: "Category Code",
                              value:
                                  homeController.assetDetails.result!.location,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            customrownew(
                              name: "Tag",
                              value:
                                  homeController.assetDetails.result!.tagNumber,
                            ),
                          ],
                        ),
                      ),
                      // CustomColumnRow(
                      //   tag: 'Tag',
                      //   name: homeController.assetDetails.result!.tagNumber,
                      //   tag2: 'Asset',
                      //   sname: homeController.assetDetails.result!.asset,
                      // ),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      // CustomColumnRow(
                      //   tag: 'Actual Quantity',
                      //   name: homeController.assetDetails.result!.qty,
                      //   tag2: 'Available Quantity',
                      //   sname: homeController.assetDetails.result!.availableQty,
                      // ),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      // CustomColumnRow(
                      //   tag: 'Category',
                      //   name: homeController.assetDetails.result!.category,
                      //   tag2: 'UOM',
                      //   sname: homeController.assetDetails.result!.uom,
                      // ),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      // CustomColumnRow(
                      //   tag: 'Location',
                      //   name: homeController.assetDetails.result!.location,
                      //   tag2: 'Sub location',
                      //   sname: homeController.assetDetails.result!.subLocation,
                      // ),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      // CustomColumnRow(
                      //   tag: 'Item Code',
                      //   name: homeController.assetDetails.result!.date,
                      //   tag2: 'Main Category',
                      //   sname: homeController.assetDetails.result!.mainCategory,
                      // ),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                    ],
                  ),
                )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: assetController.Upcontroller,
                  decoration: InputDecoration(
                    fillColor: Colors.purple,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    hintText: 'Enter Physical Quantity',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: screenheight(context, dividedby: 55)),
                    border: const OutlineInputBorder(
                        gapPadding: 0,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: TextFormField(
                  controller: assetController.sublocationcontroller,
                  decoration: InputDecoration(
                    fillColor: Colors.purple,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    hintText: 'Enter Sub Location',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: screenheight(context, dividedby: 55)),
                    border: const OutlineInputBorder(
                        gapPadding: 0,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      name: 'Update',
                      onPressed: () async {
                        var qtyDifference = int.parse(
                                assetController.Upcontroller.text) -
                            int.parse(homeController.assetDetails.result!.qty);
                        if (qtyDifference > 100) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Alert'),
                                content: Text(
                                    'The quantity difference is greater than 100.'),
                                actions: [
                                  CustomButton(
                                    width: 100,
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    name: 'Cancel',
                                  ),
                                  CustomButton(
                                    width: 100,
                                    onPressed: () async {
                                      if (assetController
                                          .sublocationcontroller.text.isEmpty) {
                                        Get.snackbar("Sub Location",
                                            "Please Enter Sub Location");
                                        Fluttertoast.showToast(
                                            msg: "Please Enter Sub Location");
                                      } else {
                                        Get.back();
                                        await assetController.updatedata();
                                      }
                                    },
                                    name: 'Update',
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          await assetController.updatedata();
                        }
                      },
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        (profilepic != null) ? FileImage(profilepic!) : null,
                    backgroundColor: (profilepic != null)
                        ? Colors.grey
                        : const Color(0xffFAFAFA),
                    radius: 40,
                  ),
                  profilepic != null
                      ? IconButton(
                          color: Colors.grey.shade500,
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              profilepic = null;
                            });
                          },
                        )
                      : const SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
// ${homeController.assetDetails?.result?.location}
