import 'dart:io';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tachnic_pharma_equipments/screens/home/home_pages/home_page1/home_page1.dart';
import 'package:tachnic_pharma_equipments/screens/home/home_pages/home_page2/note_page.dart';
import 'package:tachnic_pharma_equipments/utility/constants.dart';

import '../camera_section/share_with_admin_page.dart';
import 'home_pages/home_page1/controller/user_controller.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});


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

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: takePicture,
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: StandaredColor.primery),
          child: Center(child: Icon(Icons.camera_alt_rounded,size: 26,color: Colors.white,),),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        // backgroundColor: Colors.black,
        icons: [Icons.home_filled, Icons.pending_actions_rounded],
        iconSize: 26,
        rightCornerRadius: 30,
        leftCornerRadius: 30,
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

  Future<void> takePicture() async {
    // Request permission for Android if needed
    if (Platform.isAndroid) {
      await Permission.camera.request();
    }

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Got an image!
      final path =  pickedFile.path;
      Print.p(path.toString());
      Get.to(ShareWithAdminPage(path: path));
      // Use the imageBytes data for further processing or display
    } else {
      Get.back();
    }
  }
}
