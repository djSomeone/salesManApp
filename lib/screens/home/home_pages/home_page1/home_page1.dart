import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tachnic_pharma_equipments/module/loading_shimmer/loading_shimmer.dart';
import 'package:tachnic_pharma_equipments/screens/home/home_pages/home_page1/controller/user_controller.dart';
import 'package:tachnic_pharma_equipments/screens/login_register/login/login_page.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';
import 'package:tachnic_pharma_equipments/utility/wrap_over_hive.dart';

import 'module/customTile.dart';

class HomePage1 extends StatelessWidget {
  var context;


  HomePage1(){

  }
  var userDataController=Get.put(UserDataController());




  @override
  Widget build(BuildContext context) {

    this.context = context;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // spacing
            SizedBox(
              height: 70,
            ),
            // header and logout icon
            SizedBox(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Obx(()=> Text(
                              "Hello, ${userDataController.userData.value.isEmpty?"Loading...":userDataController.userData.value["fullname"]}",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            )
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: SvgPicture.asset(
                                "assets/welcomePage/noto_waving-hand.svg"),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Your Shared Location Details",
                          style: GoogleFonts.poppins(color: Color(0xFF747474)),
                        ),
                      ),
                    ],
                  )),
                  GestureDetector(
                    onTap: onLogout,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                        Icons.exit_to_app_rounded,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            ),
            // main Section
            Expanded(child: Obx(()
            {
              try{


                return userDataController.isLoading.value?LoadingShimmer():userDataController.homePageData.value.isEmpty
                    ? emptyDataUi()
                    : dataListUi();
              }catch(e){
                Print.p("Exception");
                return emptyDataUi();

              }
            })),
          ],
        ),
      ),
    );
  }

  Widget emptyDataUi() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset("assets/welcomePage/empty.svg"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Nothing to show here at the moment.",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF747474)),
            ),
          )
        ],
      ),
    );
  }

  Widget dataListUi() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        var data=userDataController.homePageData.value;
        return CustomTile(address:data[index]["address"],imagePath: data[index]["image"],dateTime: data[index]["createdAt"],title: data[index]["title"],);
      },
      itemCount: userDataController.homePageData.value.length,
    );
  }

  void onLogout() async{

    showDialog(
        context: context,
        builder: (context) {
          return standaredAlertBox(
              title: "Log out",
              subTitle: "Are you sure you want to continue?",
              firstButtonColor: Color(0xFFDDDDDD),
              secoundButtonColor: StandaredColor.secoundary,
              onTapFirstButton: () {

                Get.back();
              },
              onTapSecoundButton: () async{
                standaredToast(msg: "Logout");
                var result=await logOut();
                if(result){
                  Print.p("before dispose");
                  Get.delete<UserDataController>();
                  Print.p("After dispose");
                  Get.offAll(LoginPage());
                }else{
                  standaredToast(msg: "Something went wrong while logout");
                }

              },
              textFirstButton: "No",
              textSecoundButton: "Yes");
        });
  }
}
