import 'package:flutter/material.dart';
import 'package:jecrc/components/appBar.dart';
import 'package:jecrc/components/widgets.dart';

class Alumini extends StatefulWidget {
  const Alumini({super.key});

  @override
  State<Alumini> createState() => _AluminiState();
}

class _AluminiState extends State<Alumini> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton(context),
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        title: "Aluminis",
        leadingIcon: Icons.arrow_back,
        onLeadingIconTap: () {
          Navigator.of(context).pop();
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          4,
          (index) {
            return alumniCard(
              context: context,
              name: "Arpit Saxena",
              imagePath: "assets/images/under3.png",
            );
          },
        ),
      ),
    );
  }
}
