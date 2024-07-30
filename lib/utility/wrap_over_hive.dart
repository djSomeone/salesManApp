import 'package:hive_flutter/hive_flutter.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

class WrapOverHive{
  static Future<Map?> getUserData(String key)
  async{

    var box=await initUser();
    var data=await box.get(key);
    return data;
  }
  static Future<bool> setUserData(String key,Map<dynamic,dynamic> data)
  async{
    try{
      var box=await initUser();
      await box.put(key, data);
      return true;
    }
    catch(e)
    {
      Print.p("Exception while calling setUserData");
      return false;
    }
  }
  static Future<Box> initUser()async{
    await Hive.openBox<Map<dynamic, dynamic>>("User");
    var box=Hive.box<Map<dynamic, dynamic>>("User");
    return box;
  }

  static Future<bool> clearUserData()
  async
  {
   try {
      var box = await initUser();
      await box.clear();
      return true;
    }
    catch(e){
     Print.p("exception while clearing user data");
     return false;
    }
  }

}