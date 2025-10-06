// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jecrc/components/appBar.dart';
import 'package:jecrc/components/sem.dart';
import 'package:jecrc/components/widgets.dart';

class Courses extends StatefulWidget {
  final String courseKey;
  final String collectionKey;
  final String title;
  final String icon;
  final String description;
  final String imagePath;
  final List<Map<String, dynamic>> courses;

  const Courses({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.courses,
    required this.icon,
    required this.collectionKey,
    required this.courseKey,
  }) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List<Map<String, dynamic>> courseDetails = [];
  List<Map<String, dynamic>> originalCourseDetails = [];
  bool isFetching = false;

  @override
  void initState() {
    super.initState();
    fetchDocuments();
  }

  String collectionName = "";

  Future<void> fetchDocuments() async {
    try {
      setState(() {
        isFetching = true;
      });

      if (widget.courseKey == "allied_health") {
        setState(() {
          collectionName = 'allied_health';
          print("Collection Name:- $collectionName");
        });
      } else if (widget.courseKey == "business") {
        setState(() {
          collectionName = 'business';
          print("Collection Name:- $collectionName");
        });
      } else if (widget.courseKey == "computer_applications") {
        setState(() {
          collectionName = 'computer_applications';
          print("Collection Name:- $collectionName");
        });
      } else if (widget.courseKey == "design") {
        setState(() {
          collectionName = 'design';
          print("Collection Name:- $collectionName");
        });
      } else if (widget.courseKey == "economics") {
        setState(() {
          collectionName = 'economics';
          print("Collection Name:- $collectionName");
        });
      } else if (widget.courseKey == "engineering") {
        setState(() {
          collectionName = 'engineering';
          print("Collection Name:- $collectionName");
        });
      } else if (widget.courseKey == "hospitality") {
        setState(() {
          collectionName = 'hospitality';
          print("Collection Name:- $collectionName");
        });
      } else if (widget.courseKey == "humanities") {
        setState(() {
          collectionName = 'humanities';
          print("Collection Name:- $collectionName");
        });
      } else if (widget.courseKey == "law") {
        setState(() {
          collectionName = 'law';
          print("Collection Name:- $collectionName");
        });
      } else if (widget.courseKey == "mass_communication") {
        setState(() {
          collectionName = 'mass_comm';
          print("Collection Name:- $collectionName");
        });
      } else if (widget.courseKey == "sciences") {
        setState(() {
          collectionName = 'sciences';
          print("Collection Name:- $collectionName");
        });
      } else {
        print('No valid collection found for: $collectionName');
        setState(() {
          isFetching = false;
        });
        return;
      }

      final querySnapshot =
          await FirebaseFirestore.instance.collection(collectionName).get();

      List<Map<String, dynamic>> courses = querySnapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'semesters': doc['semesters'],
        };
      }).toList();

      print('Courses from $collectionName: $courses');

      setState(() {
        courseDetails = courses;
        originalCourseDetails = List.from(courses);
        isFetching = false;
      });
    } catch (e) {
      print('Error fetching documents: $e');
      setState(() {
        isFetching = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton(context),
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        title: "Courses",
        leadingIcon: Icons.arrow_back,
        onLeadingIconTap: () {
          Navigator.of(context).pop();
        },
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) {
                setState(() {
                  if (query.isEmpty) {
                    courseDetails = List.from(originalCourseDetails);
                  } else {
                    courseDetails = originalCourseDetails
                        .where((course) => course['id']
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                        .toList();
                  }
                });
              },
              decoration: InputDecoration(
                hintText: "Search courses",
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: isFetching
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFFFF4060),
                    ),
                  )
                : ListView.builder(
                    itemCount: courseDetails.length,
                    itemBuilder: (context, index) {
                      final course = courseDetails[index];
                      final courseId = course['id'];
                      final semesters = course['semesters'];

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                  color: Color.fromARGB(253, 228, 23, 57),
                                  width: 3)),
                          child: ListTile(
                            onTap: () {
                              Get.to(
                                  () => Semesters(
                                        courses: courseId,
                                        collectionName: collectionName,
                                        duration: semesters,
                                      ),
                                  transition: Transition.rightToLeft);
                            },
                            minVerticalPadding: 30,
                            leading: Image.asset(
                              widget.icon,
                              fit: BoxFit.cover,
                              width: 60,
                              height: 60,
                            ),
                            title: Text(
                              courseId,
                              style: const TextStyle(
                                  color: Color.fromARGB(253, 228, 23, 57),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                            subtitle: Text(
                              'Semesters: $semesters',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
