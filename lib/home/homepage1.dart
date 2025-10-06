import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jecrc/components/appBar.dart';
import 'package:jecrc/components/widgets.dart';
import 'package:jecrc/home/homepage.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final List<String> _colleges = [
    'JECRC University',
    // 'Manipal University Jaipur',
    // 'Poornima University',
    // 'Malaviya National Institute of Technology (MNIT)',
    // 'The LNM Institute of Information Technology (LNMIIT)',
    // 'Amity University Jaipur',
    // 'Rajasthan Institute of Engineering and Technology (RIET)',
    // 'SKIT Jaipur',
    // 'Jaipur National University',
    // 'Apex University Jaipur',
  ];

  final Map<String, String> _collegeLogos = {
    'JECRC University':
        'https://upload.wikimedia.org/wikipedia/en/9/9f/JECRC_University_logo.png',
    // 'Manipal University Jaipur':
    //     'https://upload.wikimedia.org/wikipedia/en/7/7e/Manipal_University_logo.png',
    // 'Poornima University':
    //     'https://upload.wikimedia.org/wikipedia/en/3/3d/Poornima_University_logo.png',
    // 'Malaviya National Institute of Technology (MNIT)':
    //     'https://upload.wikimedia.org/wikipedia/en/4/4e/MNIT_Jaipur_Logo.png',
    // 'The LNM Institute of Information Technology (LNMIIT)':
    //     'https://upload.wikimedia.org/wikipedia/en/5/5e/LNMIIT_logo.png',
    // 'Amity University Jaipur':
    //     'https://upload.wikimedia.org/wikipedia/en/1/1b/Amity_University_logo.png',
    // 'Rajasthan Institute of Engineering and Technology (RIET)':
    //     'https://upload.wikimedia.org/wikipedia/en/6/6d/RIET_Jaipur_logo.png',
    // 'SKIT Jaipur':
    //     'https://upload.wikimedia.org/wikipedia/en/8/8f/SKIT_Jaipur_logo.png',
    // 'Jaipur National University':
    //     'https://upload.wikimedia.org/wikipedia/en/2/2d/Jaipur_National_University_logo.png',
    // 'Apex University Jaipur':
    //     'https://upload.wikimedia.org/wikipedia/en/0/0a/Apex_University_logo.png',
  };

  List<String> _filteredColleges = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filteredColleges = _colleges;
  }

  void _filterColleges(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredColleges = _colleges;
      } else {
        _filteredColleges = _colleges.where((college) {
          return college.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton(context),
      backgroundColor: Colors.black,
      appBar: CustomAppBar(title: "Colleges"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search Colleges...',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[800],
                prefixIcon: Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: _filterColleges,
            ),
            SizedBox(height: 20),
            Expanded(
              child: _filteredColleges.isNotEmpty
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        crossAxisSpacing: 16, // Space between columns
                        mainAxisSpacing: 16, // Space between rows
                        // childAspectRatio:
                        //     3 / 2, // Adjust the size ratio of items
                      ),
                      itemCount: _filteredColleges.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => Homepage(),
                                transition: Transition.rightToLeft);
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.9,
                            decoration: BoxDecoration(
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.white,
                              //     spreadRadius: 1,
                              //     blurRadius: 5,
                              //     offset: Offset(4, 4),
                              //   ),
                              // ],
                                border: Border.all(
                                    color: Color.fromARGB(253, 228, 23, 57),
                                    width: 3),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            // elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "assets/images/Jecrc-University.png",
                                    height: 100,
                                  ),
                                  Text(
                                    "Jecrc University",
                                    style: GoogleFonts.basic(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(253, 228, 23, 57),
                                    ),
                                    // TextStyle(
                                    //     fontWeight: FontWeight.bold,
                                    //     fontSize: 20,
                                    //     color:
                                    //         Color.fromARGB(253, 228, 23, 57)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'No colleges found.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Stay Tuned..\nWe are adding more colleges soon!',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
