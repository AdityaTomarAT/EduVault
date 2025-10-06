import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jecrc/components/appBar.dart';
import 'package:jecrc/components/widgets.dart';
import 'package:jecrc/features/src/alumini/alumini_Homepage.dart';
import 'package:jecrc/underGraduate/schoolsUI.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    print('screen width: $screenwidth');
    print('screen height: $screenheight');

    return Scaffold(
        floatingActionButton: floatingActionButton(context),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          // child: GNav(
          //     rippleColor: Colors.grey.shade800,
          //     hoverColor: Colors.grey.shade700,
          //     haptic: true,
          //     tabBorderRadius: 15,
          //     tabActiveBorder: Border.all(color: Colors.black, width: 1),
          //     tabBorder: Border.all(color: Colors.grey, width: 1),
          //     tabShadow: [
          //       BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
          //     ],
          //     duration: Duration(milliseconds: 900),
          //     color: Color.fromARGB(253, 228, 23, 57),
          //     activeColor: Colors.white,
          //     iconSize: 24,
          //     tabBackgroundColor: Color.fromARGB(253, 228, 23, 57),
          //     padding: EdgeInsets.symmetric(
          //         horizontal: 20, vertical: 5), // navigation bar padding
          //     tabs: [
          //       GButton(
          //         icon: Icons.home,
          //         text: 'Papers',
          //       ),
          //       GButton(
          //         onPressed: () {
          //           Get.to(() => Alumini(), transition: Transition.rightToLeft);
          //         },
          //         icon: Icons.group,
          //         text: 'Alumini',
          //       ),
          //     ]),
        ),
        backgroundColor: Colors.black,
        appBar: CustomAppBar(
          leadingIcon: Icons.arrow_back,
          title: "Dashboard",
          onLeadingIconTap: () {
            Navigator.of(context).pop();
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => UnderGraduate(),
                        transition: Transition.rightToLeft);
                  },
                  child: Container(
                    height: (screenheight == 616) ? 160 : 230,
                    width: screenwidth * 0.6,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(253, 228, 23, 57), width: 3),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/images/under4.png",
                          scale: 1.4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Under Graduate",
                              style: GoogleFonts.basic(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(253, 228, 23, 57),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        )
        // Column(
        //   // crossAxisAlignment: CrossAxisAlignment.stretch,
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         GestureDetector(
        //           onTap: () {

        //           },
        //           child: Column(
        //             children: [
        //               Container(
        //                   height: (screenheight == 616) ? 160 : 230,
        //                   decoration: BoxDecoration(
        //                       border: Border.all(
        //                           color: Color.fromARGB(253, 228, 23, 57),
        //                           width: 3),
        //                       color: Colors.white,
        //                       borderRadius: BorderRadius.circular(30)),
        //                   child: Column(
        //                     children: [

        //                     ],
        //                   )),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        );
  }
}
