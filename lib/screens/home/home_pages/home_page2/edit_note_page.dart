import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tachnic_pharma_equipments/api/api.dart';
import 'package:tachnic_pharma_equipments/module/standaredButton/standaredButton.dart';
import 'package:tachnic_pharma_equipments/module/success_page/success_page.dart';
import 'package:tachnic_pharma_equipments/screens/home/home_pages/home_page1/controller/user_controller.dart';
import 'package:tachnic_pharma_equipments/screens/home/home_pages/home_page2/controller/notesController.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

class EditNotePage extends StatelessWidget {
  var title;
  var content;
  bool isEditNote;
  String id;
  Map<String,String> initialValue=Map();
  EditNotePage({this.title = "", this.content = "", this.isEditNote = true,this.id=""});
  var titleCon = TextEditingController();
  var contentCon = TextEditingController();
  var context;

  @override
  Widget build(BuildContext context) {
    titleCon.text = title;
    contentCon.text = content;
    this.context = context;
    initialValue={"title":title,"content":content};

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Add Note",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        actions: [
          GestureDetector(
            onTap: onDelete,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.delete_outline_rounded,
                size: 25,
              ),
            ),
          )
        ],
        centerTitle: true,
        leading: BackButton(),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: titleCon,
              keyboardType: TextInputType.visiblePassword,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              maxLength: 40,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero, // Enables background color
                counterText: "",
                hintText: "Add Title",
                hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF747474)),

                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                    borderRadius: BorderRadius.circular(0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 1),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            currentDateRow(),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: TextFormField(
                maxLines: 100,
                onTap: () {},
                onChanged: (x) {},
                controller: contentCon,
                keyboardType: TextInputType.visiblePassword,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero, // Enables background color

                  hintText: "Start Typing...",
                  hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF747474)),

                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0),
                      borderRadius: BorderRadius.circular(0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1),
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: StandaredButton(
                  onPress: isEditNote?onSaveChanges:onCreate,
                  title: isEditNote?"Save changes":"Create",
                  height: 50,
                ))
          ],
        ),
      ),
    );
  }
  // create
  void onCreate() async{
    try{
      if(titleCon.text!=""){
        var userDataCon = Get.find<UserDataController>();
        var notCon = Get.find<NotesController>();
        var result = await Api.createNote(
            title: titleCon.text,
            content: contentCon.text,
            userId: userDataCon.userData.value["_id"]);
        if (result != null) {
          if (result["status"] == 200) {
            await notCon.getData();
            Get.off(SuccessPage(
              title: "Successful",
              subtitle: "Successfully created your note.",
              onPress: () {},
              autoNavigate: true,
              sec: 1,
              goBack: true,
            ));
          } else {
            Print.p("onCreate else ");
          }
        } else {
          Print.p("rusult =null in onCreate(notes)");
        }
      }
      else{
        standaredToast(msg: "Write some thing in note");
      }
    }
    catch(e){
      Print.p("in onCreate =>${e.toString()}");
    }
  }
  // on update
  void onSaveChanges()async {
    try{
      var d={"title":titleCon.text,"content":contentCon.text};

      if(!areMapsEqual(d, initialValue)){
        var userDataCon = Get.find<UserDataController>();
        var notCon = Get.find<NotesController>();
        var result = await Api.editNote(
            title: titleCon.text,
            content: contentCon.text,
            noteId: id);
        if (result != null) {
          if (result["status"] == 200) {
            await notCon.getData();
            Get.off(SuccessPage(
              title: "Successful",
              subtitle: "Successfully Updated your note.",
              onPress: () {},
              autoNavigate: true,
              sec: 1,
              goBack: true,
            ));
          } else {
            Print.p("onUpdate() else ");
          }
        } else {
          Print.p("rusult =null in onUpdate(notes)");
        }
      }
      else{
        standaredToast(msg: "Nothing change");
        Get.back();
      }
    }
    catch(e){
      Print.p("in nUpdate =>${e.toString()}");
    }

  }
  // it is forthe convertiing date time in words
  static Map dateTimeInWords({DateTime? x}) {
    // Print.p("in my method");
    final dateTime = x ?? DateTime.now();
    var month_names = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];

    final inString = dateTime.toString();
    var y = inString.split(" ");
    dynamic date = y[0];
    date = date.split("-");
    var finalDate =
        "${date[2]} ${month_names[int.parse(date[1]) - 1].toString()} ${date[0]}";
    var finalTime =
        "${convertTo12HourFormat(y[1].toString().split(".")[0].toString())}";
    return {"date": finalDate, "time": finalTime};
  }

  // call when we click on the delete icon
  void onDelete() async {
    showDialog(
        context: context,
        builder: (context) => standaredAlertBox(
            title: "Confirm delete?",
            subTitle: "Are you sure you want to delete?",
            firstButtonColor: Color(0xFFDDDDDD),
            secoundButtonColor: Color(0xFFED6366),
            onTapFirstButton: () {
              Get.back();
            },
            onTapSecoundButton: confirmDelete,
            textFirstButton: "Cancel",
            textSecoundButton: "Delete"));
  }
  void confirmDelete()
  async
  {
    try{
      var d={"title":titleCon.text,"content":contentCon.text};
      Get.back();
      var notCon = Get.find<NotesController>();
      standaredToast(msg: "please wait");
        var result = await Api.deleteNote(
            noteId: id);
        if (result != null) {
          if (result["status"] == 200) {
            await notCon.getData();
            Get.off(SuccessPage(
              title: "Successful",
              subtitle: "Successfully Deleted note.",
              onPress: () {},
              autoNavigate: true,
              sec: 1,
              goBack: true,
            ));
          } else {
            Print.p("onDelete() else ");
          }
        } else {
          Print.p("rusult =null in onDelete(notes)");
        }


    }
    catch(e){
      Print.p("in onDelete =>${e.toString()}");
    }
  }

  // logic for  the converting 24 to 12 hr
  static String convertTo12HourFormat(String time24) {
    // Split the input time into hours and minutes
    List<String> parts = time24.split(':');
    int hours = int.parse(parts[0]);
    String minutes = parts[1];

    // Determine AM or PM suffix
    String suffix = hours >= 12 ? 'pm' : 'am';

    // Convert hours from 24-hour format to 12-hour format
    hours = hours % 12;
    hours = hours == 0 ? 12 : hours; // Adjust if the hour is 0

    // Format the time in 12-hour format
    return '${hours.toString().padLeft(2, '0')}:$minutes $suffix';
  }

  Widget currentDateRow() {
    var x = dateTimeInWords();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "${x["date"]}    ",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF747474)),
        ),
        Text(x["time"],
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF747474))),
      ],
    );
  }
  bool areMapsEqual(Map<String,String> map1, Map<String,String> map2) {
    if (map1.length != map2.length) {
      return false;
    }

    for (var key in map1.keys) {
      if (!map2.containsKey(key) || map2[key] != map1[key]) {
        return false;
      }
    }

    return true;
  }
}
