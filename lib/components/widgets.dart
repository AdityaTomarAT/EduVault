import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jecrc/features/src/feedback/feedback.dart';
import 'package:jecrc/features/src/solved/download.dart';

Widget insem({
  required BuildContext context,
  required String imagePath,
  required String title,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white24,
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(imagePath),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget floatingActionButton(BuildContext context) {
  return SizedBox(
    width: 60,
    height: 60,
    child: FloatingActionButton(
      shape: CircleBorder(),
      backgroundColor: Color.fromARGB(253, 228, 23, 57),
      onPressed: () {
        Get.to(
          () => FeedBackScreen(),
          transition: Transition.downToUp,
          duration: Duration(milliseconds: 450),
          curve: Curves.easeInOut,
        );
      },
      child: Image.asset(
        'assets/images/feedback2.png',
        color: Colors.white,
        width: 40,
        height: 40,
      ),
    ),
  );
}

Widget customExpansionTile({
  required String title,
  required List<Map<String, dynamic>> listItems,
  Color mainTileColor = const Color.fromARGB(253, 228, 23, 57),
  Color expandedTileColor = Colors.white38,
  Color textColor = Colors.white,
  double borderRadius = 16.0,
}) {
  return Container(
    decoration: BoxDecoration(
      color: mainTileColor,
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: Theme(
      data: ThemeData(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        iconColor: textColor,
        collapsedIconColor: textColor,
        title: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 17,
            fontWeight: FontWeight.w900,
          ),
        ),
        children: [
          Container(
            decoration: BoxDecoration(
              color: expandedTileColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(borderRadius),
                bottomRight: Radius.circular(borderRadius),
              ),
            ),
            child: Column(
              children: listItems.map((item) {
                return ListTile(
                  title: Text(
                    item["title"],
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  trailing: item["icon"] != null
                      ? Icon(
                          item["icon"],
                          color: textColor,
                        )
                      : null,
                  onTap: item["onTap"],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget alumniCard({
  required BuildContext context,
  required String name,
  required String imagePath,
  String description =
      "My passion for computer softwares met the best hardwares of Computer in labs of college. With profound knowledge of Professors and best-in-class exposure from software giant Microsoft coming to our college, prepared me to digest broader vision that I always dreamt but never believed in before.",
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.circular(35),
      ),
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListTile(
        leading: CircleAvatar(
          // backgroundColor: Colors.red,
          radius: 35,
          backgroundImage: AssetImage(imagePath),
        ),
        title: Text(
          name,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
        ),
      ),
    ),
  );
}

Widget drawer({
  required BuildContext context,
  required String name,
  required String email,
  required String phone,
}) {
  return Drawer(
    backgroundColor: Color.fromARGB(253, 228, 23, 57),
    child: Container(
      color: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              color: Color.fromARGB(253, 228, 23, 57),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(
                      'assets/images/user.png',
                    ), 
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        phone,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        email,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading:
                const Icon(Icons.assignment_turned_in, color: Colors.white),
            title: const Text(
              'Solved Papers',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Handle navigation to solved papers
              Get.to(() => Downloads(), transition: Transition.rightToLeft);
            },
            trailing: Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 22,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget solutionWidget(
  BuildContext context,
  String subtitle,
  String imagePath,
  String title,
  VoidCallback onTap,
) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(253, 228, 23, 57),
        borderRadius: BorderRadius.circular(50),
      ),

      // color: Colors.white,
      height: 80,
      width: MediaQuery.of(context).size.width * 0.97,
      child: Center(
        child: ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 35,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              scale: 0.2,
              color: Colors.white,
            ),
          ),
          title: Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20)),
          subtitle: Text(
            subtitle,
            style: TextStyle(color: Colors.white),
          ),
          trailing: Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
    ),
  );
}
