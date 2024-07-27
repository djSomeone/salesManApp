import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:tachnic_pharma_equipments/module/customTextFeild.dart';
import 'package:tachnic_pharma_equipments/module/standaredButton/standaredButton.dart';
import 'package:tachnic_pharma_equipments/module/success_page/success_page.dart';
import 'package:tachnic_pharma_equipments/screens/forget_password/change_password_page.dart';
import 'package:tachnic_pharma_equipments/screens/forget_password/controller/controller.dart';

import '../../utility/constants.dart';

class EnterCodePage extends StatelessWidget {
  EnterCodePage({super.key});

  ///  Otp pin Controller
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();
  var controller = Get.find<ForgetPasswordController>();

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

                    ///in case you want to enable autoFill
                    autoFillEnable: false,

                    ///for Ios it is not needed as the SMS autofill is provided by default, but not for Android, that's where this key is useful.
                    textInputAction: TextInputAction.done,

                    ///in case you want to change the action of keyboard
                    /// to clear the Otp pin Controller
                    onSubmit: (text) {
                      print('Entered pin is $text');

                      // controller.reConstruct(text);

                      /// return the entered pin
                    },
                    onChange: (text) {
                      print('Enter on change pin is $text');
                      controller.setCode(text);

                      /// return the entered pin
                    },

                    /// to decorate your Otp_Pin_Field
                    otpPinFieldStyle: OtpPinFieldStyle(
                      fieldPadding: 20,
                      fieldBorderRadius: 20,

                      /// border color for inactive/unfocused Otp_Pin_Field
                      defaultFieldBorderColor: Colors.grey,

                      /// border color for active/focused Otp_Pin_Field
                      activeFieldBorderColor: Colors.black,

                      /// Background Color for inactive/unfocused Otp_Pin_Field
                      // defaultFieldBackgroundColor: Colors.grey.withOpacity(0.7),

                      /// Background Color for active/focused Otp_Pin_Field
                      // activeFieldBackgroundColor: Colors.grey.withOpacity(0.7),

                      /// Background Color for filled field pin box
                      filledFieldBackgroundColor: Colors.grey.withOpacity(0.3),

                      /// border Color for filled field pin box
                      filledFieldBorderColor: Colors.black,
                      //
                      /// gradient border Color for field pin box
                      // fieldBorderGradient: LinearGradient(colors: [Colors.black, Colors.redAccent]),
                    ),
                    maxLength: 4,

                    /// no of pin field
                    showCursor: true,

                    /// bool to show cursor in pin field or not
                    cursorColor: Colors.black,

                    /// to choose cursor color

                    ///bool which manage to show custom keyboard
                    // showCustomKeyboard: true,
                    /// Widget which help you to show your own custom keyboard in place if default custom keyboard
                    // customKeyboard: Container(),
                    ///bool which manage to show default OS keyboard
                    // showDefaultKeyboard: true,

                    /// to select cursor width
                    cursorWidth: 1,

                    /// place otp pin field according to yourself
                    mainAxisAlignment: MainAxisAlignment.center,

                    autoFocus: false,

                    /// predefine decorate of pinField use  OtpPinFieldDecoration.defaultPinBoxDecoration||OtpPinFieldDecoration.underlinedPinBoxDecoration||OtpPinFieldDecoration.roundedPinBoxDecoration
                    ///use OtpPinFieldDecoration.custom  (by using this you can make Otp_Pin_Field according to yourself like you can give fieldBorderRadius,fieldBorderWidth and etc things)
                    otpPinFieldDecoration:
                        OtpPinFieldDecoration.defaultPinBoxDecoration,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: StandaredButton(
                        onPress: () {
                          Get.to(ChangePasswordPage());
                        },
                        title: "Continue"),
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
}
