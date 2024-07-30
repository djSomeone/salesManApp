import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tachnic_pharma_equipments/module/standaredButton/standaredButton.dart';

import '../../api/api.dart';
import '../../module/success_page/success_page.dart';
import '../../utility/constants.dart';
import 'enter_code_page.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({required this.email});
  var email;

  var newPassCon = TextEditingController();
  var conPassCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Change Password",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: TextFormField(
                      controller: newPassCon,
                      keyboardType: TextInputType.visiblePassword,
                      style: GoogleFonts.poppins(fontSize: 14),
                      maxLength: 40,
                      decoration: InputDecoration(
                        filled: true, // Enables background color
                        fillColor: Colors.grey.withOpacity(0.1),
                        prefixIcon: Icon(Icons.lock_outline),
                        counterText: "",
                        hintText: "New Password",

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
                  ),
                  TextFormField(
                    onTap: () {},
                    onChanged: (x) {},
                    controller: conPassCon,
                    keyboardType: TextInputType.visiblePassword,
                    style: GoogleFonts.poppins(fontSize: 14),
                    maxLength: 40,
                    decoration: InputDecoration(
                      filled: true, // Enables background color
                      fillColor: Colors.grey.withOpacity(0.1),
                      prefixIcon: Icon(Icons.done),
                      counterText: "",
                      hintText: "Confirm Password",
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
                  // button
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: StandaredButton(
                        onPress: onContinue,
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

  void onContinue() async {
    var pass = newPassCon.text;
    if (pass == conPassCon.text) {
      var result = await Api.resetPassword(email: email, newPass: pass);
      if (result != null) {
        if (result["status"] == 200) {
          Get.off(SuccessPage(
            title: "Succeess",
            subtitle: "Your Password has been changed successfully.",
            onPress: () {},
            autoNavigate:true,
            goBack: true,
          ));
        } else {
          Print.p("other then 200 on reset password response");
        }
      } else {
        standaredToast(msg: "Something went wrong");
      }
    } else {
      standaredToast(msg: "Confirm password not match with new password");
    }
  }
}
