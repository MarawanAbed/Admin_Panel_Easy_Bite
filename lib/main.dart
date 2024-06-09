import 'dart:io';

import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/core/theme/dark_theme.dart';
import 'package:admin/core/theme/light_theme.dart';
import 'package:admin/src/main_index.dart';
import 'package:provider/provider.dart';

import 'core/network/base_client.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.orange, systemNavigationBarColor: Colors.orange));

await configureDependencies();
// Initialize FFI
// databaseFactory = databaseFactoryFfiWeb;

ServicesLocator().init();
injector.registerSingleton(ClientCreator(
    interceptor: HeaderInterceptor(
      accessToken: 'token',
    )).create());
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuAppController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Admin Panel',
        navigatorKey: injector<ServicesLocator>().navigatorKey,
        theme: lightTheme,
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English, no country code
          Locale('ar'), // Arabic, no country code
        ],
        routes: Routes.routes,
        initialRoute: Routes.dashboard,
      ),
    );
  }
}
