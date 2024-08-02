import 'package:get/get.dart';
import 'package:tachnic_pharma_equipments/api/api.dart';
import 'package:tachnic_pharma_equipments/screens/home/home_pages/home_page1/controller/user_controller.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

import '../../../../../main.dart';

class NotesController extends GetxController{
  var data=RxList();
  var filtered=RxList();
  // var

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  Future<void> getData()
  async
  {
    try{
    var con=Get.find<UserDataController>();
    var userId=userData["_id"].toString();
    var result=await Api.fetchAllNotes(userId: userId);
    // there is some data we get
    if(result!=null){
      // on success
      if(result["status"]==200){
        data.value=result["body"];
        filtered.value=result["body"];

        Print.p(data.value.toString());
      }else{

      }

    }
    else{}


    }catch(e){
      Print.p("in getData() in  noteControlleeer=>${e.toString()}");
    }

  }

  void filterData(String searchKey){
    var f=filterListBySearchKey( searchKey);
    Print.p(f.toString());
    if(!f.isEmpty){
      filtered.value=f;
    }

  }
  // filtered data
  List filterListBySearchKey(

      String searchKey,
      ) {
    List fData=data.value.where((hospital) {
      // Lowercase both search string and hospital data for case-insensitive search
      final lowerSearchString = searchKey.trim().toLowerCase();
      final lowerHospitalData = hospital.values.join(' ').toLowerCase(); // Combine all values
      // print(lowerHospitalData);
      return lowerHospitalData.contains(lowerSearchString);
    }).toList();
    return fData;
  }
}