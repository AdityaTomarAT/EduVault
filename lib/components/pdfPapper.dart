// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:jecrc/components/ad_helper.dart';
import 'package:jecrc/components/appBar.dart';
import 'package:jecrc/features/src/solutions/solutions.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class PdfViewerPage extends StatefulWidget {
  final String pdfUrl;
  final String fileName;

  const PdfViewerPage(
      {super.key, required this.pdfUrl, required this.fileName});
  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  File? Pfile;
  bool isLoading = false;
  String? errorMessage;
  
  Future<void> loadNetwork() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });
      
      final response = await http.get(Uri.parse(widget.pdfUrl));
      
      if (response.statusCode != 200) {
        throw Exception('Failed to load PDF: HTTP ${response.statusCode}');
      }
      
      final bytes = response.bodyBytes;
      final filename = basename(widget.pdfUrl);
      final dir = await getApplicationDocumentsDirectory();
      var file = File('${dir.path}/$filename');
      await file.writeAsBytes(bytes, flush: true);
      
      if (mounted) {
        setState(() {
          Pfile = file;
          isLoading = false;
        });
      }
      
      print('PDF loaded successfully: ${Pfile?.path}');
    } catch (e) {
      print('Error loading PDF: $e');
      if (mounted) {
        setState(() {
          isLoading = false;
          errorMessage = 'Failed to load PDF: ${e.toString()}';
        });
      }
    }
  }

  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    BannerAd(
            size: AdSize.banner,
            adUnitId: AdHelper.bannerAdUnitId,
            listener: BannerAdListener(
              onAdLoaded: (ad) {
                setState(() {
                  _bannerAd = ad as BannerAd;
                });
              },
              onAdFailedToLoad: (ad, err) {
                print('Failed to load a banner ad: ${err.message}');
                ad.dispose();
              },
            ),
            request: AdRequest())
        .load();
    loadNetwork();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: 50,
        width: 120,
        child: FloatingActionButton(child: Text("Get Solutions", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(10),
          // ),
          backgroundColor: Color.fromARGB(253, 228, 23, 57),
          onPressed: () {
            Get.to(()=> Solutions(), transition: Transition.rightToLeft, duration: Duration(milliseconds: 400));
          },
        ),
      ),
      bottomNavigationBar: (_bannerAd != null)
          ? Container(
              width: _bannerAd!.size.width.toDouble(),
              height: _bannerAd!.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd!),
              // color: Colors.red,
            )
          : SizedBox.shrink(),
      appBar: CustomAppBar(
        title: "Paper 2023",
        leadingIcon: Icons.arrow_back,
        onLeadingIconTap: () {
          Navigator.of(context).pop();
        },
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, size: 64, color: Colors.red),
                      SizedBox(height: 16),
                      Text(
                        errorMessage!,
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: loadNetwork,
                        child: Text('Retry'),
                      ),
                    ],
                  ),
                )
              : Pfile != null
                  ? Container(
                      child: Center(
                        child: PDFView(
                          filePath: Pfile!.path,
                        ),
                      ),
                    )
                  : Center(
                      child: Text('No PDF file available'),
                    ),
    );
  }
}
