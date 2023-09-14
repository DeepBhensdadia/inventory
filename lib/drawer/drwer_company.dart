import 'package:inventory/inventory.dart';
import 'package:inventory/src/select_wayscreen.dart';

import '../src/about.dart';
import '../src/comapnydetails/dashboard_controller.dart';
import '../src/contect.dart';
import '../widgets/drawer_widget.dart';

class DrawerCompany extends StatefulWidget {
  const DrawerCompany({Key? key}) : super(key: key);

  @override
  State<DrawerCompany> createState() => _DrawerCompanyState();
}

class _DrawerCompanyState extends State<DrawerCompany> {
  final DashboardController dashboardController =
      Get.put(DashboardController());

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: screenheight(context, dividedby: 12),
        ),
        const Image(
          width: 150,
          image: AssetImage(
            'assets/images/logo.png',
          ),
        ),
        SizedBox(
          height: screenheight(context, dividedby: 35),
        ),
        // Drawer_Name(
        //     name: SharedPref.get(prefKey: PrefKey.companytitle)!,
        //     // 'Generation Next Dashboard',
        //     onTap: () {}),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(screenheight(context, dividedby: 50)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(
                    child: Text(
                      SharedPref.get(prefKey: PrefKey.companytitle)!,
                      style: TextStyle(
                          fontSize: screenheight(context, dividedby: 40),
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                      maxLines: 2,
                    ),
                  ),
                ]),
              ),
              const Divider(
                indent: 18,
                endIndent: 18,
                thickness: 2,
              ),
            ],
          ),
        ),
        Drawer_Widget(
            name: 'Home',
            onTap: () {
              Navigator.pop(context);
            }),
        Drawer_Widget(
            name: 'About',
            onTap: () {
              context.loaderOverlay.show();
              Future.delayed(const Duration(milliseconds: 500),
                  () => Get.to(() => const About_Screen()));
            }),
        Drawer_Widget(
            name: 'Contact',
            onTap: () {
              context.loaderOverlay.show();
              Future.delayed(const Duration(milliseconds: 500),
                  () => Get.to(() => const Contect_Screen()));
            }),
        Drawer_Widget(
            name: 'Log Out',
            onTap: () {
              SharedPref.deleteAll();
              context.loaderOverlay.show();
              Future.delayed(const Duration(milliseconds: 500),
                  () => Get.offAll(() => const Select_way_Screen()));
            }),
      ],
    );
  }
}
