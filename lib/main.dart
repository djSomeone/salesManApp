
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tachnic_pharma_equipments/screens/login_register/login/login_page.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

import 'api/api.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Api.dio.interceptors.add(PrettyDioLogger());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  WellcomePage(),
    );
  }
}

// this is the wellcome page

class WellcomePage extends StatefulWidget {
 WellcomePage();



  @override
  State<WellcomePage> createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  var headerTextStyle=GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w700);
  var subheaderTextStyle=GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF747474));




  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarColor(StandaredColor.primery);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark, // Adjust based on your app's background
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 30),
      child: Column(
        children: [
          Expanded(flex:4,child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 150,),
                SizedBox(height:120,width:240,child: Image.asset("assets/welcomePage/logo.png")),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Welcome to Technic Pharma",style: headerTextStyle,),
                      Text("Equipments Sales Hub",style: headerTextStyle,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text("Stay ahead with tracking, photos, meeting notes, and easy admin updates.",style: subheaderTextStyle,textAlign: TextAlign.center,),
                ),
              ],
            ),
          )),
          Expanded(child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                standaredButton(onPress: onPress, title: "Let’s Get Started"),
              ],
            ),
          )),
        ],
      ),
    ),);
  }
  void onPress()async{
    Get.off(LoginPage());
  }
}
