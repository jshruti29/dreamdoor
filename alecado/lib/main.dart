import 'package:flutter/material.dart';

import 'Vendor/LandingPagesVendor/one_vendor_landing_page.dart';

void main() {
  runApp(const MyAppu());
}

class MyAppu extends StatelessWidget {
  const MyAppu({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: One_Vendor_LandingPage(),
    );
  }
}
