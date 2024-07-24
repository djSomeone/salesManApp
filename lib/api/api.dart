import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tachnic_pharma_equipments/api/response_structure.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

class Api{
  static var dio=Dio();
  static String endPoint="https://technic-farma-backend.vercel.app/";

  static String loginEndPoint="user/login";

  static Future<Map<String, dynamic>> login(String email,String password)
  async{
    var finalPath;
    finalPath = "$endPoint$loginEndPoint";
    Print.p(finalPath);
    var data={
      "email":email.toString(),
      "password": password.toString()
    };
    Response res = await dio.post(finalPath, data: data);
    return ResponseStructure.toResponseStructure(res);
  }


}