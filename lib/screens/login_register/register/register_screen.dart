import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tachnic_pharma_equipments/module/customTextFeild.dart';
import 'package:tachnic_pharma_equipments/module/success_page/success_page.dart';
import 'package:tachnic_pharma_equipments/screens/home/home_page.dart';
import 'package:tachnic_pharma_equipments/screens/login_register/login/controller.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var subHeaderStyle =
      GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16);

  var headerStyle =
      GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700);

  var controller = Get.put(LoginFormController());

  var emailCon = TextEditingController();

  var passCon = TextEditingController();

  var confCon = TextEditingController();

  var genderCon = TextEditingController();

  var phnoCon = TextEditingController();

  var fullnameCon = TextEditingController();

  var dobCon = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.resetController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 8,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Hello there,",
                        style: subHeaderStyle,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Create Account",
                        style: headerStyle,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFeield(
                          icon: Icon(
                            Icons.person,
                            size: 20,
                          ),
                          placeHolder: "Full Name",
                          controller: fullnameCon,
                          keyword: "fullName"),

                      CustomTextFeield(
                          icon: Icon(
                            Icons.call,
                            size: 20,
                          ),
                          placeHolder: "Phone Number",
                          controller: phnoCon,
                          keyword: "phno"),
                      CustomTextFeield(
                          isSuffuix: true,
                          isRreadOnly: true,
                          icon: Icon(
                            Icons.male,
                            size: 20,
                          ),
                          placeHolder: "Gender",
                          controller: genderCon,
                          keyword: "gender"),

                      CustomTextFeield(
                          isRreadOnly: true,
                          isDatepicker: true,
                          icon: Icon(
                            Icons.calendar_today_outlined,
                            size: 20,
                          ),
                          placeHolder: "Date of Birth     DD/MM/YY",
                          controller: dobCon,
                          keyword: "dob"),

                      CustomTextFeield(
                          icon: Icon(
                            Icons.email_outlined,
                            size: 20,
                          ),
                          placeHolder: "Email",
                          controller: emailCon,
                          keyword: "email"),

                      CustomTextFeield(
                          icon: Icon(
                            Icons.lock_outline,
                            size: 20,
                          ),
                          placeHolder: "Password",
                          controller: passCon,
                          keyword: "password"),

                      CustomTextFeield(
                          icon: Icon(
                            Icons.control_point_sharp,
                            size: 20,
                          ),
                          placeHolder: "Confirm Password",
                          controller: confCon,
                          keyword: "confirm"),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Obx(
                            () => Checkbox(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.red, // Set the border color
                                    width: 2.0, // Set the border width
                                  ),

                                  borderRadius: BorderRadius.circular(
                                      5.0), // Set the corner radius
                                ),
                                value: controller.isCheckedPrivacy.value,
                                onChanged: (newValue) {
                                  controller.setPrivacyPolicy(newValue!);
                                }),
                          ),
                          Expanded(
                              child: Text(
                            "By continuing you accept our Privacy Policy and Term of Use",
                            style:
                                GoogleFonts.poppins(color: Color(0xFF747474)),
                          ))
                        ],
                      )

                      // Row(children: [
                      //   Checkbox(value: true, onChanged: (e){}),
                      //   SizedBox(child: Text("By continuing you accept our Privacy Policy and Term of Use",maxLines: 2,))
                      // ],)
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  standaredButton(
                      onPress: () {
                        Get.off(SuccessPage(
                          title: "Registration Completed",
                          subtitle:
                              "Registration details have been sent to admin.Please come back later.",
                          onPress: (){
                            Get.offAll(HomePage());
                          },
                        ));
                      },
                      title: "Register",
                      height: 50),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Or"),
                      ),
                      Expanded(child: Divider())
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                      GestureDetector(
                          onTap: () {
                            standaredToast("clicked");
                            Get.back();
                          },
                          child: Container(
                              child: Text("Login",
                                  style: GoogleFonts.poppins(
                                      color: Colors.blue)))),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
