import 'package:dosa_wala/firebase_options.dart';
import 'package:dosa_wala/helpers/cart_helper.dart';
import 'package:dosa_wala/helpers/details_helper.dart';
import 'package:dosa_wala/helpers/home_page_helper.dart';
import 'package:dosa_wala/helpers/product_page_helper.dart';
import 'package:dosa_wala/services/manage_data.dart';
import 'package:dosa_wala/views/spalsh_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: HomePageHelper()),
              ChangeNotifierProvider.value(value: ManageData()),
              ChangeNotifierProvider.value(value: ProductPageHelper()),
              ChangeNotifierProvider.value(value: DetailsHelper()),
              ChangeNotifierProvider.value(value: CartHelper()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Dosa Wala',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const SplashScreen(),
            ),
          );
        });
  }
}
