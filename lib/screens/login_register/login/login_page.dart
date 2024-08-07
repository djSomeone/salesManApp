import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tachnic_pharma_equipments/api/api.dart';
import 'package:tachnic_pharma_equipments/module/customTextFeild.dart';
import 'package:tachnic_pharma_equipments/module/standaredButton/standaredButton.dart';
import 'package:tachnic_pharma_equipments/screens/forget_password/forget_password_page.dart';
import 'package:tachnic_pharma_equipments/screens/home/home_page.dart';
import 'package:tachnic_pharma_equipments/screens/login_register/approval_screen.dart';
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
            Expanded(
                flex: 3,
                child: Center(
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
                                keyBoardType: TextInputType.emailAddress,
                                maxlength: 40,
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
                                maxlength: 40,
                                keyBoardType: TextInputType.visiblePassword,
                                keyword: "password"),
                            SizedBox(
                              height: 24,
                            ),
                            GestureDetector(
                              onTap: () {
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
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  StandaredButton(onPress: onLogin, title: "Login", height: 50),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Divider(),
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Or"),
                      ),
                      Expanded(
                          child: Padding(
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
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            standaredToast(msg: "clicked");
                            Get.to(RegisterScreen());
                          },
                          child: Container(
                              child: Text("Register",
                                  style: GoogleFonts.poppins(
                                      color: Colors.blue)))),
                      SizedBox(
                        height: 40,
                      )
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

  void onLogin() async {
    // Print.p("in inLoging");
    var email = controller.data.value["email"];
    var pass = controller.data.value["password"];
    var response;
    // if there is data
    if (email != null && pass != null) {
      // Print.p("call api");
      response = await Api.login(email: email, password: pass);
      // Print.p("after api method");
      if (response != null) {
        // Print.p(response.toString());

        var result = await localizeUserData(response["body"]);
        if (result) {
          if (response["body"]["isAdminApproved"]) {
            Get.offAll(HomePage());
          } else {
            Get.offAll(Approval_Screen());
          }
        } else {
          standaredToast(msg: "localize data where failed");
        }
        // Print.p(result.toString());
      } else {
        standaredToast(msg: "Invalid cradentials");
      }
      // Print.p(response);
      // if()
      // Print.p(email.toString());
      // Print.p(pass.toString());
    } else {
      Print.p("there is some issuse in data");
      standaredToast(msg: "Please fill all feiled ");
    }

    // var response = await Api.login("user@example.com", "password123");
    // if (response != null) {}
  }
}
