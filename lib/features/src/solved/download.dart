import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jecrc/components/appBar.dart';
import 'package:jecrc/components/pdfPapper.dart';

class Downloads extends StatefulWidget {
  const Downloads({super.key});

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  // Mock data structure for subjects and their downloaded papers
  final Map<String, List<String>> subjectDownloads = {
    "Math": ["Algebra.pdf", "Calculus.pdf"],
    "Physics": ["Mechanics.pdf", "Optics.pdf"],
    "Chemistry": ["Organic.pdf", "Inorganic.pdf"],
  };

  @override
  void initState() {
    super.initState();
    if (subjectDownloads.isNotEmpty) {
      _tabController =
          TabController(length: subjectDownloads.keys.length, vsync: this);
    }
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        title: "Downloads",
        leadingIcon: Icons.arrow_back,
        onLeadingIconTap: () {
          Navigator.of(context).pop();
        },
      ),
      body: subjectDownloads.isNotEmpty && _tabController != null
          ? Column(
              children: [
                // Tab Bar for Subjects
                Container(
                  height: MediaQuery.of(context).size.height * 0.067,
                  width: MediaQuery.of(context).size.width,
                  child: TabBar(
                    // tabAlignment: Ta÷,
                    dividerColor: Colors.black,
                    controller: _tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Color.fromARGB(253, 228, 23, 57),
                    tabs: subjectDownloads.keys
                        .map((subject) => Tab(text: subject))
                        .toList(),
                  ),
                ),

                // Tab Bar View for Downloaded Papers
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: subjectDownloads.values.map((papers) {
                      return papers.isNotEmpty
                          ? ListView.builder(
                              itemCount: papers.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  trailing: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  leading: Icon(Icons.file_present,
                                      color: Colors.white),
                                  title: Text(
                                    papers[index],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    Get.to(
                                      () => PdfViewerPage(
                                        pdfUrl:
                                            "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
                                        fileName: "Paper 2022",
                                      ),
                                      transition: Transition.rightToLeft,
                                    );
                                  },
                                );
                              },
                            )
                          : Center(
                              child: Text(
                                'No downloads available',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            );
                    }).toList(),
                  ),
                ),
              ],
            )
          : Center(
              child: Text(
                'No subjects available',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
    );
  }
}
