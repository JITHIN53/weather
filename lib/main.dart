import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weathers/views/home_screen.dart';
import 'package:weathers/views/login_screen.dart';
import 'package:weathers/views/sign_up_screen.dart';

import 'bindings/login_binding.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            initialBinding: InstanceBinding(),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home:const IsSignedIn(),
            routes: {
              // '/welcome':(context) => WelcomePage(),
              '/login': (context) => LoginScreen(),
              '/reg': (context) => SignUpScreen(),
              '/dashboard': (context) => HomePage(),
            },
            // theme: ThemeData(
            //   primarySwatch: Colors.blue,
            //   visualDensity: VisualDensity.adaptivePlatformDensity,
            // ),
          );
        }
        // initialRoute: '/',
        // getPages: [
        //   GetPage(
        //     name: '/',
        //     page: () => const MainPage(),
        //   ),
        //   GetPage(
        //     name: '/login',
        //     page: () => const LoginScreen(),
        //     binding: LoginBinding(),
        //   ),
        // ],
        );
    //   },
    // );
  }
}
