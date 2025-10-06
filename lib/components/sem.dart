// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jecrc/components/appBar.dart';
// import 'package:jecrc/components/insem.dart';
// import 'package:jecrc/components/widgets.dart';

// class Semesters extends StatefulWidget {
//   final String courses;
//   final String collectionName;
//   final int duration;
//   const Semesters(
//       {super.key,
//       required this.duration,
//       required this.collectionName,
//       required this.courses});

//   @override
//   State<Semesters> createState() => _SemestersState();
// }

// class _SemestersState extends State<Semesters> {
//   // Example list of image paths
//   final List<String> images = [
//     'assets/images/sem1.png',
//     'assets/images/sem2.png',
//     'assets/images/sem3.png',
//     'assets/images/sem4.png',
//     'assets/images/sem5.png',
//     'assets/images/sem6.png',
//     'assets/images/sem7.png',
//     'assets/images/sem8.png',
//     'assets/images/sem9.png',
//     'assets/images/sem10.png',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     print('Inside semester screen');
//     print('Duration: ${widget.duration}');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: floatingActionButton(context),
//       backgroundColor: Colors.black,
//       appBar: CustomAppBar(
//         title: "Semester",
//         leadingIcon: Icons.arrow_back,
//         onLeadingIconTap: () {
//           Navigator.of(context).pop();
//         },
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, // Number of cards per row
//             crossAxisSpacing: 20,
//             mainAxisSpacing: 20,
//           ),
//           itemCount: widget.duration,
//           itemBuilder: (context, index) {
//             return Container(
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(25)),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   SizedBox(
//                     height: 10,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Get.to(
//                           () => InSems(
//                                 course: widget.courses,
//                                 collectionName: widget.collectionName,
//                                 semesters: "Semester ${index + 1}",
//                               ),
//                           transition: Transition.rightToLeft);
//                     },
//                     child: Container(
//                       height: MediaQuery.of(context).size.width *
//                           0.28,
//                       width: MediaQuery.of(context).size.width * 0.35,
//                       decoration: BoxDecoration(
//                         // color: Colors.red,
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       child: Center(
//                           child: Image.asset(
//                         images[index % images.length],
//                         fit: BoxFit.cover,
//                       )),
//                     ),
//                   ),
//                   Text(
//                     'Semester',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// ======================================================== //
// Expansion Code //
// ======================================================== //

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jecrc/components/appBar.dart';
// import 'package:jecrc/components/pdfPapper.dart';
// import 'package:jecrc/components/widgets.dart';

// class Semesters extends StatefulWidget {
//   final String courses;
//   final String collectionName;
//   final int duration;

//   const Semesters({
//     super.key,
//     required this.duration,
//     required this.collectionName,
//     required this.courses,
//   });

//   @override
//   State<Semesters> createState() => _SemestersState();
// }

// class _SemestersState extends State<Semesters> {
//   final List<String> images = [
//     'assets/images/sem1.png',
//     'assets/images/sem2.png',
//     'assets/images/sem3.png',
//     'assets/images/sem4.png',
//     'assets/images/sem5.png',
//     'assets/images/sem6.png',
//     'assets/images/sem7.png',
//     'assets/images/sem8.png',
//     'assets/images/sem9.png',
//     'assets/images/sem10.png',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     print('Inside semester screen');
//     print('Duration: ${widget.duration}');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: floatingActionButton(context),
//       backgroundColor: Colors.black,
//       appBar: CustomAppBar(
//         title: "Semester",
//         leadingIcon: Icons.arrow_back,
//         onLeadingIconTap: () {
//           Navigator.of(context).pop();
//         },
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: ListView.builder(
//           itemCount: widget.duration,
//           itemBuilder: (context, index) {
//             return Card(
//               margin: const EdgeInsets.symmetric(vertical: 10),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               child: ExpansionTile(
//                 leading: ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.asset(
//                     images[index % images.length],
//                     height: 50,
//                     width: 50,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 title: Text(
//                   'Semester ${index + 1}',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.black,
//                   ),
//                 ),
//                 children: [
//                   FutureBuilder<List<String>>(
//                     future: fetchDocumentNames(widget.collectionName, widget.courses, "Semester ${index + 1}"),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return const Center(
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(vertical: 20),
//                             child: CircularProgressIndicator(color: Colors.red),
//                           ),
//                         );
//                       } else if (snapshot.hasError) {
//                         return Center(
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 20),
//                             child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.red)),
//                           ),
//                         );
//                       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                         return const Center(
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(vertical: 20),
//                             child: Text('No documents found', style: TextStyle(color: Colors.grey)),
//                           ),
//                         );
//                       } else {
//                         final documentNames = snapshot.data!;
//                         return ListView.builder(
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           itemCount: documentNames.length,
//                           itemBuilder: (context, docIndex) {
//                             return Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
//                               child: ExpansionTile(
//                                 //  collapsedBackgroundColor: Colors.red,
//                                 title: Text(
//                                   documentNames[docIndex],
//                                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                                 ),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 tilePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                                 children: [
//                                   customExpansionTile(
//                                     title: "Radio",
//                                     listItems: [
//                                       {
//                                         "title": "Paper 2022",
//                                         "icon": Icons.arrow_forward,
//                                         "onTap": () {
//                                           Get.to(
//                                             () => PdfViewerPage(
//                                               pdfUrl: "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
//                                               fileName: "Paper 2022",
//                                             ),
//                                             transition: Transition.rightToLeft,
//                                           );
//                                         },
//                                       },
//                                       {
//                                         "title": "Paper 2023",
//                                         "icon": Icons.arrow_forward,
//                                         "onTap": () {
//                                           Get.to(
//                                             () => PdfViewerPage(
//                                               pdfUrl: "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
//                                               fileName: "Paper 2023",
//                                             ),
//                                             transition: Transition.rightToLeft,
//                                           );
//                                         },
//                                       },
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         );
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Future<List<String>> fetchDocumentNames(String collectionName, String course, String semester) async {
//     try {
//       print('Fetching from collection: $collectionName, course: $course, semester: $semester');
//       CollectionReference subCollectionRef = FirebaseFirestore.instance
//           .collection(collectionName)
//           .doc(course)
//           .collection(semester);

//       QuerySnapshot querySnapshot = await subCollectionRef.get();

//       List<String> documentIds = querySnapshot.docs.map((doc) => doc.id).toList();
//       print('Fetched documents: $documentIds');

//       return documentIds;
//     } catch (e) {
//       print("Error fetching document names: $e");
//       throw e;
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jecrc/components/appBar.dart';
import 'package:jecrc/components/pdfPapper.dart';
import 'package:jecrc/components/widgets.dart';

class Semesters extends StatefulWidget {
  final String courses;
  final String collectionName;
  final int duration;

  const Semesters({
    super.key,
    required this.duration,
    required this.collectionName,
    required this.courses,
  });

  @override
  State<Semesters> createState() => _SemestersState();
}

class _SemestersState extends State<Semesters>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> images = [
    'assets/images/sem1.png',
    'assets/images/sem2.png',
    'assets/images/sem3.png',
    'assets/images/sem4.png',
    'assets/images/sem5.png',
    'assets/images/sem6.png',
    'assets/images/sem7.png',
    'assets/images/sem8.png',
    'assets/images/sem9.png',
    'assets/images/sem10.png',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.duration, vsync: this);
    print('Inside semester screen');
    print('Duration: ${widget.duration}');
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton(context),
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        title: "Semesters",
        leadingIcon: Icons.arrow_back,
        onLeadingIconTap: () {
          Navigator.of(context).pop();
        },
      ),
      body: Column(
        children: [
          // SizedBox(
          //   height: 12,
          // ),
          Container(
            margin: const EdgeInsets.all(0),

            color: Colors.black,
            padding: const EdgeInsets.symmetric(
                vertical: 10, horizontal: 0), // Reduced horizontal padding
            child: TabBar(
              indicatorWeight: 4,
              tabAlignment: TabAlignment.start,
              indicatorColor: Color.fromARGB(253, 228, 23, 57),
              dividerColor: Colors.black,
              controller: _tabController,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.all(0),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              tabs: List.generate(widget.duration, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5), // Reduced space between tabs
                  child: Tab(
                    child: Text(
                      'Semester ${index + 1}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: List.generate(widget.duration, (index) {
                return FutureBuilder<List<String>>(
                  future: fetchDocumentNames(widget.collectionName,
                      widget.courses, "Semester ${index + 1}"),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.red),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}',
                            style: TextStyle(color: Colors.red)),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No documents found',
                            style: TextStyle(color: Colors.grey)),
                      );
                    } else {
                      final documentNames = snapshot.data!;
                      return ListView.builder(
                        itemCount: documentNames.length,
                        itemBuilder: (context, docIndex) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ExpansionTile(
                                // collapsedBackgroundColor: Colors.white,
                                title: Text(
                                  documentNames[docIndex],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: customExpansionTile(
                                      title: "Radio",
                                      listItems: [
                                        {
                                          "title": "Paper 2022",
                                          "icon": Icons.arrow_forward,
                                          "onTap": () {
                                            Get.to(
                                              () => PdfViewerPage(
                                                pdfUrl:
                                                    "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
                                                fileName: "Paper 2022",
                                              ),
                                              transition:
                                                  Transition.rightToLeft,
                                            );
                                          },
                                        },
                                        {
                                          "title": "Paper 2023",
                                          "icon": Icons.arrow_forward,
                                          "onTap": () {
                                            Get.to(
                                              () => PdfViewerPage(
                                                pdfUrl:
                                                    "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
                                                fileName: "Paper 2023",
                                              ),
                                              transition:
                                                  Transition.rightToLeft,
                                            );
                                          },
                                        },
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<String>> fetchDocumentNames(
      String collectionName, String course, String semester) async {
    try {
      print(
          'Fetching from collection: $collectionName, course: $course, semester: $semester');
      CollectionReference subCollectionRef = FirebaseFirestore.instance
          .collection(collectionName)
          .doc(course)
          .collection(semester);

      QuerySnapshot querySnapshot = await subCollectionRef.get();

      List<String> documentIds =
          querySnapshot.docs.map((doc) => doc.id).toList();
      print('Fetched documents: $documentIds');

      return documentIds;
    } catch (e) {
      print("Error fetching document names: $e");
      throw e;
    }
  }
}