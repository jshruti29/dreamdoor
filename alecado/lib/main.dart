import 'package:alecado/Customer/UI/Finish_order.dart';
import 'package:alecado/Customer/UI/Ringing.dart';
import 'package:alecado/Customer/UI/Set_location.dart';
import 'package:alecado/Customer/UI/chat_page.dart';
import 'package:alecado/Customer/UI/notification.dart';
import 'package:alecado/Customer/UI/your_orders.dart';
import 'package:alecado/geo_location.dart';
import 'package:alecado/map.dart';
import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'Customer/UI/product.dart';
import 'Customer/UI/voucher_promo.dart';
=======

>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
      home: Product_Page(),
=======
      home: setlocation(),
>>>>>>> Stashed changes
    );
  }
}
