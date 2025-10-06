import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jecrc/components/appBar.dart';
import 'package:jecrc/components/papers.dart';
import 'package:jecrc/components/widgets.dart';

class InSems extends StatefulWidget {
  final String collectionName;
  final String course;
  final String semesters;
  const InSems(
      {super.key,
      required this.semesters,
      required this.course,
      required this.collectionName});

  @override
  State<InSems> createState() => _InSemsState();
}

class _InSemsState extends State<InSems> {
  List<String> documentNames = []; // Store document names

  @override
  void initState() {
    super.initState();
    fetchDocumentNames();
  }

  Future<void> fetchDocumentNames() async {
    try {
      print('collection:- ${widget.collectionName}');
      print('course:- ${widget.course}');
      print('semesters:- ${widget.semesters}');
      CollectionReference subCollectionRef = FirebaseFirestore.instance
          .collection(widget.collectionName)
          .doc(widget.course)
          .collection(widget.semesters);

      QuerySnapshot querySnapshot = await subCollectionRef.get();

      List<String> documentIds =
          querySnapshot.docs.map((doc) => doc.id).toList();

      print('In Sem data:- $documentIds');

      // Update state to refresh the UI
      setState(() {
        documentNames = documentIds;
      });
    } catch (e) {
      print("Error fetching document names: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton(context),
      appBar: CustomAppBar(
        title: 'In-Semesters',
        leadingIcon: Icons.arrow_back,
        onLeadingIconTap: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.black,
      body: documentNames.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.red,
            )) // Show loader while fetching data
          : ListView.builder(
              itemCount: documentNames.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: insem(
                      onTap: () {
                        Get.to(
                            () => Papers(
                                  type: documentNames[index],
                                ),
                            transition: Transition.rightToLeft);
                      },
                      context: context,
                      imagePath: "assets/images/exam.png",
                      title: documentNames[index]),
                );
              },
            ),
    );
  }
}

// SizedBox(
//   height: 30,
// ),
// insem(
//     onTap: () {
//       Get.to(()=> Papers());
//     },
//     context: context,
//     imagePath: "assets/images/exam.png",
//     title: "First In-Semester Examination"),

// insem(
//      onTap: () {
//       Get.to(()=> Papers());
//     },
//     context: context,
//     imagePath: "assets/images/exam.png",
//     title: "Third In-Semester Examination"),
// insem(
//      onTap: () {
//       Get.to(()=> Papers());
//     },
//     context: context,
//     imagePath: "assets/images/exam.png",
//     title: "End-Semester Examination"),
// SizedBox(
//   height: 30,
// ),
