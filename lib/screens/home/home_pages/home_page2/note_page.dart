import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tachnic_pharma_equipments/screens/home/home_pages/home_page2/edit_note_page.dart';
import 'package:tachnic_pharma_equipments/screens/home/home_pages/home_page2/module/note_card.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

class NotePage extends StatelessWidget {
  NotePage({super.key});

  var conPassCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Print.p(DateTime.now().toString());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Note",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // top bar for the note
            topBar(),
            // space
            SizedBox(height: 10,),
            // add  note button   - -  list  of all notes
            Expanded(
                child: Column(
              children: [
                // add note button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: addNoteButton(),
                ),
                Expanded(child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    NoteCard(title: "SoftCraft Meetup",date: "17 August, 24",time: "12:07 am",note: "A productive meeting was held between ",),
                    NoteCard(title: "SoftCraft Meetup",date: "17 August, 24",time: "12:07 am",note: "A productive meeting was held between A productive meeting was held between SoftCraft Solutions and the sales agent. Key strategies for market expansion and collaboration were discussed, with actionable insights and mutual goals.",),

                  ],
                )),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget topBar() {
    return Row(
      children: [
        // textFeild
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              onTap: () {},
              onChanged: (x) {},
              controller: conPassCon,
              keyboardType: TextInputType.visiblePassword,
              style: GoogleFonts.poppins(fontSize: 14),
              decoration: InputDecoration(
                filled: true, // Enables background color
                fillColor: Colors.grey.withOpacity(0.1),
                prefixIcon: Icon(Icons.search),
                counterText: "",
                hintText: "Search",
                hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),

                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFB9B9B9), width: 1),
                    borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.5), width: 1),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
        ),
        // space
        SizedBox(
          width: 12,
        ),
        // sort by
        Container(
          height: 52,
          // width: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              // color: Color(0xFFDFDFDF).withOpacity(0.4),
              border: Border.all(color: Color(0xFFB4B4B4))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF747474),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Sort by",
                    style: GoogleFonts.poppins(
                        color: Color(0xFF747474),
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
  Widget addNoteButton(){
    return GestureDetector(
      onTap: (){
        Get.to(EditNotePage());
      },
      child: SizedBox(
        height:54,
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: StandaredColor.primery),borderRadius: BorderRadius.circular(16)),
          child: Center(child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Add Note",style: GoogleFonts.poppins(color:StandaredColor.primery,fontSize: 16,fontWeight: FontWeight.w400),),
              SizedBox(width: 5,),
              Icon(Icons.add_circle_outline_outlined,color: StandaredColor.primery,)
            ],
          ),),
        ),
      ),
    );
  }
}
