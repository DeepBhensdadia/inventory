import 'package:inventory/inventory.dart';

import '../../drawer/drwer_company.dart';
import '../../widgets/dashboard/custom_dashboard.dart';
import '../../widgets/dashboard/custom_dashboard2.dart';
import 'dashboard_controller.dart';

class CompanyDashboard extends StatefulWidget {
  const CompanyDashboard({Key? key}) : super(key: key);

  @override
  State<CompanyDashboard> createState() => _CompanyDashboardState();
}

class _CompanyDashboardState extends State<CompanyDashboard> {
  final HomeController controller = Get.put(HomeController());
  final DashboardController dashboardController =
      Get.find<DashboardController>();

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: const Drawer(child: DrawerCompany()),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.purple, size: 30),
        backgroundColor: Colors.white,
        elevation: 0.5,
        toolbarHeight: 60,
        title: Text(
          dashboardController.dashboarddata.result.metaTitle.toString(),
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontFamily: 'gilroy.bold'),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await dashboardController.dashboard();
        },
        child: SingleChildScrollView(
          child: Container(
            // color: Colors.red,
            height: screenheight(context, dividedby: 1.1),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    elevation: 3,
                    child: SizedBox(
                        // height: screenheight(context, dividedby: 5),
                        child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Category Wise Audit Status of \n Physcial Qty VS Actual Qty',
                                  style: TextStyle(
                                      fontFamily: 'gilroy.bold',
                                      // color: Colors.purple.shade300,
                                      fontSize:
                                          screenwidth(context, dividedby: 23)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Custom_dashboard2(
                            name1: 'Category',
                            name2: 'Count',
                            name3: 'QTY',
                          ),
                          Custom_dashboard2(
                            name1: 'A',
                            name2: dashboardController
                                .dashboarddata.result.getProductQtyACount
                                .toString(),
                            name3: dashboardController
                                .dashboarddata.result.getProductQtyA
                                .toString(),
                          ),
                          Custom_dashboard2(
                            name1: 'B',
                            name2: dashboardController
                                .dashboarddata.result.getProductQtyBCount
                                .toString(),
                            name3: dashboardController
                                .dashboarddata.result.getProductQtyB
                                .toString(),
                          ),
                          Custom_dashboard2(
                            name1: 'C',
                            name2: dashboardController
                                .dashboarddata.result.getProductQtyCCount
                                .toString(),
                            name3: dashboardController
                                .dashboarddata.result.getProductQtyC
                                .toString(),
                          ),
                          Custom_dashboard2(
                            name1: 'Total :',
                            name2: dashboardController
                                .dashboarddata.result.getProductQtyTotalCount
                                .toString(),
                            name3: dashboardController
                                .dashboarddata.result.getProductQtyTotal
                                .toString(),
                          ),
                        ],
                      ),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    elevation: 3,
                    child: SizedBox(
                        // height: screenheight(context, dividedby: 5),
                        child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Auditor Wise Audit Status of \n Physcial Qty VS Actual Qty',
                                  style: TextStyle(
                                      fontFamily: 'gilroy.bold',
                                      // color: Colors.purple.shade300,
                                      fontSize:
                                          screenwidth(context, dividedby: 23)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Custom_dashboard(
                            name1: 'Category',
                            name2: 'Count',
                            name3: 'physical QTY',
                            name4: 'Available QTY',
                          ),
                          Custom_dashboard(
                            name1: 'A',
                            name2: dashboardController
                                .dashboarddata.result.getProductCategoryCountA
                                .toString(),
                            name3: dashboardController
                                .dashboarddata.result.getProductCategoryA
                                .toString(),
                            name4: dashboardController
                                .dashboarddata.result.getProductQtyAvailableQtyA
                                .toString(),
                          ),
                          Custom_dashboard(
                            name1: 'B',
                            name2: dashboardController
                                .dashboarddata.result.getProductCategoryCountB
                                .toString(),
                            name3: dashboardController
                                .dashboarddata.result.getProductCategoryB
                                .toString(),
                            name4: dashboardController
                                .dashboarddata.result.getProductQtyAvailableQtyB
                                .toString(),
                          ),
                          Custom_dashboard(
                            name1: 'C',
                            name2: dashboardController
                                .dashboarddata.result.getProductCategoryCountC
                                .toString(),
                            name3: dashboardController
                                .dashboarddata.result.getProductCategoryC
                                .toString(),
                            name4: dashboardController
                                .dashboarddata.result.getProductQtyAvailableQtyC
                                .toString(),
                          ),
                          Custom_dashboard(
                            name1: 'Total',
                            name2: dashboardController.dashboarddata.result
                                .getProductCategoryCountTotal
                                .toString(),
                            name3: dashboardController
                                .dashboarddata.result.getProductQtyTotal
                                .toString(),
                            name4: dashboardController.dashboarddata.result
                                .getProductQtyAvailableQtyTotal
                                .toString(),
                          ),
                        ],
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
