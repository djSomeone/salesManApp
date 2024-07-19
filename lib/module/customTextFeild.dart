import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tachnic_pharma_equipments/screens/login_register/login/controller.dart';

import '../utility/constants.dart';
// import 'package:onboarding_app/Screens/form/controller/controller.dart';
// import 'package:onboarding_app/utility/constant.dart';

class CustomTextFeield extends StatelessWidget {

  var placeHolder;
  var keyBoardType;

  TextEditingController controller;
  var maxline;
  var maxlength;
  var keyword;
  var icon;
  bool isRreadOnly;
  bool isSuffuix;
  bool isDatepicker;

  CustomTextFeield(
      {
        required this.placeHolder,
        this.keyBoardType = TextInputType.text,
        required this.controller,
        this.maxline = 1,
        this.maxlength = 50,
        required this.keyword,
        required this.icon,
        this.isRreadOnly=false,
        this.isSuffuix=false,
        this.isDatepicker=false



      });

  var formController = Get.find<LoginFormController>();
  var _debounce;
  var context;
  @override
  Widget build(BuildContext context) {
    this.context=context;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Obx(
        ()=> Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 0,width: 0,child: Text(formController.data.value.toString()),),

             TextFormField(
                onTap: isDatepicker?datePickerOnTap:isRreadOnly?onTap:null,
                onChanged: isRreadOnly?null:_handleTextChanged,
                controller: controller,
                maxLines: maxline,
                maxLength: maxlength,
                keyboardType: keyBoardType,
                readOnly: isRreadOnly,
                style: GoogleFonts.poppins(fontSize: 14),

               decoration: InputDecoration(

                  filled: true, // Enables background color
                  fillColor: Colors.grey.withOpacity(0.2),
                  prefixIcon: icon,
                  suffixIcon: isSuffuix?Icon(Icons.keyboard_arrow_down_sharp):null,
                  counterText: "",
                  hintText: isDatepicker?"Date of Birth   ${formController.dob.value}":(isRreadOnly)?formController.gender.value:placeHolder,
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

          ],
        ),
      ),
    );
  }
  //
  void _handleTextChanged(String x) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      // Perform your delayed action here with the current text
      formController.addData(keyword,x.toString());
    });
  }

  void onTap()async{
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title:  Obx(
          ()=> Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('Select Gender:',style: GoogleFonts.poppins(fontSize: 24),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio<String>(
                  value: 'male',
                  groupValue: formController.gender.value,
                  onChanged: (value) {
                    formController.setGender(value!);
                    formController.addData(keyword,value.toString());
                  }
                  ,
                ),
                Text('Male',style: GoogleFonts.poppins(fontSize: 18),),
                SizedBox(width: 10.0), // Add spacing between elements
                Radio<String>(
                  value: 'female',
                  groupValue: formController.gender.value,
                  onChanged: (value) {
                  formController.setGender(value!);
                    formController.addData(keyword,value.toString());
                  },
                ),
                Text('Female',style: GoogleFonts.poppins(fontSize: 18),),
              ],
            ),
                ]),
        ));
    });
  }

  void datePickerOnTap()async{
    var pickeDate=await showDatePicker(context: context, firstDate: DateTime(1990), lastDate: DateTime(DateTime.now().year));
    var formattedDate=pickeDate!.toString().split(" ")[0].replaceAll("-", "/");
    formController.setDob(formattedDate);
    formController.addData(keyword, formattedDate);
    Print.p(pickeDate!.toString().split(" ")[0].replaceAll("-", "/"));
  }

}
