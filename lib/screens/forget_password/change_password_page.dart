import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../module/success_page/success_page.dart';
import '../../utility/constants.dart';
import 'enter_code_page.dart';

class ChangePasswordPage extends StatelessWidget {
   ChangePasswordPage({super.key});

  var newPassCon=TextEditingController();
  var conPassCon=TextEditingController();

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
                      onTap: (){},
                      onChanged: (x){},
                      controller: newPassCon,
                      keyboardType: TextInputType.visiblePassword,
                      style: GoogleFonts.poppins(fontSize: 14),

                      decoration: InputDecoration(

                        filled: true, // Enables background color
                        fillColor: Colors.grey.withOpacity(0.1),
                        prefixIcon: Icon(Icons.lock_outline),
                        counterText: "",
                        hintText: "New Password",
                        hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),

                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFB9B9B9),width:1),
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder:
                        OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black.withOpacity(0.5),width:1),
                            borderRadius: BorderRadius.circular(15)),
                      ),

                    ),
                  ),
                  TextFormField(
                    onTap: (){},
                    onChanged: (x){},
                    controller: conPassCon,
                    keyboardType: TextInputType.visiblePassword,
                    style: GoogleFonts.poppins(fontSize: 14),

                    decoration: InputDecoration(

                      filled: true, // Enables background color
                      fillColor: Colors.grey.withOpacity(0.1),
                      prefixIcon: Icon(Icons.done),
                      counterText: "",
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),

                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFB9B9B9),width:1),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder:
                      OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black.withOpacity(0.5),width:1),
                          borderRadius: BorderRadius.circular(15)),
                    ),

                  ),
                  // button
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: standaredButton(
                        onPress: () {
                          Get.to(SuccessPage(title: "Succeess", subtitle:"Your Password has been changed successfully.",onPress: (){},autoNavigate: true,nextPage: EnterCodePage(),));
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
    );;
  }
}
