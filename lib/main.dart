
import '../../../../utils/constants/exports.dart';
import 'features/shop/controllers/favorite_controller.dart';

Future<void> main() async {
  ///  Add Widget Binding
  final WidgetsBinding widgetsBinding =
  WidgetsFlutterBinding.ensureInitialized();

  /// GetX Local Storage
  await GetStorage.init();

  /// Await Splash Screen until other item loaded
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  ///   Initialize Firebase  & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
        (FirebaseApp value)=> Get.put(AuthenticationRepository()),
  );

  Get.put(FavoritesController()); // Initializes the controller
  runApp(const MyApp());
}

