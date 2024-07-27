import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tachnic_pharma_equipments/module/customTextFeild.dart';
import 'package:tachnic_pharma_equipments/module/standaredButton/standaredButton.dart';
import 'package:tachnic_pharma_equipments/module/success_page/success_page.dart';
import 'package:tachnic_pharma_equipments/screens/forget_password/controller/controller.dart';
import 'package:tachnic_pharma_equipments/screens/forget_password/enter_code_page.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

class ForgetPasswordPage extends StatelessWidget {
   ForgetPasswordPage({super.key});

   var emailCon=TextEditingController();
   var controller=Get.put(ForgetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent,leading: BackButton(),),
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
                  Text("Forgot Password ?",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 22),),
                  SizedBox(height:10,),
                  Text("Enter your email to reset your password.",textAlign:TextAlign.center,style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 18,color: Color(0xFF747474)),),
                  SizedBox(height:20,),
                  CustomTextFeield(placeHolder: "Email", controller: emailCon, keyword: "email", icon: Icon(Icons.mail)),
                  SizedBox(height:30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: StandaredButton(onPress: (){
                      Get.to(SuccessPage(title: "Succeess", subtitle:"A code has been sent to your Email for verification",onPress: (){},autoNavigate: true,nextPage: EnterCodePage(),));
                    }, title: "Continue"),
                  ),
                ],
              ),
            ),
            Expanded(flex:1,child: Center())
          ],
        ),
      ),);
  }
}
