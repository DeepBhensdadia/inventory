import 'package:inventory/inventory.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    context.loaderOverlay.hide();
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // color: Colors.red,
            // margin: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenheight(context, dividedby: 4)),
                    Text(
                      'Sign',
                      style: TextStyle(
                          fontSize: screenheight(context, dividedby: 32),
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
                        ' In',
                        style: TextStyle(
                          fontSize: screenheight(context, dividedby: 32),
                          fontFamily: 'gilroy.bold',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenheight(context, dividedby: 15),
                ),
                CommonTextField(
                  controller: loginController.email,
                  hintText: 'Enter Email',
                  isPasswordField: false,
                  prefixicon: const Icon(Icons.person, color: Colors.purple),
                ),
                SizedBox(
                  height: screenheight(context, dividedby: 40),
                ),
                CommonTextField(
                  controller: loginController.password,
                  hintText: 'Password',
                  // isPasswordField: true,

                  prefixicon: const Icon(
                    Icons.lock,
                    color: Colors.purple,
                  ),
                ),
                SizedBox(
                  height: screenheight(context, dividedby: 20),
                ),
                CustomButton(
                  name: 'Login',
                  onPressed: () {
                    context.loaderOverlay.show();

                    loginController.login();
                    loginController.email.clear();
                    loginController.password.clear();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
