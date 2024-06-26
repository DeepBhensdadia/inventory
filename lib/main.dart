import 'package:flutter/services.dart';
import 'package:inventory/gen/fonts.gen.dart';
import 'package:inventory/inventory.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: Center(
          child: LoadingAnimationWidget.fourRotatingDots(
              color: Colors.purple, size: 80)),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Inventory App',
        getPages: getPages,
        initialRoute: Routes.splash,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: FontFamily.gilroy,
        ),
      ),
    );
  }
}
// 9810559631
