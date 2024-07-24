import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

class EditNotePage extends StatelessWidget {
  EditNotePage({super.key});
  var titleCon=TextEditingController();
  var contentCon=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Add Note",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700),
        ),
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
              onTap: () {},
              onChanged: (x) {},
              controller: titleCon,
              keyboardType: TextInputType.visiblePassword,
              style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500,),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,// Enables background color

                hintText: "Add Title",
                hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Color(0xFF747474)),

                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                    borderRadius: BorderRadius.circular(0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.transparent, width: 1),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            currentDateRow(),
            SizedBox(height: 30,),
            Expanded(child: TextFormField(
              maxLines: 100,
              onTap: () {},
              onChanged: (x) {},
              controller: contentCon,
              keyboardType: TextInputType.visiblePassword,
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400,),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,// Enables background color

                hintText: "Start Typing...",
                hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Color(0xFF747474)),

                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                    borderRadius: BorderRadius.circular(0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.transparent, width: 1),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),)
           

          ],
        ),
      ),
    );
  }

  Map dateTimeInWords({DateTime? x}) {
    Print.p("in my method");
    final dateTime = x ??  DateTime.now();
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

    final inString=dateTime.toString();
    var y=inString.split(" ");
    dynamic date=y[0];
    date=date.split("-");
    var finalDate="${date[2]} ${month_names[int.parse(date[1])-1].toString()} ${date[0]}";
    var finalTime="${convertTo12HourFormat(y[1].toString().split(".")[0].toString())}";
    return {
      "date":finalDate
    ,
    "time":finalTime
  };



  }
  String convertTo12HourFormat(String time24) {
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

  Widget currentDateRow(){
    var x=dateTimeInWords();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("${x["date"]}    ",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Color(0xFF747474)),),
        Text(x["time"],style:TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Color(0xFF747474))),
      ],
    );
  }



}
