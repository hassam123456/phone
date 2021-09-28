import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_screen.dart';



class Bolo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FlutterDemo',
      home: CartScreens(),

    );

  }
}
