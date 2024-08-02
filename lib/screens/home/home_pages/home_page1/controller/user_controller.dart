import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tachnic_pharma_equipments/api/api.dart';
import 'package:tachnic_pharma_equipments/screens/home/home_pages/home_page2/controller/notesController.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';
import 'package:tachnic_pharma_equipments/utility/wrap_over_hive.dart';

class UserDataController  extends GetxController{
  var userData=RxMap<dynamic,dynamic>();
  var homePageData=RxList<dynamic>();
  var isLoading=true.obs;
  late StreamSubscription<Position> _positionSubscription;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setUserData();


  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    Print.p("closed the usercntroller");
    _positionSubscription.cancel();
  }
  void setIsLoading(bool newValue)
  {
    if(isLoading.value!=newValue){
      isLoading.value = newValue;
    }
  }
  // getting data fromhive
  Future<void> setUserData()async{
    var result=await WrapOverHive.getUserData("userData");
    initializeTracking();

    if(result!=null){
      userData.value = result;
      await setHomePageData();
      // becuse we need user data and then i call  noteController

    }
    else{
      Print.p("Exception:setUserData()");
    }
  }
  // getting the previous posts
  Future<void> setHomePageData()
  async{
    Print.p("in setHomePageData");
    try{
      setIsLoading(true);
      var userDataController = Get.find<UserDataController>();
      Print.p(userDataController.userData.value.toString());
      var result =
          await Api.fetchAllPosts(id: userDataController.userData.value["_id"]);
      if (result != null) {
        homePageData.value = result["body"];
      } else {
        // standaredToast(msg: "")
        Print.p("Exception in setHomePageData()");
      }
      setIsLoading(false);
    }catch(e){
      Print.p("Exception=>${e.toString()}");
      setIsLoading(false);
    }
  }

  Future<void> initializeTracking()async{
    Print.p("initilize the tracking");

    // this isforthe updating current location in app as well as server
      try  {
      if (await requestLocationPermission()) {
        _positionSubscription = Geolocator.getPositionStream(
                locationSettings: LocationSettings(
                    accuracy: LocationAccuracy.high, distanceFilter: 1))
            .listen((newPosition) {
          Print.p(
              "new Position=Lat=${newPosition.latitude}==Lng==${newPosition.longitude}");
          Print.p("userdata");
          Print.p(userData.value.toString());
          Api.updateLocation(
              id: userData.value["_id"],
              lat: newPosition.latitude,
              log: newPosition.longitude);
        }, onError: (error) {
          Print.p("Error getting location: $error");
        });
      }

    }catch(x){
        Print.p("in initTracking=.${x.toString()}");
      }
  }

  // requesting permission
  Future<bool> requestLocationPermission() async {

    var status=await Permission.location.status;
 while(status.isDenied){
   Print.p("in requestLocationParmission");
   status = await Permission.location.request();
 }
    if (status.isGranted) {
      return true;
    } else {
      return false;
    }
  }
}