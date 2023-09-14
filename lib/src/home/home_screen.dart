import 'package:inventory/inventory.dart';

import '../../drawer/drawer.dart';
import '../../model/StoreCode.dart';
import '../../widgets/custom_dropdown.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LocationController locationController = Get.find<LocationController>();

  final HomeController controller = Get.find<HomeController>();

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  // final StoreController storeController = Get.put(StoreController());

  @override
  void initState() {
    // TODO: implement initState
    if (locationController.location.result.isNotEmpty) {
      controller.location.text =
          locationController.location.result[0].locationCode.toString();
      print(controller.location.text);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.loaderOverlay.hide();
    StoreCode StorecodeFromLocalData =
        storecodeFromJson(SharedPref.get(prefKey: PrefKey.storeCode)!);
    return Scaffold(
      key: _globalKey,
      drawer: const Drawer(child: DrawerStaff()),
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.purple, size: 30),
        backgroundColor: Colors.white,
        elevation: 0.5,
        toolbarHeight: 60,
        title: const SizedBox(
          width: 100,
          child: Image(
            image: AssetImage('assets/images/logo.png'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   children: [
              //     IconButton(
              //       onPressed: () {
              //         _globalKey.currentState!.openDrawer();
              //       },
              //       icon: const Icon(Icons.menu, size: 30),
              //     ),
              //     const SizedBox(
              //       width: 100,
              //       child: Image(
              //         image: AssetImage('assets/images/logo.png'),
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 20),
              Text(
                'Current Selected Company',
                style: TextStyle(
                    fontFamily: 'gilroy',
                    fontSize: screenheight(context, dividedby: 50),
                    color: Colors.purple),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  AlertDialog dialog = AlertDialog(
                    title: Text('Do You Want To Change Company',
                        style: TextStyle(
                          fontSize: screenheight(context, dividedby: 50),
                          fontFamily: 'gilroy.bold',
                        )),
                    actions: [
                      TextButton(
                        onPressed: () {
                          SharedPref.deleteSpecific(prefKey: PrefKey.storeCode);
                          Get.offAllNamed(Routes.storeCode);
                        },
                        child: Text(
                          'Yes',
                          style: TextStyle(
                              fontSize: screenheight(context, dividedby: 50),
                              fontFamily: 'gilroy.bold',
                              color: Colors.purple),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'No',
                          style: TextStyle(
                              fontSize: screenheight(context, dividedby: 50),
                              fontFamily: 'gilroy.bold',
                              color: Colors.purple),
                        ),
                      ),
                    ],
                  );

                  showDialog(
                    context: context,
                    builder: (context) => dialog,
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade600.withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 0.5,
                            offset: const Offset(1, 1)),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ' ${StorecodeFromLocalData.result!.companyName}',
                              // 'Generation Next \n Althan,Surat',
                              style: TextStyle(
                                  fontSize:
                                      screenheight(context, dividedby: 50),
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54),
                              maxLines: 2,
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              size: 40,
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Select Location',
                    style: TextStyle(
                        fontFamily: 'gilroy',
                        fontSize: screenheight(context, dividedby: 50),
                        color: Colors.purple),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                // padding: const EdgeInsets.all(5.0),
                child: locationController.location.result.length == 0
                    ? Container(
                        alignment: Alignment.centerLeft,
                        height: screenheight(context, dividedby: 20),
                        // width: screenwidth(context, dividedby: 1),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade600.withOpacity(0.2),
                                blurRadius: 5,
                                spreadRadius: 0.5,
                                offset: const Offset(1, 1)),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'No Location',
                            style: TextStyle(
                                fontSize: screenheight(context, dividedby: 45),
                                fontFamily: 'gilroy.bold',
                                color: Colors.grey.shade400),
                          ),
                        ),
                      )
                    : CustomDropDown(
                        result: locationController.location.result,
                        onSelection: (var value) {
                          controller.location.text = value.toString();
                          print(value.toString());
                        },
                      ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Asset Number',
                    style: TextStyle(
                        fontFamily: 'gilroy',
                        fontSize: screenheight(context, dividedby: 50),
                        color: Colors.purple),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.number,
                controller: controller.assetno,
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

              const SizedBox(height: 20),
              SizedBox(
                height: screenheight(context, dividedby: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                      name: 'Submit',
                      onPressed: () async {
                        // LocationController c = Get.put(LocationController());
                        // await c.locationApi();

                        context.loaderOverlay.show();

                        await controller.submit();
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
