import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tachnic_pharma_equipments/module/customTextFeild.dart';
import 'package:tachnic_pharma_equipments/screens/forget_password/forget_password_page.dart';
import 'package:tachnic_pharma_equipments/screens/login_register/login/controller.dart';
import 'package:tachnic_pharma_equipments/screens/login_register/register/register_screen.dart';

import 'package:tachnic_pharma_equipments/utility/constants.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  var subHeaderStyle =
      GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16);
  var headerStyle =
      GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700);
  var controller = Get.put(LoginFormController());
  var emailCon = TextEditingController();
  var passCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex:3,child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Hello there,",
                          style: subHeaderStyle,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Welcome Back",
                          style: headerStyle,
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        CustomTextFeield(
                            icon: Icon(
                              Icons.email_outlined,
                              size: 16,
                            ),

                            placeHolder: "Email",
                            controller: emailCon,
                            keyword: "email"),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextFeield(
                            icon: Icon(
                              Icons.lock_outline,
                              size: 16,
                            ),

                            placeHolder: "Password",
                            controller: passCon,
                            keyword: "password"),
                        SizedBox(
                          height: 24,
                        ),
                        GestureDetector(
                          onTap: (){
                            Print.p("forgetPassword");
                            Get.to(ForgetPasswordPage());
                          },
                          child: Container(
                            child: Text("Forgot your password?",
                                style: GoogleFonts.poppins(
                                  decoration: TextDecoration.underline,
                                  color: Color(0xFF747474),
                                )),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            )),
            Expanded(
              flex:2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  standaredButton(onPress: () {}, title: "Login", height: 50),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Divider(),
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Or"),
                      ),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Divider(),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account yet?",
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                          onTap: () {
                            standaredToast("clicked");
                            Get.to(RegisterScreen());
                          },
                          child: Container(
                              child: Text("Register",
                                  style: GoogleFonts.poppins(
                                      color: Colors.blue)))),
                      SizedBox(height: 40,)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
