// this is the standared button used all over the project
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

import 'controller/button_controller.dart';

class StandaredButton extends StatelessWidget{
  VoidCallback onPress;
  String title;
  double height;
  StandaredButton({required this.onPress, required this.title,this.height=60});
  final controller = Get.put(ButtonController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  SizedBox(
      height: height,
      child: Obx(

            ()=> ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: StandaredColor.secoundary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
              // Set your desired color here
            ),
            onPressed: controller.isLoading.value?(){standaredToast( msg: "Loading...");}:() => controller.handleClick(onPress), // Use controller method


            child: Center(
              child:
              controller.isLoading.value?SizedBox(height:15,width: 15,child: CircularProgressIndicator(color:Colors.white,strokeWidth: 2,)):
              Text(title,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16,color: Colors.white),
              ),
            )),
      ),
    );
  }

}