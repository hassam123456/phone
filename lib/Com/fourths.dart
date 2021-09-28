import 'package:flutter/material.dart';

import '../googlemap.dart';
import 'cart_screen.dart';

class Fourth extends StatefulWidget {

  @override
  State<Fourth> createState() => _FourthState();
}

class _FourthState extends State<Fourth> {
  String dropdownvalue = 'Service1';
  var items =  ['Service1','Service2','Service3','Service4','Service5'];
  int _currentIndex=0;
  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
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
                      builder: (ctx) => CartScreens(),
                    ),
                  );

                })

        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                backgroundColor: Colors.blue

            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile'),
                backgroundColor: Colors.blue
            ), BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Search'),
                backgroundColor: Colors.blue
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.help),
                title: Text('Help '),
                backgroundColor: Colors.blue
            )




          ],
          onTap: (index){

            setState(() {
              _currentIndex = index;

            });
          },
        ),

        body: ListView(

          children: [

            Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset('images/logo1.png',
                    height: 100.0,
                    width: 100.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Service Registration',
                  style: TextStyle(
                    fontSize: 22.0,color: Colors.black,fontWeight: FontWeight.bold,
                  ),
                ),
               SizedBox(
                 height: 100.0,
               ),
                DropdownButton(
                  value: dropdownvalue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items:items.map((String items) {
                    return DropdownMenuItem(
                        value: items,
                        child: Text(items)
                    );
                  }
                  ).toList(),
                  onChanged: (String newValue){
                    setState(() {
                      dropdownvalue = newValue;
                    });
                  },
                ),
                TextField(
                  style: TextStyle(
                    fontSize: 15.0
                  ),
                  decoration: InputDecoration(
                    hintText: "DD/MM/YY",
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                TextField(
                  style: TextStyle(
                      fontSize: 15.0
                  ),
                  decoration: InputDecoration(
                    hintText: "HH:MM:SS",
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                TextField(
                  style: TextStyle(
                      fontSize: 15.0
                  ),
                  decoration: InputDecoration(
                    hintText: "Location Name:",
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                TextField(
                  style: TextStyle(
                      fontSize: 15.0
                  ),
                  decoration: InputDecoration(
                    hintText: "Estimated Duration: [hours/days]",
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  'Geo Tagging ',
                  style: TextStyle(
                    fontSize: 15.0,color: Colors.black,fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  style: TextStyle(
                      fontSize: 15.0
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter longitudes",
                  ),
                ),
                TextField(
                  style: TextStyle(
                      fontSize: 15.0
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter latitudes ",
                  ),
                ),
                FlatButton(
                  child: Text(
                    'Google Map',
                  ),
                  color: Colors.blueGrey,
                  onPressed: (){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => Ghome(),
                      ),
                    );
                  },

                )
              ],

            ),
          ],
        )

    );


  }
}
