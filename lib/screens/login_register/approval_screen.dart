import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tachnic_pharma_equipments/module/standaredButton/standaredButton.dart';
import 'package:tachnic_pharma_equipments/module/success_page/success_page.dart';
import 'package:tachnic_pharma_equipments/screens/home/home_page.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

class Approval_Screen extends StatelessWidget {
  const Approval_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex:8,child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height:200,
                      width: 200,
                      child: SvgPicture.asset("assets/panding.svg")),
                  Text("Approval Pending",style: GoogleFonts.poppins(fontWeight: FontWeight.w700,fontSize: 22),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Text(textAlign: TextAlign.center,"The admin will review your profile and approve your entry.",style: GoogleFonts.poppins(color:Color(0xFF747474),fontWeight: FontWeight.w400,fontSize: 16),),
                  )
                ],
              ),
            )),
            Expanded(flex:2,child: Column(
              children: [
                StandaredButton(onPress: (){
                  Get.offAll(SuccessPage(
                    title: "Registration Completed",
                    subtitle:
                        "Registration details have been sent to admin.Please come back later.",
                    onPress: (){
                      Get.offAll(HomePage());
                    },
                  ));
                }, title: "Refresh"),
              ],
            )),
          ],

        ),
      ),);
  }
}
