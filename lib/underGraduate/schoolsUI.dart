import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For loading JSON files
import 'package:get/get.dart';
import 'package:jecrc/components/appBar.dart';
import 'package:jecrc/components/schools.dart';

import '../components/widgets.dart';

class UnderGraduate extends StatefulWidget {
  const UnderGraduate({super.key});

  @override
  State<UnderGraduate> createState() => _UnderGraduateState();
}

class _UnderGraduateState extends State<UnderGraduate> {
  List<Map<String, dynamic>> schools = [];

  @override
  void initState() {
    super.initState();
    _loadSchoolsData();
  }

  Future<void> _loadSchoolsData() async {
    final String jsonData =
        await rootBundle.loadString('assets/json/data.json');
    final List<dynamic> data = json.decode(jsonData);
    setState(() {
      schools = List<Map<String, dynamic>>.from(data);
      print('data: \$schools');
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: drawer(
          context: context,
          email: 'johnDoe@gmail.com ',
          name: 'John Doe',
          phone: '+91 9899247397'),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: floatingActionButton(context),
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        title: "SCHOOLS",
        leadingIcon: Icons.menu,
        onLeadingIconTap: () {
          // ScaffoldMessenger.of(context).openDrawer();
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
      body: schools.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SchoolsGrid(
                schools: schools,
              ),
            ),
    );
  }
}
