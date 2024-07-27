import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tachnic_pharma_equipments/api/response_structure.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

class Api {
  static var dio = Dio();
  static String endPoint = "https://technic-farma-backend.vercel.app/";

  static String loginEndPoint = "user/login";
  static String registrationEndPoint = "user/register";

  // login api calling
  static Future<Map<String, dynamic>?> login(
      {required String email, required String password}) async {
    Print.p("in Login api ");
    try {
      var finalPath;
      finalPath = "$endPoint$loginEndPoint";
      // Print.p(finalPath);
      var data = {"email": email.toString(), "password": password.toString()};
      Response res = await dio.post(finalPath, data: data);
      return ResponseStructure.toResponseStructure(res);
      // await Future.delayed(Duration(seconds: 3),(){
      //   Print.p("After 3secound call back function");
      // });
    } catch (e) {
      Print.p("Some thing went wrong in login");
      Print.p("Exception:${e.toString()}");
    }
  }

  // registeration api call
  static Future<Map<String, dynamic>?> registerUser({
    required String fullName,
    required String password,
    required String phoNo,
    required String gender,
    required String dob,
    required String email,
  }) async {
    Print.p("in registered api ");
    try {
      var finalPath;
      finalPath = "$endPoint$registrationEndPoint";
      var data = {
        "email": "sn.com",
        "password": "123",
        "fullname": "Sonal mishra",
        "gender": "Female",
        "phonenumber": "9124608530",
        "dob": "2024/07/27"
      };
      Response res = await dio.post(finalPath, data: data);
      return ResponseStructure.toResponseStructure(res);
      // await Future.delayed(Duration(seconds: 3),(){
      //   Print.p("After 3secound call back function");
      // });
    } catch (e) {

      Print.p("Some thing went wrong in register");
      Print.p("Exception:${e.toString()}");
    }
  }
}
