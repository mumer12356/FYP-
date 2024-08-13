
import '../../../../../utils/constants/exports.dart';
import '../../../../utils/constants/Alignments.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  //bool _showSubscriptionDialog = true;
  //bool subscriptionDialogVisible = true;
   late TabController tabController;
  //
  //
  final ValueNotifier<bool> _showSubscriptionIcon = ValueNotifier<bool>(false);

  // Method to toggle bottom bar visibility
  // void toggleBottomBarVisibility(bool isVisible) {
  //   setState(() {
  //     _showSubscriptionIcon.value = isVisible;
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      if(tabController.indexIsChanging){

        if(tabController.index==0){

        }
        else if(tabController.index==1){
          Get.to(() => AllCategoriesScreen(
            contractors: contractors,
            electricians: electrition,
            laborers: laborer,
            plumbers: plumber,
            painter: painters,
            welder: welders,
          ));
        }
        else if(tabController.index==2){
          Get.to(() => PopularServicesTab(
            contractors: contractors,
            laborers: laborer,
            electricians: electrition,
            plumbers: plumber,
            painters: painters,
            welders: welders,
          ));
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    // Delay showing the subscription dialog
    // Future.delayed(const Duration(seconds: 2), () {
    //   if (_showSubscriptionDialog) {
    //     showSubscriptionDialog(context);
    //   }
    // });

    return Scaffold(
      backgroundColor: Colors.red,
      extendBodyBehindAppBar: true,

      drawer: const HomeDrawer(),


      body:  Hero(
        tag: 'home_screen',
        child: DefaultTabController(
          length: 3, // Number of tabs
          child: Column(
            children: [

              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [


                        const CrouseSlider(),
                        const SizedBox(
                          height: CSizes.md,
                        ),
                        TabBar(
                          controller: tabController,
                          isScrollable: true,
                          labelColor: dark ? CColor.dark : CColor.textsecondary,
                          unselectedLabelColor: dark ? CColor.dark : CColor.textsecondary,
                          indicatorSize: TabBarIndicatorSize.values[0],
                          padding: const EdgeInsets.only(bottom: 10),
                          indicatorWeight: 3.0,
                          dividerHeight: 10,
                          indicator: BoxDecoration(
                            color: CColor.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tabs: const [
                            Tab(text: 'Home'),
                            Tab(text: 'Categories'),
                            Tab(text: 'Best Seller'),
                          ],
                        ),


                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            children: [
                              //HeightBetweenWelcome30,
                              Row(
                                mainAxisAlignment: StartAlignment,
                                children: [
                                  Text('Categories: ', style: CtextTheme.HomeText),
                                  const Spacer(),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(createFadeRoute(
                                        AllCategoriesScreen(
                                          contractors: contractors,
                                          electricians: electrition,
                                          laborers: laborer,
                                          plumbers: plumber,
                                          painter: painters,
                                          welder: welders,
                                        ),
                                      ));
                                    },
                                    child: const Text('View More >>',
                                      style: TextStyle(color: Colors.black87,fontSize: 14),),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: CSizes.sm,
                              ),

                              CategoriesList(
                                contractors: contractors,
                                electricians: electrition,
                                laborers: laborer,
                                plumbers: plumber,
                                painter: painters,
                                welder: welders,
                              ),
                              const SizedBox(
                                height: CSizes.xl,
                              ),
                              Row(
                                mainAxisAlignment: StartAlignment,
                                children: [
                                  Text('Popular Services: ', style: CtextTheme.HomeText),
                                ],
                              ),
                              PopularServices(
                                contractors: contractors,
                                electricians: electrition,
                                laborers: laborer,
                                plumbers: plumber,
                                painters: painters,
                                welders: welders,
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSubscriptionDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false, // Makes the dialog non-dismissible
      builder: (context) {
        return AlertDialog(
          title: const Text('Please Subscribe',style: TextStyle(fontWeight: FontWeight.bold),),
          content: const Text("If you don't subscribe, you can temporarily use the app without hiding, "
              "but subscribing is necessary for smooth usage."),
          actions: [
            TextButton(
              onPressed: () {
                // toggleBottomBarVisibility(true); // Show bottom bar
                // _showSubscriptionDialog=false;

                // setState(() {
                //   _showSubscriptionDialog =false;
                //   subscriptionDialogVisible = false;
                //
                // });
                _showSubscriptionIcon.value = true;
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Hide',
                style: TextStyle(color: CColor.primary),
              ),
            ),
            TextButton(
              onPressed: () async {
                setState(() {
                 // toggleBottomBarVisibility(true);
                });
                showSubscriptionOptions(context);
              },
              child: const Text('Subscribe',
                style: TextStyle(color: CColor.primary),
              ),
            ),
          ],
        );
      },
    );
  }

  void showSubscriptionOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      //isScrollControlled: true, // Makes the modal take full screen
      builder:(context) {
        return SubscriptionOptionsScreen(
          onPaymentSuccess:() async{
            // Update flag when payment is successful
            setState(() {
             // toggleBottomBarVisibility(true);
            });
            // Hide subscription icon in bottom bar
           // toggleBottomBarVisibility(true);
            Navigator.of(context).pop(); // Close the bottom sheet
            Get.snackbar(
              'Success',
              'Subscription successful! You can now enjoy all features.',
              backgroundColor: Colors.green,
            );
          },
        );
      },
    );
  }
}

