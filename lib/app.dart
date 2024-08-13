import '../../../../utils/constants/exports.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: CAppTheme.lightTheme,
      darkTheme: CAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      /// Show Loader or Circular Progress Indicator meanwhile Authentication Repo is decide to show relevant screen
      home: const Scaffold(
        backgroundColor: CColor.primary, body: Center(child:  CircularProgressIndicator(color: Colors.white,),),
      ),

    );
  }
}