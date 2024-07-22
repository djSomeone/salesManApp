import 'package:get/get.dart';

import '../../../utility/constants.dart';

class ForgetPasswordController extends GetxController
{
  RxString code="".obs;

  void setCode(String newValue)
  {
    code.value=newValue;
    Print.p("New value :${code.value}");
  }
}