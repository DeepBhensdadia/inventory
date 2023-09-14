import 'package:inventory/src/comapnyverification/phonenumber_controller.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../inventory.dart';
import '../comapnydetails/dashboard_controller.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({Key? key}) : super(key: key);

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  final PhoneController phoneController = Get.find<PhoneController>();
  final DashboardController dashboardController =
      Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenwidth(context, dividedby: 10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenheight(context, dividedby: 7),
            ),
            Text(
              'Verify Mobile Number',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: screenheight(context, dividedby: 35),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: screenheight(context, dividedby: 50),
            ),
            Text(
              'We sent a Verification code to your number.Enter the code below',
              style: TextStyle(
                  letterSpacing: 0.5,
                  fontSize: screenheight(context, dividedby: 50),
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: screenheight(context, dividedby: 20),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenheight(context, dividedby: 30)),
              child: OTPTextField(
                // otpFieldStyle: OtpFieldStyle(borderColor: Colors.black),
                length: 4,

                width: screenwidth(context, dividedby: 1.8),
                fieldWidth: screenwidth(context, dividedby: 15),
                style: TextStyle(
                  fontSize: screenheight(context, dividedby: 40),
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,

                otpFieldStyle: OtpFieldStyle(focusBorderColor: Colors.orange),
                onCompleted: (pin) async {
                  if (pin == '1234') {
                    await SharedPref.save(
                        value: jsonEncode(
                            phoneController.phonenumberdata.result!.companyId),
                        prefKey: PrefKey.dashboarddata);
                    context.loaderOverlay.show();

                    await dashboardController.dashboard();
                  } else {
                    Fluttertoast.showToast(msg: 'Otp is not correct');
                  }
                },
              ),
            ),
            SizedBox(
              height: screenheight(context, dividedby: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '00 : ',
                  style: TextStyle(
                    fontSize: screenheight(context, dividedby: 60),
                    color: Colors.black45,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Countdown(
                  seconds: 60,
                  build: (BuildContext context, double time) =>
                      Text(time.toStringAsFixed(0)),
                  interval: const Duration(seconds: 1),
                  onFinished: () {
                    // print('Timer is done!');
                  },
                )
              ],
            ),
            SizedBox(
              height: screenheight(context, dividedby: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Resend OTP',
                  style: TextStyle(
                      fontSize: screenheight(context, dividedby: 60),
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade500,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
            SizedBox(
              height: screenheight(context, dividedby: 12),
            ),
            // CustomButton(
            //   onPressed: () {
            //     Get.off(() => const CompanyDeshboard());
            //   },
            //   name: 'Verify OTP',
            // )
          ],
        ),
      ),
    );
  }
}
