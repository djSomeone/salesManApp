import 'package:get/get.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';


class ButtonController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Print.p("init ButtonController");
  }
  final isLoading = false.obs; // Observable boolean for button state

  void handleClick(dynamic onPressed) async {
    setIsLoading(true);// Show loading state
    await onPressed(); // Execute provided function
    setIsLoading(false);// Reset button state
  }
  void setIsLoading(bool newValue)
  {
    if(newValue!=isLoading.value)
    {
      isLoading.value=newValue;
      Print.p("Setted isLoading value =>$newValue");
    }
  }
}