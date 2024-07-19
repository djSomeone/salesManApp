import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tachnic_pharma_equipments/screens/home_pages/home_page1/home_page1.dart';
import 'package:tachnic_pharma_equipments/screens/home_pages/home_page2/note_page.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPageIndex = 0;
  List<Widget> x=[
    HomePage1(),
    NotePage()
  ];
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: StandaredColor.primery),
        child: Center(child: Icon(Icons.camera_alt_rounded,size: 26,color: Colors.white,),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [Icons.home_filled, Icons.pending_actions_rounded],
        iconSize: 26,
        activeColor: StandaredColor.primery,
        activeIndex: currentPageIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        onTap: (index) {
          Print.p(index.toString());
          setState(() {
            currentPageIndex = index;
          });
        },
        //other params
      ),

      body: x[currentPageIndex],
    );
  }
}
