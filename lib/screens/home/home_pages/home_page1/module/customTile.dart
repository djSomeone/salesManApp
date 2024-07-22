import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTile extends StatelessWidget {
  String imagePath = "";
  String address = "";
  String date = "";
  String time;
  CustomTile({this.imagePath = "", this.address = "", this.date = "",this.time=""});

  @override
  Widget build(BuildContext context) {
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
                  child: Image.asset(
                    "assets/testImage.png",
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
                        "Vasai - Virar link road",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Vasai Station Rd, Vishal Nagar, Vasai Station Rd, Vishal Nagar, Maharashtra 401202",
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
                          Text("02:12 pm",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w400),),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Text("12 August,2024 ",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w400),),
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
