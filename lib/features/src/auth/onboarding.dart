// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:get/get.dart';
// import 'package:jecrc/home/homepage.dart';
// import 'package:jecrc/underGraduate/schoolsUI.dart';

// class Onboarding extends StatefulWidget {
//   const Onboarding({super.key});

//   @override
//   State<Onboarding> createState() => _OnboardingState();
// }

// class _OnboardingState extends State<Onboarding> {
//   final CarouselSliderController _controller = CarouselSliderController();
//   int _currentIndex = 0;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     setState(() {
//       _currentIndex == 0;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SizedBox(
//             height: 20,
//           ),
//           // Carousel Slider
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Container(
//                 height: 50,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: Colors.white12),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     // Display current slide index (1 of 3)
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: RichText(
//                         text: TextSpan(
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           children: [
//                             // Current index in white color
//                             TextSpan(
//                               text: "${_currentIndex + 1}",
//                               style: const TextStyle(
//                                 color: Colors.white,
//                               ),
//                             ),
//                             // "of 2" in white24 color
//                             const TextSpan(
//                               text: " of 2",
//                               style: TextStyle(
//                                 color: Colors.white24, // white24 color
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),

//                     // Dots with rectangle shape for active slide
//                     Row(
//                       children: List.generate(
//                         2, // Number of slides
//                         (index) => AnimatedContainer(
//                           duration: const Duration(milliseconds: 300),
//                           margin: const EdgeInsets.symmetric(horizontal: 5),
//                           height: 10,
//                           width: _currentIndex == index
//                               ? 80
//                               : 50, // Wider for active dot (rectangle)
//                           decoration: BoxDecoration(
//                             color: _currentIndex == index
//                                 ? Colors.red
//                                 : Colors.white24,
//                             borderRadius: _currentIndex == index
//                                 ? BorderRadius.circular(
//                                     5) // Rectangle for active dot
//                                 : BorderRadius.circular(
//                                     50), // Circle for inactive dot
//                           ),
//                         ),
//                       ),
//                     ),
//                     // Skip Button
//                     Padding(
//                       padding: const EdgeInsets.only(right: 20),
//                       child: TextButton(
//                         onPressed: () {
//                           Get.to(() => Homepage(), transition: Transition.rightToLeft);
//                           // Handle skip action, navigate to next screen or main screen
//                           print("Skip button pressed");
//                           // Example: Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => NextScreen()));
//                         },
//                         child: const Text(
//                           "Skip",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           CarouselSlider(
//             items: [
//               // Carousel item 1: Image with text
//               Container(
//                 // alignment: Alignment.bottomLeft,
//                 color: Colors.black,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const SizedBox(height: 20),
//                      Flexible(
//                        child: Text(
//                         "Welcome to the JECRC UNIVERSITY",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                                            ),
//                      ),
//                     const SizedBox(height: 10),
//                      Flexible(
//                        child: Text(
//                         "Access JECRC's past question papers and ace your exams with ease.",
//                         style: TextStyle(
//                           fontSize: 30,
//                           color: Colors.white,
//                         ),
//                                            ),
//                      ),
//                   ],
//                 ),
//               ),
//               // Carousel item 2: Image with text
//               Column(
//                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     alignment: Alignment.bottomLeft,
//                     color: Colors.black,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const SizedBox(height: 20),
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.start,
//                            children: [
//                              Text(
//                               "Explore our benefits",
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                                                      ),
//                            ],
//                          ),
//                         const SizedBox(height: 10),
//                         const Text(
//                           "Download papers & study without interruptions",
//                           style: TextStyle(
//                             fontSize: 26,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 60),
//                   Container(
//                     height: 70,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         color: Colors.white12),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                               color: Colors.black, shape: BoxShape.circle),
//                           height: 55,
//                           width: 55,
//                           child: Icon(
//                             Icons.arrow_downward_rounded,
//                             color: Colors.white,
//                           ),
//                         ),

//                         Text(
//                           "Access Papers Anytime",
//                           style: TextStyle(color: Colors.white,
//                           fontSize: 20),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         // Image.asset('assets/images/download.jpg',)
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     height: 70,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         color: Colors.white12),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                               color: Colors.black, shape: BoxShape.circle),
//                           height: 55,
//                           width: 55,
//                           child: Icon(
//                             Icons.arrow_downward_rounded,
//                             color: Colors.white,
//                           ),
//                         ),

//                         Text(
//                           "Boost Your Preparation",
//                           style: TextStyle(color: Colors.white,
//                               fontSize: 20),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         // Image.asset('assets/images/download.jpg',)
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     height: 70,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         color: Colors.white12),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                               color: Colors.black, shape: BoxShape.circle),
//                           height: 55,
//                           width: 55,
//                           child: Icon(
//                             Icons.arrow_downward_rounded,
//                             color: Colors.white,
//                           ),
//                         ),

