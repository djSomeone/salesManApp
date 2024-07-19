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
