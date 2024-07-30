import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tachnic_pharma_equipments/screens/home/home_pages/home_page2/edit_note_page.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

class CustomTile extends StatelessWidget {
  String imagePath = "";
  String address = "";
  dynamic dateTime = "";
  String title;
  CustomTile({this.imagePath = "", this.address = "", this.dateTime = "",this.title=""});

  @override
  Widget build(BuildContext context) {
   dateTime=DateTime.parse(dateTime);
   dateTime=EditNotePage.dateTimeInWords(x:dateTime);
    return Padding(
      padding: const EdgeInsets.only(bottom: 26),
      child: SizedBox(
        height: 190,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: Image.network(
                    imagePath,
                    fit: BoxFit.fill,
                  ),
                )),
            SizedBox(
              width: 14,
            ),
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        address,
                        maxLines: 3,

                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 2,
                            color: Color(0xFF747474)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(dateTime["time"],style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w400),),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Text(dateTime["date"],style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w400),),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
