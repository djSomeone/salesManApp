import 'dart:io';

import 'package:dio/dio.dart';


import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tachnic_pharma_equipments/api/response_structure.dart';
import 'package:tachnic_pharma_equipments/screens/home/home_pages/home_page1/controller/user_controller.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

class Api {
  static var dio = Dio();
  static String endPoint = "https://technic-farma-backend.vercel.app/";

  static String loginEndPoint = "user/login";
  static String registrationEndPoint = "user/register";
  static String checkIsApprovedEndPoint = "user/check-admin-approval";
  static String fetchAllPostEndPoint = "user/get-salesman-by-id";
  static String updateLocationEndPoint = "user/update-location";
  static String postEndPoint = "user/salesman-add";
  // forget password
  static String forgetPasswordEndPoint = "user/forgot-password";
  static String verifyCodeEndPoint = "user/verify-code";
  static String resetPassEndPoint = "user/reset-password";
  // notes
  static String createNotesEndPoint = "user/write-notes";
  static String fetchAllNotesEndPoint = "user/get-notes-by-id";
  static String editNoteEndPoint = "user/update-notes";
  static String deleteNoteEndPoint = "user/delete-notes";



  // login api calling
  static Future<Map<String, dynamic>?> login(
      {required String email, required String password}) async {
    Print.p("in login ###");
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
      // Print.p("Some thing went wrong in login");
      Print.p("Exception:${e.toString()}");
      // standaredToast(msg: "Something went wrong...");
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
        "email": email,
        "password": password,
        "fullname": fullName,
        "gender": gender,
        "phonenumber": phoNo,
        "dob": dob
      };
      Response res = await dio.post(finalPath, data: data);
      return ResponseStructure.toResponseStructure(res);
      // await Future.delayed(Duration(seconds: 3),(){
      //   Print.p("After 3secound call back function");
      // });
    } catch (e) {

      Print.p("Some thing went wrong in register");
      Print.p("Exception:${e.toString()}");
      standaredToast(msg: "Something went wrong...");
    }
  }

//   this is the check admin approval api
  static Future<Map<String, dynamic>?> checkApproval(
      {required String email}) async {
    // Print.p("in Login api ");
    try {
      var finalPath;
      finalPath = "$endPoint$checkIsApprovedEndPoint";

      Response res = await dio.post("${finalPath}?email=${email}");
      return ResponseStructure.toResponseStructure(res);
      // await Future.delayed(Duration(seconds: 3),(){
      //   Print.p("After 3secound call back function");
      // });
    } catch (e) {
      // Print.p("Some thing went wrong in login");
      Print.p("Exception:${e.toString()}");
      standaredToast(msg: "Something went wrong...");
    }
  }

//   this is for fetching all  of the last post
  static Future<Map<String, dynamic>?> fetchAllPosts(
      {required String id}) async {
    // Print.p("in Login api ");
    try {
      var finalPath;
      finalPath = "$endPoint$fetchAllPostEndPoint";
      // Print.p(finalPath);
      // var data = {"email": email.toString(), "password": password.toString()};
      Response res = await dio.get("${finalPath}?userId=$id");
      return ResponseStructure.toResponseStructure(res);
      // await Future.delayed(Duration(seconds: 3),(){
      //   Print.p("After 3secound call back function");
      // });
    } catch (e) {
      // Print.p("Some thing went wrong in login");
      Print.p("Exception:${e.toString()}");
      standaredToast(msg: "Something went wrong...");
    }
  }

//   this is for updating current location through the api
  static Future<Map<String, dynamic>?> updateLocation(
      {required String id,required double lat,required double log}) async {
    // Print.p("in Login api ");
    try {
      var finalPath;
      finalPath = "$endPoint$updateLocationEndPoint";
      var data={
        "location": {
          "lat": lat,
          "log": log
        }
      };
      Response res = await dio.post("${finalPath}?id=${id}",data: data);
      return ResponseStructure.toResponseStructure(res);
      // await Future.delayed(Duration(seconds: 3),(){
      //   Print.p("After 3secound call back function");
      // });
    } catch (e) {
      // Print.p("Some thing went wrong in login");
      Print.p("Exception:${e.toString()}");
      standaredToast(msg: "Something went wrong...");
    }
  }

//   post you current location
  static Future<Map<String, dynamic>?> postCurrentLocationImage(
      {required String imagePath,required String title,required double lat,required double log,required String userId}) async {
    Print.p("userid=>${userId}");
    try {
      var finalPath;
      finalPath = "$endPoint$postEndPoint";
      var formData= FormData.fromMap({
        "lat":lat,
        "lng":log,
        "userId":userId,
        "image":await MultipartFile.fromFile(imagePath),
        "title":title
      });
      Response res = await dio.post(finalPath,data:formData);
      return ResponseStructure.toResponseStructure(res);
      // await Future.delayed(Duration(seconds: 3),(){
      //   Print.p("After 3secound call back function");
      // });
    } catch (e) {
      // Print.p("Some thing went wrong in login");
      Print.p("Exception:${e.toString()}");
      standaredToast(msg: "Something went wrong...");
    }
  }

  // this is forgetting humanreadable
  static Future<Map<String, dynamic>> getHumanReadableAdd({required double lat,required double log}) async {
    String finalPath =
        "https://ambulance-booking-backend.vercel.app/user/get-address?lat=${lat}&lng=${log}";
    Print.p(finalPath.toString());
    Response response = await dio.get(finalPath);
    Print.p(response.toString());
    return ResponseStructure.toResponseStructure(response);

    // return finalResponse;
  }

