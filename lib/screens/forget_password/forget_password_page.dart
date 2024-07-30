import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tachnic_pharma_equipments/api/api.dart';
import 'package:tachnic_pharma_equipments/module/customTextFeild.dart';
import 'package:tachnic_pharma_equipments/module/standaredButton/standaredButton.dart';
import 'package:tachnic_pharma_equipments/module/success_page/success_page.dart';
import 'package:tachnic_pharma_equipments/screens/forget_password/controller/controller.dart';
import 'package:tachnic_pharma_equipments/screens/forget_password/enter_code_page.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({super.key});

  var emailCon = TextEditingController();
  var controller = Get.put(ForgetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Forgot Password ?",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Enter your email to reset your password.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Color(0xFF747474)),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    controller: emailCon,
                    keyboardType: TextInputType.emailAddress,
                    maxLength: 60,
                    style: GoogleFonts.poppins(fontSize: 14),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      filled: true, // Enables background color
                      fillColor: Colors.grey.withOpacity(0.1),
                      counterText: "",
                      hintText: "Email",
                      hintStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),

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
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child:
                        StandaredButton(onPress: onContinue, title: "Continue"),
                  ),
                ],
              ),
            ),
            Expanded(flex: 1, child: Center())
          ],
        ),
      ),
    );
  }

  void onContinue() async{
    var email=emailCon.text;
    // if there is email
    if(email!=null){
      // if email vaild
      if(isEmail(email)){
       Print.p("email vailed");
       var result=await Api.forgetPassword(email: email);
       // if there is result
       if(result!=null)
         {
           Print.p(result.toString());
           if(result["status"]==200){
             standaredToast(msg: "successfully sent email");
             Get.off(SuccessPage(
               title: "Succeessful",
               subtitle: "A code has been sent to your Email for verification",
               onPress: () {},
               autoNavigate: true,
               nextPage: EnterCodePage(email: email,),
             ));
           }
           else{
             standaredToast(msg: "failed to sent email");
           }

         }
       else{
         standaredToast(msg: "Something went wrong");
       }
      }
      else{
        standaredToast(msg: "Invalid mail ID");
      }
    }

  }

  bool isEmail(String email) {
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }
}
