import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tachnic_pharma_equipments/api/api.dart';
import 'package:tachnic_pharma_equipments/module/success_page/success_page.dart';
import 'package:tachnic_pharma_equipments/screens/home/home_pages/home_page1/controller/user_controller.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

import '../../module/standaredButton/standaredButton.dart';

class ShareWithAdminPage extends StatelessWidget {
  String path;
  var context;
  ShareWithAdminPage({super.key, required this.path});
  var conTitle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return WillPopScope(
      onWillPop: onPop,
      child: Scaffold(
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
                            // standaredToast("Try again");
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)),
                      child: Image.file(
                        File(path),
                        fit: BoxFit.fill,
                      ),
                    )),
                    // space
                    SizedBox(
                      height: 20,
                    ),
                    // location title
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Location",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xFF747474)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // loocatin
                    TextFormField(
                      controller: conTitle,
                      keyboardType: TextInputType.text,
                      maxLength: 40,
                      style: GoogleFonts.poppins(fontSize: 14),
                      decoration: InputDecoration(
                        filled: true, // Enables background color
                        fillColor: Colors.grey.withOpacity(0.1),
                        counterText: "",
                        hintText: "Add Location Here",
                        hintStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),

                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xFFB9B9B9), width: 1),
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.5), width: 1),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
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
                    child: StandaredButton(
                        onPress: onShare, title: "Share with Admin"),
                  ))
            ],
          ),
        ),
      ),
    );
  }


  Future<bool> onPop() async {
    Print.p("try to pop me");
    // Print.p(x.toString());
    bool? shouldPop = await showDialog<bool>(
        context: context,
        builder: (context) {
          Print.p("in show dialog");
          return standaredAlertBox(
              title: "Discard",
              subTitle: "Once Discarded you will loose Draft",
              firstButtonColor: Color(0xFFDDDDDD),
              secoundButtonColor: Color(0xFFED6366),
              onTapFirstButton: () {
                Navigator.pop(context, false);
              },
              onTapSecoundButton: () async {
                Navigator.pop(context, true);
                // Navigator.pop(context);
              },
              textFirstButton: "Cancel",
              textSecoundButton: "Discard");
        });
    return shouldPop ?? false;
  }

  void onShare() async {
    Print.p((conTitle.text == "").toString());
    if (conTitle.text != "") {
      var result = await showDialog<bool>(
          context: context,
          builder: (context) => standaredAlertBox(
              title: "Share with Admin",
              subTitle: "Are you sure you want to continue?",
              firstButtonColor: Color(0xFFDDDDDD),
              secoundButtonColor: StandaredColor.secoundary,
              onTapFirstButton: () {
                Get.back(result: false);
              },
              onTapSecoundButton: onConfirmShare,
              textFirstButton: "No",
              textSecoundButton: "Yes"));
      Print.p("result=>$result");

      if (result!) {
        var result = await callApi();
        Print.p("reslut=>$result");
        if (result) {
          Print.p("in result");
          await Get.find<UserDataController>().setHomePageData();
          Get.off(SuccessPage(
              title: "Successful",
              subtitle:
                  "Your Location details have been Successfully Shared with the admin",
              onPress: () {
                Get.back();
              }));
        }
      } else {
        Print.p("do nothing ");
      }
    } else {
      standaredToast(msg: "Please fill Location");
    }
  }

  //
  void onConfirmShare() async {
    Get.back(result: true);
  }

  Future<bool> callApi() async {
    try {
      Position currentLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);


      var result = await Api.postCurrentLocationImage(
          imagePath: path,
          title: conTitle.text,
          lat: currentLocation.latitude,
          log: currentLocation.longitude,
          userId:
              Get.find<UserDataController>().userData.value["_id"].toString());
      if (result!["status"] == 200) {
        return true;
      }
      return false;
    } catch (e) {
      Print.p("exception in callApi");
      return false;
    }
  }
}
