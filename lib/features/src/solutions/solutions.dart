import 'package:flutter/material.dart';
import 'package:jecrc/components/appBar.dart';
import 'package:jecrc/components/widgets.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

class Solutions extends StatefulWidget {
  const Solutions({super.key});

  @override
  State<Solutions> createState() => _SolutionsState();
}

class _SolutionsState extends State<Solutions> {
  // var _razorpay = Razorpay();

  // void _handlePaymentSuccess(PaymentSuccessResponse response) {
  //   // Do something when payment succeeds
  // }

  // void _handlePaymentError(PaymentFailureResponse response) {
  //   // Do something when payment fails
  // }

  // void _handleExternalWallet(ExternalWalletResponse response) {
  //   // Do something when an  external wallet is selected
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        title: "Solutions",
        leadingIcon: Icons.arrow_back,
        onLeadingIconTap: () {
          Navigator.of(context).pop();
        },
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ListView(
            shrinkWrap: true,
            // crossAxisAlignment: CrossAxisAlignment.spaceEvenly,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              1,
              (index) {
                return solutionWidget(
                  context,
                  "AI-Generated Solutions ",
                  "assets/images/ai.png",
                  "Get Solution (₹99/-)",
                  () async {
                    var options = {
                      // 'external_wallet'
                      'key': 'rzp_test_rYtVhGP3rOX9hv',
                      'amount': (1 * 100),
                      'name': 'College Solutions',
                      'description': "Eddy's Solutions",
                      'timeout': 60,
                      'prefill': {
                        'contact': "9899247397",
                        'email': "test@gmail.com"
                      }
                    };
                    // _razorpay.open(options);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
