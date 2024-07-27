import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tachnic_pharma_equipments/api/api.dart';
import 'package:tachnic_pharma_equipments/module/customTextFeild.dart';
import 'package:tachnic_pharma_equipments/module/success_page/success_page.dart';
import 'package:tachnic_pharma_equipments/screens/home/home_page.dart';
import 'package:tachnic_pharma_equipments/screens/login_register/approval_screen.dart';
import 'package:tachnic_pharma_equipments/screens/login_register/login/controller.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

import '../../../module/standaredButton/standaredButton.dart';

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

  var controller = Get.find<LoginFormController>();

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
              flex: 10,
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
                      // full name
                      CustomTextFeield(
                          icon: Icon(
                            Icons.person,
                            size: 20,
                          ),
                          placeHolder: "Full Name",
                          controller: fullnameCon,
                          keyBoardType: TextInputType.text,
                          keyword: "fullName"),
                      // phone no
                      CustomTextFeield(
                          icon: Icon(
                            Icons.call,
                            size: 20,
                          ),
                          placeHolder: "Phone Number",
                          maxlength: 10,
                          keyBoardType: TextInputType.number,
                          controller: phnoCon,
                          keyword: "phno"),
                      // gender
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
                      // dob
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
                      // email
                      CustomTextFeield(
                          icon: Icon(
                            Icons.email_outlined,
                            size: 20,
                          ),
                          placeHolder: "Email",
                          maxlength: 20,
                          keyBoardType: TextInputType.emailAddress,
                          controller: emailCon,
                          keyword: "email"),
                      // password
                      CustomTextFeield(
                          icon: Icon(
                            Icons.lock_outline,
                            size: 20,
                          ),
                          placeHolder: "Password",
                          maxlength: 8,
                          keyBoardType: TextInputType.visiblePassword,
                          controller: passCon,
                          keyword: "password"),
                      // confirm password
                      CustomTextFeield(
                          icon: Icon(
                            Icons.control_point_sharp,
                            size: 20,
                          ),
                          placeHolder: "Confirm Password",
                          controller: confCon,
                          maxlength: 8,
                          keyBoardType: TextInputType.visiblePassword,
                          keyword: "confirm"),
                      // widget for the checkbox for the privacy policy
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
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
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // bottom section
            Expanded(
              flex: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  StandaredButton(
                      onPress: onRegister, title: "Register", height: 50),
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
                            standaredToast(msg: "clicked");
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

  void onRegister() async {
    Print.p("we r in the registration method");
    List<String> keys = [
      "fullName",
      "phno",
      "gender",
      "dob",
      "email",
      "password",
      "confirm"
    ];
    var data = controller.data.value;
    var response;
    Print.p(controller.isCheckedPrivacy.value.toString());
    // if filled all fieled
    if (allKeysExist(data, keys)) {
      // if password matches with cnfirm pass
      if (data["password"] == data["confirm"]) {
        // check fr  the privacy plicy
        if (controller.isCheckedPrivacy.value) {
          // calling for api
          response = await Api.registerUser(
              fullName: data["fullName"],
              password: data["password"],
              phoNo: data["phno"],
              gender: data["gender"],
              dob: data["dob"],
              email: data["email"]);
          // if any exception
          if(response==null){
            standaredToast(msg: "Something went Wrong...");
          }else{
            Print.p("Registration done");
            // Print.p("data=>${response.toString()}");
          }

          // Print.p("all feiled are filled");
          // standaredToast(msg: "Done");
        } else {
          standaredToast(msg: "Please check privacy policy checkBox");
        }
      } else {
        standaredToast(
            msg: "confirm passwrod is not same as password", isErrorMsg: true);
      }
    } else {
      Print.p("Please Fill all feild");
      standaredToast(msg: "Please fill all feild");
    }
    Print.p("end of registration method");
    // Get.to(Approval_Screen());
  }

  bool allKeysExist(Map<dynamic, dynamic> map, List<String> keys) {
    bool isAllKeysExist = true;
    for (int i = 0; i < keys.length; i++) {
      if (!map.containsKey(keys[i])) {
        isAllKeysExist = false;
        break;
      }
    }
    return isAllKeysExist;
  }
}
