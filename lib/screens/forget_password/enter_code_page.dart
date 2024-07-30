import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:tachnic_pharma_equipments/api/api.dart';
import 'package:tachnic_pharma_equipments/module/customTextFeild.dart';
import 'package:tachnic_pharma_equipments/module/standaredButton/standaredButton.dart';
import 'package:tachnic_pharma_equipments/module/success_page/success_page.dart';
import 'package:tachnic_pharma_equipments/screens/forget_password/change_password_page.dart';
import 'package:tachnic_pharma_equipments/screens/forget_password/controller/controller.dart';

import '../../utility/constants.dart';

class EnterCodePage extends StatelessWidget {
  EnterCodePage({required this.email});

  ///  Otp pin Controller
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();
  var controller = Get.find<ForgetPasswordController>();
  var email;

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
                    "Enter Code",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Enter the code from the mail, we just sent you",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Color(0xFF747474)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OtpPinField(
                    key: _otpPinFieldController,
                    fieldHeight: 60,
                    autoFillEnable: false,
                    textInputAction: TextInputAction.done,
                    onSubmit: (text) {
                      print('Entered pin is $text');
                    },
                    onChange: (text) {
                      print('Enter on change pin is $text');
                      controller.setCode(text);
                    },
                    otpPinFieldStyle: OtpPinFieldStyle(
                      fieldPadding: 20,
                      fieldBorderRadius: 20,
                      defaultFieldBorderColor: Colors.grey,
                      activeFieldBorderColor: Colors.black,
                      filledFieldBackgroundColor: Colors.grey.withOpacity(0.3),
                      filledFieldBorderColor: Colors.black,
                    ),
                    maxLength: 4,
                    showCursor: true,
                    cursorColor: Colors.black,
                    cursorWidth: 1,
                    mainAxisAlignment: MainAxisAlignment.center,
                    autoFocus: false,
                    otpPinFieldDecoration:
                        OtpPinFieldDecoration.defaultPinBoxDecoration,
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

  void onContinue() async {
    Print.p((controller.code.value.length==4).toString());
    if(controller.code.value.length==4)
    {
    //  call api
      var result=await Api.verifyCode(email: email, code: controller.code.value.toString());
      // if there is data in result
      if(result!=null)
        {
          if(result["status"]==200)
          {
            Get.off(ChangePasswordPage(email: email));
          }else{
            standaredToast(msg: "Invalid code");
          }
        }
      else{
        standaredToast(msg: "Something went wrong while verificaton code");
      }
    }
    else{
      standaredToast(msg: "Please fill code");
    }
  }
}
