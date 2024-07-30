import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

import '../standaredButton/standaredButton.dart';

class SuccessPage extends StatelessWidget {
  var title;
  var subtitle;
  var onPress;
  bool autoNavigate;
  var nextPage;
  bool goBack;
  SuccessPage({required this.title, required this.onPress,this.subtitle = "",this.autoNavigate=false, this.nextPage="",this.goBack=false}){
    if(autoNavigate){
      Timer(Duration(seconds: 2), () {
        goBack?Get.back():Get.off(nextPage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
                flex: 8,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 26),
                        child: SizedBox(
                            height: 100,
                            width: 100,
                            child: SvgPicture.asset("assets/tepDone.svg")),
                      ),
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      subtitle == ""
                          ? SizedBox()
                          : Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                subtitle,
                                style: GoogleFonts.poppins(
                                    color: Color(0xFF747474),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                            )
                    ],
                  ),
                )),
            autoNavigate?Expanded(flex:3,child: SizedBox()):Expanded(
                flex: 3,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      StandaredButton(onPress: onPress, title: "Continue")
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
