
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class ButtonController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Print.p("init ButtonController");
  }
  final isLoading = false.obs; // Observable boolean for button state

  void handleClick(dynamic onPressed) async {
    isLoading.value = true; // Show loading state
    await onPressed(); // Execute provided function
    isLoading.value = false; // Reset button state
  }
}

Widget standaredButton({required VoidCallback onPress, required String title,double height=60}) {
  final controller = Get.put(ButtonController());
  return SizedBox(
    height: height,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: StandaredColor.secoundary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
        // Set your desired color here
      ),
        onPressed: controller.isLoading.value?(){standaredToast( "Loading...");}:() => controller.handleClick(onPress), // Use controller method


        child: Center(
          child:
            controller.isLoading.value?SizedBox(height:15,width: 15,child: CircularProgressIndicator(color:Colors.grey,strokeWidth: 2,)):
            Text(title,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16,color: Colors.white),
          ),
        )),
  );
}

class StandaredColor{
  static Color secoundary=Color(0xFFFF7C10);
  static Color primery=Color(0xFF106EB3);

}

class Print{
  static void p(String x){
    debugPrint("=================${x}====================");
  }
}
Future<bool?> standaredToast(String msg)
async
{
  return Fluttertoast.showToast(msg: msg,backgroundColor: Colors.grey,textColor: Colors.white);
}

Widget standaredAlertBox(
    {required title,
      required subTitle,
      required firstButtonColor,
      required secoundButtonColor,
      required onTapFirstButton,
      required onTapSecoundButton,
      required textFirstButton,
      firstTextColor=Colors.black,
      secoundTextColor=Colors.white,
      required textSecoundButton}) {
  return AlertDialog(
    title: Text(title,style: GoogleFonts.poppins(fontWeight: FontWeight.w600),),
    content: Text(subTitle,style: GoogleFonts.poppins(),),
    actions: [
      GestureDetector(
        onTap: onTapFirstButton,
        child: Container(
          decoration: BoxDecoration(
              color: firstButtonColor, borderRadius: BorderRadius.circular(6)),
          height: 40,
          width: 100,
          child: Center(
            child: Text(
              textFirstButton,
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 14,fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
      SizedBox(width: 10,),
      GestureDetector(
        onTap: onTapSecoundButton,
        child: Container(
          decoration: BoxDecoration(
              color: secoundButtonColor,
              borderRadius: BorderRadius.circular(6)),
          height: 40,
          width: 100,
          child: Center(
            child: Text(
              textSecoundButton,
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 14,fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    ],
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
  );
}