//   forget password setting  code over email
  static Future<Map<String, dynamic>?> forgetPassword(
      {required String email}) async {
    // Print.p("in Login api ");
    try {
      var finalPath;
      finalPath = "$endPoint$forgetPasswordEndPoint";
      var data={
        "email":email
      };
      Response res = await dio.post(finalPath,data: data);
      return ResponseStructure.toResponseStructure(res);
      // await Future.delayed(Duration(seconds: 3),(){
      //   Print.p("After 3secound call back function");
      // });
    } catch (e) {
      // Print.p("Some thing went wrong in login");
      Print.p("Exception:${e.toString()}");
      standaredToast(msg: "Something went wrong...");
    }
  }

//   verify code
  static Future<Map<String, dynamic>?> verifyCode(
      {required String email,required String code}) async {
    // Print.p("in Login api ");
    try {
      var finalPath;
      finalPath = "$endPoint$verifyCodeEndPoint";
      var data={
        "email":email,
        "code":code
      };
      Response res = await dio.post(finalPath,data: data);
      return ResponseStructure.toResponseStructure(res);
      // await Future.delayed(Duration(seconds: 3),(){
      //   Print.p("After 3secound call back function");
      // });
    } catch (e) {
      // Print.p("Some thing went wrong in login");
      Print.p("Exception:${e.toString()}");
      standaredToast(msg: "Something went wrong...");
    }
  }

//   reset password

  static Future<Map<String, dynamic>?> resetPassword(
      {required String email,required String newPass}) async {
    // Print.p("in Login api ");
    try {
      var finalPath;
      finalPath = "$endPoint$resetPassEndPoint";
      var data={
        "email":email,
        "newPassword":newPass
      };
      Response res = await dio.post(finalPath,data: data);
      return ResponseStructure.toResponseStructure(res);
      // await Future.delayed(Duration(seconds: 3),(){
      //   Print.p("After 3secound call back function");
      // });
    } catch (e) {
      // Print.p("Some thing went wrong in login");
      Print.p("in resetPass Exception:${e.toString()}");
      standaredToast(msg: "Something went wrong...");
    }
  }

//   create note api user/write-notes

  static Future<Map<String, dynamic>?> createNote(
      {required String title,required String content,required String userId}) async {
    // Print.p("in Login api ");
    try {
      var finalPath;
      finalPath = "$endPoint$createNotesEndPoint";
      var data={
        "userId": userId,
        "title": title,
        "content": content
      };
      Response res = await dio.post(finalPath,data: data);
      return ResponseStructure.toResponseStructure(res);
      // await Future.delayed(Duration(seconds: 3),(){
      //   Print.p("After 3secound call back function");
      // });
    } catch (e) {
      // Print.p("Some thing went wrong in login");
      Print.p("in create note Exception:${e.toString()}");
      standaredToast(msg: "Something went wrong while creating Note...");
    }
  }

//   get all notes

  static Future<Map<String, dynamic>?> fetchAllNotes(
      {required String userId}) async {
    // Print.p("in Login api ");
    try {
      var finalPath;
      finalPath = "$endPoint$fetchAllNotesEndPoint";
      Response res = await dio.get("${finalPath}?userId=${userId}",);
      return ResponseStructure.toResponseStructure(res);
      // await Future.delayed(Duration(seconds: 3),(){
      //   Print.p("After 3secound call back function");
      // });
    } catch (e) {
      // Print.p("Some thing went wrong in login");
      Print.p("in fetch all notes Exception:${e.toString()}");
      standaredToast(msg: "Something went wrong while fetching notes...");
    }
  }

//   update notes

  static Future<Map<String, dynamic>?> editNote(
      {required String title,required String content,required String userId}) async {
    // Print.p("in Login api ");
    try {
      var finalPath;
      finalPath = "$endPoint$editNoteEndPoint";
      var data={
        "title": title,
        "content": content
      };
      Response res = await dio.post("${finalPath}?id=${userId}",data: data);
      return ResponseStructure.toResponseStructure(res);
      // await Future.delayed(Duration(seconds: 3),(){
      //   Print.p("After 3secound call back function");
      // });
    } catch (e) {
      // Print.p("Some thing went wrong in login");
      Print.p("in edit note Exception:${e.toString()}");
      standaredToast(msg: "Something went wrong while editing Note...");
    }
  }

//   delete note

  static Future<Map<String, dynamic>?> deleteNote(
      {required String noteId}) async {
    // Print.p("in Login api ");
    try {
      var finalPath;
      finalPath = "$endPoint$deleteNoteEndPoint";
      Response res = await dio.delete("${finalPath}?id=${noteId}",);
      return ResponseStructure.toResponseStructure(res);
      // await Future.delayed(Duration(seconds: 3),(){
      //   Print.p("After 3secound call back function");
      // });
    } catch (e) {
      // Print.p("Some thing went wrong in login");
      Print.p("in delete notes Exception:${e.toString()}");
      standaredToast(msg: "Something went wrong while delete notes...");
    }
  }


}
