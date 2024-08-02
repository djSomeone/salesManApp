import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tachnic_pharma_equipments/screens/home/home_pages/home_page2/edit_note_page.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

class NoteCard extends StatelessWidget {
  var title;
  // var date;
  var note;
  var id;
  // var time;
  dynamic dateTime = "";

   NoteCard({required this.title,required this.dateTime,required this.note,required this.id});

  @override
  Widget build(BuildContext context) {
    dateTime=DateTime.parse(dateTime);
    var duration=Duration(hours: 5,minutes: 31);
    dateTime=dateTime.add(duration);
    dateTime=EditNotePage.dateTimeInWords(x:dateTime);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: (){
          Get.to(EditNotePage(title: title,content: note,id: id,));
        },
        child: Container(
          // height: 220,
          width:MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: StandaredColor.primery),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // title and date and time
                Row(
                  children: [
                    Expanded(child:Text(title,overflow:TextOverflow.ellipsis,style: GoogleFonts.poppins(color:Colors.white,fontWeight: FontWeight.w600,fontSize: 16),)),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(dateTime["date"],style: GoogleFonts.poppins(color: Color(0xFFD9D9D9),fontSize: 14),),
                    ),
                    Text(dateTime["time"],style: GoogleFonts.poppins(color: Color(0xFFD9D9D9)),),
                  ],
                ),
                // spacee
                SizedBox(height: 16,),
                // note
                Text(note,maxLines:4,overflow:TextOverflow.ellipsis,style: GoogleFonts.poppins(color:Colors.white,fontSize: 16,fontWeight: FontWeight.w400),)
              ],
            ),
          ),

        ),
      ),
    );
  }
}
