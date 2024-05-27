import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:inventory/model/updated_history.dart';

import '../widgets/custom_button.dart';
import '../widgets/customcolumn.dart';
import '../widgets/helper.dart';
import 'Asset/asset_controller.dart';

class EditAssetsScreen extends StatefulWidget {
  final Result assetDetails;
  const EditAssetsScreen({super.key, required this.assetDetails});

  @override
  State<EditAssetsScreen> createState() => _EditAssetsScreenState();
}

class _EditAssetsScreenState extends State<EditAssetsScreen> {
  AssetController assetController = Get.put(AssetController());
  final _formKey = GlobalKey<FormState>();
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
                        'Edit Ass',
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
                          'ets',
                          style: TextStyle(
                            fontSize: screenheight(context, dividedby: 37),
                            fontFamily: 'gilroy.bold',
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new,
                        color: Colors.transparent),
                    onPressed: () {},
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
                      CustomColumnRow(
                        tag: 'Tag',
                        name: widget.assetDetails.tagNumber,
                        tag2: 'Asset',
                        sname: widget.assetDetails.asset,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomColumnRow(
                        tag: 'Actual Quantity',
                        name: widget.assetDetails.qty,
                        tag2: 'Available Quantity',
                        sname: widget.assetDetails.availableQty,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomColumnRow(
                        tag: 'Category',
                        name: widget.assetDetails.category,
                        tag2: 'UOM',
                        sname: widget.assetDetails.uom,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomColumnRow(
                        tag: 'Location',
                        name: widget.assetDetails.location,
                        tag2: 'Sub location',
                        sname: widget.assetDetails.subLocation,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomColumnRow(
                        tag: 'Item Code',
                        name: widget.assetDetails.date,
                        tag2: 'Main Category',
                        sname: widget.assetDetails.mainCategory,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                )),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Physical quantity is require";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        controller: assetController.editUpcontroller,
                        decoration: InputDecoration(
                          fillColor: Colors.purple,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          hintText: 'Enter Physical Quantity',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: screenheight(context, dividedby: 55)),
                          border: const OutlineInputBorder(
                              gapPadding: 0,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Physical Remark is require";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        controller: assetController.editremarkcontroller,
                        decoration: InputDecoration(
                          fillColor: Colors.purple,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          hintText: 'Enter Remark',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: screenheight(context, dividedby: 55)),
                          border: const OutlineInputBorder(
                              gapPadding: 0,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                    ),
                  ],
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
                          if (_formKey.currentState!.validate()) {
                            var qtyDifference = int.parse(
                                    assetController.editUpcontroller.text) -
                                int.parse(widget.assetDetails.qty);
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
                                          Get.back();
                                          await assetController.Editdata(
                                              widget.assetDetails.productId);
                                        },
                                        name: 'Update',
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              await assetController.Editdata(
                                  widget.assetDetails.productId);
                            }
                          }
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
