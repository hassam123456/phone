import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_verification/screens/home_screen.dart';
import 'package:phone_verification/screens/login_screen.dart';

import '../main.dart';
import 'cart_screen.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => MyApp(),
                  ),
                );
              })),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Spacer(),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.black12,
                        radius: 80.0,
                        child: Image.asset('images/logo1.png',
                          height: 120.0,
                          width: 120.0,
                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        'Making your life easy',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),

                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                    ),
                    Text(
                      'Powered by Hasnat '
                      ,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),

                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      'Version 1.0.1'
                      ,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}