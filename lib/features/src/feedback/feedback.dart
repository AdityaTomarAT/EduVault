import 'package:flutter/material.dart';
import 'package:jecrc/components/appBar.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({super.key});

  @override
  State<FeedBackScreen> createState() => _FeedbackState();
}

class _FeedbackState extends State<FeedBackScreen> {
  int selectedEmoji = 4; // Default selected emoji index
  Map<String, bool> feedbackOptions = {};

  TextEditingController commentController = TextEditingController();
  TextEditingController missingCourseController = TextEditingController();
  String? isCourseMissing;

  List<String> emojis = ["😡", "☹️", "😐", "🙂", "😍"];
  List<String> emojiTexts = ["Bad", "Good", "Average", "Excellent", "Awesome"];

  @override
  void initState() {
    super.initState();
    feedbackOptions = getFeedbackOptions(4); 
  }

  Map<String, bool> getFeedbackOptions(int index) {
    if (index == 0 || index == 1) {
      return {
        "Difficult to use": false,
        "Slow performance": false,
        "Poor customer support": false,
        "Lack of important features": false,
        "Navigation issues": false,
      };
    } else if (index == 2) {
      return {
        "User Friendly": false,
        "Needs improvement": false,
        "Satisfactory support": false,
        "Better UI required": false,
        "Limited functionality": false,
      };
    } else {
      return {
        "User Friendly": false,
        "Easy to access": false,
        "Include all papers": false,
        "Customer support": false,
        "Overall service": false,
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isTablet = screenWidth > 600;

    return Scaffold(
      appBar: CustomAppBar(
        title: "FeedBack",
        leadingIcon: Icons.arrow_back,
        onLeadingIconTap: () {
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: Text(
                "Let us know what you think about us..!!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isTablet ? 24 : 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(253, 228, 23, 57),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Rate your experience",
                    style: TextStyle(
                      fontSize: isTablet ? 20 : 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedEmoji = index;
                      feedbackOptions = getFeedbackOptions(index);
                    });
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: selectedEmoji == index
                            ? Color.fromARGB(253, 228, 23, 57)
                            : Colors.transparent,
                        radius: isTablet ? 30 : 22,
                        child: Text(
                          emojis[index],
                          style: TextStyle(fontSize: isTablet ? 30 : 24),
                        ),
                      ),
                      if (selectedEmoji == index)
                        Text(
                          emojiTexts[index],
                          style: TextStyle(
                            fontSize: isTablet ? 16 : 12,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(253, 228, 23, 57),
                          ),
                        ),
                    ],
                  ),
                );
              }),
            ),
            SizedBox(height: screenHeight * 0.03),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(253, 228, 23, 57),
              ),
              child: Center(
                child: Text(
                  "What did you like?",
                  style: TextStyle(color: Colors.white, fontSize: isTablet ? 18 : 16),
                ),
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: feedbackOptions.keys.map((String key) {
                return CheckboxListTile(
                  activeColor: Color.fromARGB(253, 228, 23, 57),
                  title: Text(
                    key,
                    style: TextStyle(color: Colors.white),
                  ),
                  value: feedbackOptions[key],
                  onChanged: (bool? value) {
                    setState(() {
                      feedbackOptions[key] = value!;
                    });
                  },
                );
              }).toList(),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Color.fromARGB(253, 228, 23, 57),
              child: Center(
                child: Text(
                  "Is there any course missing?",
                  style: TextStyle(color: Colors.white, fontSize: isTablet ? 18 : 16),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    activeColor: Color.fromARGB(253, 228, 23, 57),
                    title: Text("Yes", style: TextStyle(color: Colors.white)),
                    value: "Yes",
                    groupValue: isCourseMissing,
                    onChanged: (String? value) {
                      setState(() {
                        isCourseMissing = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    activeColor: Color.fromARGB(253, 228, 23, 57),
                    title: Text("No", style: TextStyle(color: Colors.white)),
                    value: "No",
                    groupValue: isCourseMissing,
                    onChanged: (String? value) {
                      setState(() {
                        isCourseMissing = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            if (isCourseMissing == "Yes")
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: missingCourseController,
                      decoration: InputDecoration(
                        hintText: "Your Name",
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: missingCourseController,
                      decoration: InputDecoration(
                        hintText: "Enter missing course",
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: commentController,
                decoration: InputDecoration(
                  hintText: "Describe your experience here (optional)",
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(color: Colors.white70),
                ),
                maxLines: 3,
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(253, 228, 23, 57),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () {
                  print("Selected Emoji: ${selectedEmoji + 1}");
                  print("Feedback Options: $feedbackOptions");
                  print("Comment: ${commentController.text}");
                },
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white, fontSize: isTablet ? 18 : 16),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
