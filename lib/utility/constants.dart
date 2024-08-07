
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tachnic_pharma_equipments/utility/wrap_over_hive.dart';
// import 'package:tachnic_pharma_equipments/utility/standaredButton/controller/button_controller.dart';




// standared colors
class StandaredColor{
  static Color secoundary=Color(0xFFFF7C10);
  static Color primery=Color(0xFF106EB3);

}

// Wrap over the debugPrint method
class Print{
  static void p(String x){
    debugPrint("=================${x}====================");
  }
}

// this isfor the standared toast
Future<bool?> standaredToast({required String msg, bool isErrorMsg = false})
async
{
  return Fluttertoast.showToast(msg: msg,backgroundColor: Colors.grey,textColor: isErrorMsg?Color(0xFFED6366):Colors.white);
}

// this is standared Alter box designed
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

Future<bool> localizeUserData(Map<dynamic,dynamic> data)
async{
  try{

    WrapOverHive.setUserData("userData", data);
    Print.p("Successfully addeed  data into box");
    var get_data=await WrapOverHive.getUserData("userData");
    Print.p("After geting data");
    Print.p("type of data=>${get_data.runtimeType.toString()}");
    Print.p(" data=>${get_data.toString()}");
    return true;
  }
  catch(x){
    Print.p("Exception in  Localzation of Data=>${x.toString()}");
    return false;
  }

}

Future<bool> logOut()async{
  try{
    var result=await WrapOverHive.clearUserData();
    if(result)
      {
        return true;
      }
    return false;
  }catch(e){
    Print.p("Eception while logout method call");
    return false;
  }
}

