import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tachnic_pharma_equipments/screens/home/home_pages/home_page2/controller/notesController.dart';
import 'package:tachnic_pharma_equipments/screens/home/home_pages/home_page2/edit_note_page.dart';
import 'package:tachnic_pharma_equipments/screens/home/home_pages/home_page2/module/note_card.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

class NotePage extends StatelessWidget {
  NotePage({super.key});

  var conPassCon = TextEditingController();
  var noteCon=Get.find<NotesController>();
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
                Expanded(child: listNotes()),
              ],
            ))
          ],
        ),
      ),
    );
  }
  // lsting the  getted notes
  Widget listNotes(){

    return Obx(
      ()
      {
        var notesData=Get.find<NotesController>().filtered.value;
       return ListView.builder(
          itemBuilder: (context, index) {
            return NoteCard(
                id: notesData[index]["_id"],
                title: notesData[index]["title"],
                dateTime: notesData[index]["updatedAt"],
                note: notesData[index]["content"]);
          },
          itemCount: notesData.length,
          padding: EdgeInsets.zero,
        );
      },
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
              onChanged: (x) {
                Print.p("in onchange()");
                noteCon.filterData(x);
              },
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


      ],
    );
  }
  Widget addNoteButton(){
    return GestureDetector(
      onTap: (){
        Get.to(EditNotePage(isEditNote: false,));
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
