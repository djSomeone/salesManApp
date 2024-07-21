import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tachnic_pharma_equipments/module/success_page/success_page.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

class ShareWithAdminPage extends StatelessWidget {
  String path;
  ShareWithAdminPage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // for spacing
            SizedBox(
              height: 60,
            ),
            //for app bar
            Expanded(
                flex: 1,
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 26,
                        )),
                    Expanded(
                        child: Center(
                      child: Text(
                        "Share",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                    )),
                    Opacity(
                        opacity: 0.0,
                        child: Icon(
                          Icons.arrow_back,
                          size: 26,
                        ))
                  ],
                )),
            // Photo section
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  // photo
                  Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                                          clipBehavior: Clip.hardEdge,
                                          decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(16)),
                                          child: Image.file(
                      File(path),
                      fit: BoxFit.fill,
                                          ),
                                        )),
                  // space
                  SizedBox(height: 20,),
                  // loocatin
                  locationUi(add: "add",context: context)
                ],
              ),
            ),
            // for specing
            SizedBox(
              height: 50,
            ),
            // for button
            Expanded(
                flex: 2,
                child: Center(
                  child: standaredButton(
                      onPress: () {
                        showDialog(
                            context: context,
                            builder: (context) => standaredAlertBox(
                                title: "Share with Admin",
                                subTitle: "Are you sure you want to continue?",
                                firstButtonColor: Color(0xFFDDDDDD),
                                secoundButtonColor: StandaredColor.secoundary,
                                onTapFirstButton: () {
                                  Get.back();
                                },
                                onTapSecoundButton: () {
                                  Get.back();
                                  Get.off(SuccessPage(title: "Successful",subtitle: "Your Location details have been Successfully Shared with the admin", onPress: (){Get.back();}));
                                },
                                textFirstButton: "No",
                                textSecoundButton: "Yes"));
                      },
                      title: "Share with Admin"),
                ))
          ],
        ),
      ),
    );
  }

  Widget locationUi({required String add,required BuildContext context}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            "Location",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xFF747474)),
          ),
        ),
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), border: Border.all(color: Color(0xFFB9B9B9)),
          color:Color(0xFFF7F8F8)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(add,style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w400),),
              ],
            ),
          ),
        )
      ],
    );
  }
}
