import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'main.dart';


class Ghome extends StatefulWidget {
  @override
  _GhomeState createState() => _GhomeState();
}

class _GhomeState extends State<Ghome> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  double zoomVal = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => MyApp(),
              ),
            );

          },
        ),
        actions: [
          // IconButton(
          //     icon: Icon(Icons.search),
          //     onPressed: () {
          //
          //     }
          // ),
        ],

        flexibleSpace: Container(
          color: Colors.greenAccent,
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [Colors.pink,
          //       Colors.greenAccent],
          //     begin: const FractionalOffset(0.0,0.0),
          //     end: const FractionalOffset(1.0,0.0),
          //     stops: [0.0,1.0],
          //     tileMode: TileMode.clamp,
          //   ),
          // ),
        ),
        title: Text("Map",style: TextStyle(color: Colors.white,fontSize: 55.0,fontFamily: "Signatra"),),
        centerTitle: true,
      ),



      body: Stack(
        children: [
          _googleMap(context),
          _zoomMinusFunction(),
          _zoomPlusFunction(),

          _buildContainer(),
        ],
      ),
    );
  }
  Widget _zoomMinusFunction() {

    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(Icons.zoom_out,color:Color(0xff6200ee)),
          onPressed: () {
            zoomVal--;
            _minus( zoomVal);
          }),
    );
  }
  Widget _zoomPlusFunction() {

    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(Icons.zoom_in,color:Color(0xff6200ee)),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }
  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(24.876921, 67.136776), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(24.876921, 67.136776), zoom: zoomVal)));
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(width: 10.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://st2.depositphotos.com/1006832/6017/i/950/depositphotos_60178113-stock-photo-clothes-shop-interior.jpg",
                  24.876921, 67.136776, "Service1"
              ),
            ),
            SizedBox(width: 10.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://st2.depositphotos.com/1006832/6017/i/950/depositphotos_60178113-stock-photo-clothes-shop-interior.jpg",
                  24.876921, 67.116776, "Service2"
              ),
            ),
            SizedBox(width: 10.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://st2.depositphotos.com/1006832/6017/i/950/depositphotos_60178113-stock-photo-clothes-shop-interior.jpg",
                  24.876921, 67.116776, "Service3"
              ),
            ),
            SizedBox(width: 10.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://st2.depositphotos.com/1006832/6017/i/950/depositphotos_60178113-stock-photo-clothes-shop-interior.jpg",
                  24.876921, 67.116776, "Service4"
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://st2.depositphotos.com/1006832/6017/i/950/depositphotos_60178113-stock-photo-clothes-shop-interior.jpg",
                  24.876921, 67.116776, "Service5"
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat, double long, String shopName) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(_image),
                      ),
                    ),),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(shopName),
                    ),
                  ),

                ],)
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String shopName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(shopName,
                style: TextStyle(
                    color: Color(0xff6200ee),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
        SizedBox(height: 5.0),
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    child: Text(
                      "4.1",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    )),
                Container(
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star_half,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                    child: Text(
                      "(946)",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    )),
              ],
            )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
              "Pakistani \u00B7 \Rs. \u00B7 1.6 mi",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
              "Closed \u00B7 Opens 17:00 Thu",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            )),
        SizedBox(height: 5.0),
        RaisedButton(
onPressed: (){},
          child: Text("Order Now", style: TextStyle(color: Colors.white),
          ),
        ),],
    );
  }

  Widget _googleMap(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
              target: LatLng(24.876921, 67.126776), zoom: 12),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: {
            karachi1Marker,karachi2Marker,karachi3Marker,karachi4Marker
          }
      ),

    );
  }

  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }
}

Marker karachi1Marker = Marker(
  markerId: MarkerId("karachi1"),
  position: LatLng(24.876921, 67.126776),
  infoWindow: InfoWindow(title: "Service1"),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
);

Marker karachi2Marker = Marker(
  markerId: MarkerId("karachi2"),
  position: LatLng(24.876921, 67.116776),
  infoWindow: InfoWindow(title: "Service2"),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
);
Marker karachi3Marker = Marker(
  markerId: MarkerId("karachi3"),
  position: LatLng(24.876921, 67.136776),
  infoWindow: InfoWindow(title: "Service3"),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
);
Marker karachi4Marker = Marker(
  markerId: MarkerId("karachi3"),
  position: LatLng(24.876921, 67.146776),
  infoWindow: InfoWindow(title: "Service4"),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
);
Marker karachi5Marker = Marker(
  markerId: MarkerId("karachi3"),
  position: LatLng(24.876921, 67.146776),
  infoWindow: InfoWindow(title: "Service5"),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
);