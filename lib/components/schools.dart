import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jecrc/components/appBar.dart';
import 'package:jecrc/components/courses.dart';

// The reusable SchoolsGrid component
class SchoolsGrid extends StatefulWidget {
  // final String collectionKey;
  final List<Map<String, dynamic>> schools;

  // Constructor to allow custom data
  const SchoolsGrid({
    Key? key,
    required this.schools,
  }) : super(key: key);

  @override
  State<SchoolsGrid> createState() => _SchoolsGridState();
}

class _SchoolsGridState extends State<SchoolsGrid> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        // shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of cards in each row
          crossAxisSpacing: 15, // Spacing between columns
          mainAxisSpacing: 15, // Spacing between rows
          childAspectRatio: 0.75, // Adjust the height-to-width ratio
        ),
        itemCount: widget.schools.length,
        itemBuilder: (context, index) {
          final school = widget.schools[index];

          final List<Map<String, dynamic>> courses =
              (school["courses"] as List<dynamic>)
                  .map((e) => e as Map<String, dynamic>)
                  .toList();
          // final school = schools[index];
          print('Courses List after conversion: $courses');
          return SchoolCard(
            icon: school['icon'],
            Courses: courses,
            title: school['title']!,
            description: school['description']!,
            imagePath: school['image']!,
            onTap: () {
              Get.to(
                  () => Courses(
                      courseKey: school['key'],
                      collectionKey: school['title'],
                      title: school['title']!,
                      description: school['description']!,
                      imagePath: school['image']!,
                      courses: courses,
                      icon: school['icon']),
                  transition: Transition.rightToLeft);
            },
          );
        },
      ),
    );
  }
}

// The SchoolCard widget for individual cards
// import 'package:flutter/material.dart';

class SchoolCard extends StatelessWidget {
  final String title;
  final String icon;
  final String description;
  final String imagePath;
  final VoidCallback onTap;
  final List<Map<String, dynamic>> Courses;

  const SchoolCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.onTap,
    required this.Courses,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double imageHeight = screenWidth * 0.3; // Adjust based on screen size
          double cardPadding = screenWidth * 0.02;
          double fontSize = screenWidth * 0.04; // Scale font dynamically

          return Container(
            // margin: EdgeInsets.all(cardPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Responsive Image
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    height: imageHeight,
                    width: double.infinity,
                  ),
                ),
                // Content Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF4060),
                        ),
                      ),
                      SizedBox(height: 5),
                      // Description
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: fontSize * 0.7,
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


// A simple detail screen for demonstration
