import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jecrc/components/appBar.dart';
import 'package:jecrc/components/pdfPapper.dart';
import 'package:jecrc/components/widgets.dart';

class Papers extends StatefulWidget {
  final String type;
  const Papers({super.key, required this.type});

  @override
  State<Papers> createState() => _PapersState();
}

class _PapersState extends State<Papers> {
  bool _isExpanded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Type: ${widget.type}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        title: "Papers",
        leadingIcon: Icons.arrow_back,
        onLeadingIconTap: () {
          Navigator.of(context).pop();
        },
      ),
      body: Column(
        children: [
          // expansion(context),
          customExpansionTile(title: "Radio", listItems: [
            {
              "title": "Paper 2022",
              "icon": Icons.arrow_forward,
              "onTap": () {
                print("Paper 2022 clicked!");
                Get.to(
                  () => PdfViewerPage(
                      pdfUrl:
                          "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
                      fileName: "Paper 2022"),
                  transition: Transition.rightToLeft,
                );
              },
            },
            {
              "title": "Paper 2023",
              "icon": Icons.arrow_forward,
              "onTap": () {
                print("Paper 2023 clicked!");
                Get.to(
                  () => PdfViewerPage(
                      pdfUrl:
                          "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
                      fileName: "Paper 2022"),
                  transition: Transition.rightToLeft,
                );
              },
            },
          ]),

          customExpansionTile(title: "Radio", listItems: [
            {
              "title": "Paper 2022",
              "icon": Icons.arrow_forward,
              "onTap": () {
                print("Paper 2022 clicked!");
                Get.to(
                  () => PdfViewerPage(
                      pdfUrl:
                          "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
                      fileName: "Paper 2022"),
                  transition: Transition.rightToLeft,
                );
              },
            },
            {
              "title": "Paper 2023",
              "icon": Icons.arrow_forward,
              "onTap": () {
                print("Paper 2023 clicked!");
                Get.to(
                  () => PdfViewerPage(
                      pdfUrl:
                          "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
                      fileName: "Paper 2022"),
                  transition: Transition.rightToLeft,
                );
              },
            },
          ])
        ],
      ),
    );
  }

//   Padding expansion(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Color.fromARGB(
//               253, 228, 23, 57), // Keeps main tile red even after expansion
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Theme(
//           data: Theme.of(context).copyWith(
//             dividerColor: Colors.transparent, // Removes default divider line
//           ),
//           child: ExpansionTile(
//             onExpansionChanged: (expanded) {
//               setState(() {
//                 _isExpanded = expanded;
//               });
//             },
//             iconColor: Colors.white,
//             collapsedIconColor: Colors.white,
//             title: Text(
//               'Radio',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 17,
//                 fontWeight: FontWeight.w900,
//               ),
//             ),
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color:
//                       Colors.white38, // Background color for expanded section
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(16),
//                     bottomRight: Radius.circular(16),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     ListTile(
//                       title: Text(
//                         "Paper 2022",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w700,
//                             fontSize: 15),
//                       ),
//                       trailing: Icon(
//                         Icons.arrow_forward,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
}