import 'package:inventory/src/storecode/storecontroller.dart';

import '../../inventory.dart';
import '../select_wayscreen.dart';

class StoreCode extends StatelessWidget {
  const StoreCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.loaderOverlay.hide();
    final StoreController storeController = Get.find<StoreController>();

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: screenheight(context, dividedby: 17)),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                onPressed: () {
                  Get.off(() => const Select_way_Screen());
                },
              ),
              SizedBox(
                width: screenwidth(context, dividedby: 10),
              ),
              const SizedBox(
                width: 200,
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenheight(context, dividedby: 40),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select your Company',
                style: TextStyle(
                    fontFamily: 'gilroy.bold',
                    fontSize: screenheight(context, dividedby: 30)),
              ),
            ],
          ),
          SizedBox(
            height: screenheight(context, dividedby: 10),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: storeController.codecontroller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                hintText: 'Enter your Company Code',
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: screenheight(context, dividedby: 55)),
                border: const OutlineInputBorder(
                    gapPadding: 0,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
          SizedBox(
            height: screenheight(context, dividedby: 20),
          ),
          CustomButton(
            onPressed: () async {
              context.loaderOverlay.show();

              await storeController.storecode();
              storeController.codecontroller.clear();
              // Get.toNamed(Routes.home);
            },
            name: 'Select',
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    ));
  }
}
