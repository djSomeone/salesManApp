import 'package:hive_flutter/hive_flutter.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

class WrapOverHive{
  static Future<Map?> getUserData(String key)
  async{

    var box=await initUser();
    var data=await box["user"].get(key);
    return data;
  }
  static Future<bool> setUserData(String key,Map<dynamic,dynamic> data)
  async{
    try{
      var box=await initUser();
      await box["user"].put(key, data);
      return true;
    }
    catch(e)
    {
      Print.p("Exception while calling setUserData");
      return false;
    }
  }

  static Future<Map<String,dynamic>> initUser()async{
    await Hive.openBox<Map<dynamic, dynamic>>("User");
    var box=Hive.box<Map<dynamic, dynamic>>("User");
    await Hive.openBox<Map<dynamic, dynamic>>("Note");
    var note=Hive.box<Map<dynamic, dynamic>>("Note");
    return {"user":box,"nots":note};
  }

  static Future<bool> clearUserData()
  async
  {
   try {
      var box = await initUser();
      await box["user"].clear();
      return true;
    }
    catch(e){
     Print.p("exception while clearing user data");
     return false;
    }
  }

}