import 'package:get/get.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';



class LoginFormController extends GetxController
{
  RxMap data=RxMap({"gender": "male"});
  RxString gender="Male".obs;
  RxString dob="YY/MM/DD".obs;
  RxBool isCheckedPrivacy=false.obs;


  void addData(String key,String value)
  {
    var lastMap=data.value;
    Print.p(value.length.toString());
    if(value.length==0){
      data.value.remove(key);
    }
   else{
      lastMap.addIf(true, key, value);
      data.value = lastMap;
    }
    Print.p("After updating data");
    Print.p(data.value.toString());
  }

  void setGender(String value){
    gender.value=value;
    Print.p(data.value.toString());
  }
  void setDob(String value){
    dob.value=value;
    Print.p(data.value.toString());
  }
  void resetController(){
    data.value.clear();
    gender.value="male";
    dob.value="YY/MM/DD";
    Print.p(data.value.toString());
  }
  void setPrivacyPolicy(bool x){

    isCheckedPrivacy.value=x;
    // Print.p(isCheckedPrivacy.value.toString());
  }
}