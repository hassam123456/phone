

import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/state_manager.dart';


import '../main.dart';
import 'cartController.dart';
import 'cartItem.dart';

class CartScreens extends StatelessWidget {

final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
         leading: IconButton(
        icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
    ),
    onPressed: () {
    Navigator.of(context).pushReplacement(
    MaterialPageRoute(
    builder: (ctx) => MyApp(),
    ),
    );

    })

      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            'Required Service Details',
            style: TextStyle(
                fontSize: 22.0,color: Colors.black
            ),
          ),
            ListView(



              shrinkWrap: true,
              children: new List.generate(
                  5, (i) => CartItem(
                  tittle: "Item #$i",
                  price: 50,

                ),

                )

            ),
            ElevatedButton(onPressed: (){}, child: Obx(()=> Text("Total Payment: "+cartController.total.value.toString(),
                        style: TextStyle(
              fontSize: 20,
              color: Colors.white,

            ),

            ))),
          Text(
            'Total Items (5)',
            style: TextStyle(
              fontSize: 22.0
            ),
          )
        ],
        ),
      ),
    );
  }
}
