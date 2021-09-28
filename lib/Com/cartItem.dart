
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'cartController.dart';

class CartItem extends StatefulWidget {

final String tittle;
final int price;
final int quantity;
  const CartItem({Key key, this.tittle, this.price, this.quantity}) : super(key: key);


  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final CartController _cartController = Get.find();
  int counter =0;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
      title: new Text(
        widget.tittle,
        style:  TextStyle(
          fontSize: 20, color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,

        ),
      ),
        trailing: SizedBox(
          width: 200,
          child: Wrap(
            alignment: WrapAlignment.spaceBetween, children: [
       Row(
         children: [
           counter != 0
           ? new IconButton( icon: new Icon(
             Icons.remove,
             color: Theme.of(context).primaryColor,

           ),
               onPressed: (){
            setState(() {
              counter--;
              _cartController.decrement(widget.price);
            });
               }


           )
               : new Container(),
           new Text(" $counter", style: TextStyle(fontSize: 20),),
           new IconButton( icon: new Icon(Icons.add,
           color: Theme.of(context).primaryColor),
             onPressed: (){
             setState(() {
               counter++;
               _cartController.increment(widget.price);
             });
             },
           ),

         ],
       )

              ]),
        ),
      ),
    );
  }
}
