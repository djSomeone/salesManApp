import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            SizedBox(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Hello, Raju",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700, fontSize: 18),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: SvgPicture.asset(
                                    "assets/welcomePage/noto_waving-hand.svg"),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Your Shared Location Details",
                              style:
                                  GoogleFonts.poppins(color: Color(0xFF747474)),
                            ),
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.exit_to_app_rounded,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
            Expanded(child: Center(child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset("assets/welcomePage/empty.svg"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text("Nothing to show here at the moment.",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFF747474)),),
                )
              ],
            ),)),
          ],
        ),
      ),
    );
  }
}
