import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weathers/controllers/login_controller.dart';
import 'package:weathers/utils/colors.dart';
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

  // This widget is the root of your application.
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
            home: IsSignedIn(),
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

// class MainPage extends StatelessWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(
//                   backgroundColor: AppColors.pRIMARYCOLOR),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text("Something went Wrong"),
//             );
//           } else if (snapshot.hasData) {
//             return HomePage();
//           } else {
//             return LoginScreen();
//           }
//         },
//       ),
//     );
//   }
// }
// /*
//  * Copyright Copenhagen Center for Health Technology (CACHET) at the
//  * Technical University of Denmark (DTU).
//  * Use of this source code is governed by a MIT-style license that can be
//  * found in the LICENSE file.
//  */

// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:io';
// import 'package:geolocator/geolocator.dart';

// void main() => runApp(WeatherApp());

// class WeatherApp extends StatefulWidget {
//   @override
//   _WeatherAppState createState() => _WeatherAppState();
// }

// class _WeatherAppState extends State<WeatherApp> {
//   int temperature = 0;
//   String location = 'San Francisco';
//   int woeid = 2487956;
//   String weather = 'clear';
//   String abbreviation = '';
//   String errorMessage = '';

//   final Future<Position> geolocator =
//       Geolocator.getCurrentPosition(forceAndroidLocationManager: true);

//   late Position _currentPosition;
//   late String _currentAddress;

//   String searchApiUrl =
//       'https://www.metaweather.com/api/location/search/?query=';
//   String locationApiUrl = 'https://www.metaweather.com/api/location/';

//   initState() {
//     super.initState();
//     fetchLocation();
//   }

//   void fetchSearch(String input) async {
//     try {
//       var searchResult = await http.get(Uri.parse(searchApiUrl + input));
//       var result = json.decode(searchResult.body)[0];

//       setState(() {
//         location = result["title"];
//         woeid = result["woeid"];
//         errorMessage = '';
//       });
//     } catch (error) {
//       setState(() {
//         errorMessage =
//             "Sorry, we don't have data about this city. Try another one.";
//       });
//     }
//   }

//   void fetchLocation() async {
//     var locationResult =
//         await http.get(Uri.parse(locationApiUrl + woeid.toString()));
//     var result = json.decode(locationResult.body);
//     var consolidated_weather = result["consolidated_weather"];
//     var data = consolidated_weather[0];

//     setState(() {
//       temperature = data["the_temp"].round();
//       weather = data["weather_state_name"].replaceAll(' ', '').toLowerCase();
//       abbreviation = data["weather_state_abbr"];
//     });
//   }

//   void onTextFieldSubmitted(String input) async {
//     fetchSearch(input);
//     fetchLocation();
//   }

//   _getCurrentLocation() async {
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.low);
//     // .then((Position position) {
//     setState(() {
//       _currentPosition = position;
//     });

//     _getAddressFromLatLng();
//     // }).catchError((e) {
//     //   print(e);
//     // });
//   }

//   _getAddressFromLatLng() async {
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(
//           _currentPosition.latitude, _currentPosition.longitude);

//       Placemark place = placemarks[0];

//       setState(() {
//         _currentAddress =
//             "${place.locality}, ${place.postalCode}, ${place.country}";
//       });
//       onTextFieldSubmitted(place.locality!);
//       print(place.locality);
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Container(
//           decoration: BoxDecoration(
//             // image: DecorationImage(
//             //   image: AssetImage('images/$weather.png'),
//             //   fit: BoxFit.cover,
//             // ),
//           ),
//           child: temperature == null
//               ? Center(child: CircularProgressIndicator())
//               : Scaffold(
//                   appBar: AppBar(
//                     actions: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.only(right: 20.0),
//                         child: GestureDetector(
//                           onTap: () {
//                             _getCurrentLocation();
//                           },
//                           child: Icon(Icons.location_city, size: 36.0),
//                         ),
//                       )
//                     ],
//                     backgroundColor: Colors.transparent,
//                     elevation: 0.0,
//                   ),
//                   resizeToAvoidBottomInset: false,
//                   backgroundColor: Colors.transparent,
//                   body: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Column(
//                         children: <Widget>[
//                           Center(
//                             child: Image.network(
//                               'https://www.metaweather.com/static/img/weather/png/' +
//                                   abbreviation +
//                                   '.png',
//                               width: 100,
//                             ),
//                           ),
//                           Center(
//                             child: Text(
//                               temperature.toString() + ' °C',
//                               style: TextStyle(
//                                   color: Colors.white, fontSize: 60.0),
//                             ),
//                           ),
//                           Center(
//                             child: Text(
//                               location,
//                               style: TextStyle(
//                                   color: Colors.white, fontSize: 40.0),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: <Widget>[
//                           Container(
//                             width: 300,
//                             child: TextField(
//                               onSubmitted: (String input) {
//                                 onTextFieldSubmitted(input);
//                               },
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 25),
//                               decoration: InputDecoration(
//                                 hintText: 'Search another location...',
//                                 hintStyle: TextStyle(
//                                     color: Colors.white, fontSize: 18.0),
//                                 prefixIcon:
//                                     Icon(Icons.search, color: Colors.white),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.only(right: 32.0, left: 32.0),
//                             child: Text(errorMessage,
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Colors.redAccent,
//                                     fontSize:
//                                         Platform.isAndroid ? 15.0 : 20.0)),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 )),
//     );
//   }
// }
