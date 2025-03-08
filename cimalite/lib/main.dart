import 'package:cimalite/core/hook/hook.dart';
import 'package:cimalite/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

const savekeyname = 'UserLoggedIn';
const savesocinfo = '_userSocIn';
const savedeviceinfo = '_userDeviceIn';
const savedevicetkn='_userDeviceTkn';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //MyApp({super.key});
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  late final SessionTimer sessionTimer;

  MyApp({super.key}) {
    sessionTimer = SessionTimer(navigatorKey);
    sessionTimer.startTimer();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiProvider(providers: [
        ChangeNotifierProvider<LoadingProvider>(
            create: (context) => LoadingProvider()),
        ChangeNotifierProvider<ElevatedBtnProvider>(
            create: (context) => ElevatedBtnProvider()),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
          builder: (context, child) {
            final themeProvider = Provider.of<ThemeProvider>(context);
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: TextScaler.noScaling),
              child: MaterialApp(
                navigatorKey: navigatorKey,
                title: 'Co-op Connect',
                themeMode: themeProvider.themeMode,
                theme: themeProvider.lightScheme,
                darkTheme: themeProvider.darkScheme,
                home: const ScreenSplash(),
              ),
            );
          },
        ),
      ]);
}
