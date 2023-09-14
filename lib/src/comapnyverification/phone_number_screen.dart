import 'package:inventory/inventory.dart';
import 'package:inventory/src/comapnyverification/phonenumber_controller.dart';

class PhonenumberVerification extends StatefulWidget {
  const PhonenumberVerification({Key? key}) : super(key: key);

  @override
  State<PhonenumberVerification> createState() =>
      _PhonenumberVerificationState();
}

class _PhonenumberVerificationState extends State<PhonenumberVerification> {
  final PhoneController phoneController = Get.put(PhoneController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenheight(context, dividedby: 10),
          ),
          Container(
              // height: 200,
              width: 250,
              child: const Center(
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
              )),
          SizedBox(
            height: screenheight(context, dividedby: 10),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenwidth(context, dividedby: 40)),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: phoneController.phonecontroller,
              maxLength: 10,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                hintText: 'Enter Your Mobile No.',
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

              await phoneController.phonecode();
            },
            name: 'Get OTP',
          )
        ],
      ),
    );
  }
}