//                         Text(
//                           "Upload Your Study Notes",
//                           style: TextStyle(color: Colors.white,
//                               fontSize: 20),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         // Image.asset('assets/images/download.jpg',)
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ],
//             options: CarouselOptions(
//               height: 600,
//               initialPage: 0,
//               enableInfiniteScroll: false,
//               enlargeCenterPage: true,
//               onPageChanged: (index, reason) {
//                 setState(() {
//                   _currentIndex = index;
//                 });
//               },
//             ),
//             carouselController: _controller,
//           ),
//           const SizedBox(height: 20),
//         ],
//       ),
//       floatingActionButton: Stack(
//         alignment: Alignment.center,
//         children: [
//           TweenAnimationBuilder<double>(
//             tween: Tween<double>(
//               begin: 0.0,
//               end: (_currentIndex + 1) / 2, // Target progress value
//             ),
//             duration: const Duration(milliseconds: 500), // Animation duration
//             builder: (context, value, child) {
//               return SizedBox(
//                 width: 80,
//                 height: 80,
//                 child: CircularProgressIndicator(
//                   value: value, // Animated progress value
//                   strokeWidth: 3.5,
//                   color: Colors.red, // Progress color
//                   backgroundColor: Colors.white, // Background ring color
//                 ),
//               );
//             },
//           ),
//           FloatingActionButton(
//             shape: const CircleBorder(),
//             onPressed: () {
//               _currentIndex++;
//               if (_currentIndex == 2) {
//                 // Navigate to Homepage after the last slide
//                 Get.to(() => const Homepage(), transition: Transition.rightToLeft);
//               } else {
//                 // Otherwise, move to the next slide
//                 // int nextIndex = _currentIndex + 1;
//                 _controller.animateToPage(_currentIndex);
//                 // setState(() {
//                 //   _currentIndex = nextIndex; // Update the current index
//                 // });
//               }
//             },
//             backgroundColor: Colors.red,
//             child: const Icon(
//               Icons.arrow_forward,
//               color: Colors.white,
//             ),
//           ),

//       ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:jecrc/home/homepage.dart';
import 'package:jecrc/home/homepage1.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  // final CarouselController _controller = CarouselController();
  final CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.02),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Container(
                height: screenHeight * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.05),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: "${_currentIndex + 1}",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const TextSpan(
                              text: " of 2",
                              style: TextStyle(
                                color: Colors.white24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: List.generate(
                        2,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.02),
                          height: screenHeight * 0.015,
                          width: _currentIndex == index
                              ? screenWidth * 0.15
                              : screenWidth * 0.1,
                          decoration: BoxDecoration(
                            color: _currentIndex == index
                                ? Colors.red
                                : Colors.white24,
                            borderRadius: BorderRadius.circular(
                                _currentIndex == index ? 5 : 50),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.05),
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => Homepage(),
                              transition: Transition.rightToLeft);
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: CarouselSlider(
              items: [
                // buildSlide(screenWidth, screenHeight, "Welcome to JECRC UNIVERSITY", "Access JECRC's past question papers and ace your exams with ease."),
                // buildSlide(screenWidth, screenHeight, "Explore our benefits", "Download papers & study without interruptions."),
                Container(
                  // alignment: Alignment.bottomLeft,
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.02),
                      Flexible(
                        child: Text(
                          "Welcome to the JECRC UNIVERSITY",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Flexible(
                        child: Text(
                          "Access JECRC's past question papers and ace your exams with ease.",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Carousel item 2: Image with text
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: screenHeight * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Explore our benefits",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            "View papers & study without interruptions",
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.06),
                    Flexible(
                      child: Container(
                        height: screenHeight * 0.10, // Increased height safely
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white12,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle),
                                height: 55,
                                width: 55,
                                child: Icon(
                                  Icons.arrow_downward_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Access Papers Anytime",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenHeight * 0.025),
                              ),
                              SizedBox(width: screenHeight * 0.01),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Flexible(
                      child: Container(
                        height: screenHeight * 0.10, // Increased height safely
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black, shape: BoxShape.circle),
                              height: 55,
                              width: 55,
                              child: Icon(
                                Icons.arrow_downward_rounded,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Boost Your Preparation",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.025),
                            ),
                            SizedBox(width: screenHeight * 0.01),
                          ],
                        ),
                      ),
                    ),

                    // Container(
                    //   height: screenHeight * 0.07,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(screenHeight * 0.03),
                    //       color: Colors.white12),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       Container(
                    //         decoration: BoxDecoration(
                    //             color: Colors.black, shape: BoxShape.circle),
                    //         height: 55,
                    //         width: 55,
                    //         child: Icon(
                    //           Icons.arrow_downward_rounded,
                    //           color: Colors.white,
                    //         ),
                    //       ),

                    //       Text(
                    //         "Upload Your Study Notes",
                    //         style: TextStyle(color: Colors.white,
                    //             fontSize: 20),
                    //       ),

                    //       // Image.asset('assets/images/download.jpg',)
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ],
              options: CarouselOptions(
                height: screenHeight * 0.6,
                initialPage: 0,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              carouselController: _controller,
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
        ],
      ),
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween<double>(
              begin: 0.0,
              end: (_currentIndex + 1) / 2, // Target progress value
            ),
            duration: const Duration(milliseconds: 500), // Animation duration
            builder: (context, value, child) {
              return SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  value: value, // Animated progress value
                  strokeWidth: 3.5,
                  color: Colors.red, // Progress color
                  backgroundColor: Colors.white, // Background ring color
                ),
              );
            },
          ),
          FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {
              _currentIndex++;
              if (_currentIndex == 2) {
                // Navigate to Homepage after the last slide
                Get.to(() => const MainHomePage(),
                    transition: Transition.rightToLeft);
              } else {
                // Otherwise, move to the next slide
                // int nextIndex = _currentIndex + 1;
                _controller.animateToPage(_currentIndex);
                // setState(() {
                //   _currentIndex = nextIndex; // Update the current index
                // });
              }
            },
            backgroundColor: Colors.red,
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSlide(
      double screenWidth, double screenHeight, String title, String subtitle) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
