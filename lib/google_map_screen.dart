import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vector_math/vector_math.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Position position ;
  static double lat;
  static double long;
  List<Marker> listMarker = [];
  Completer<GoogleMapController> _controller = Completer();

  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  static final CameraPosition currentCameraPosition = CameraPosition(
    //bearing: 19.8334901395799,
      target: LatLng(lat, long,),
      tilt: 59.440717697143555,
      zoom: 14.4746);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Maps Demo"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(22.5448131, 88.3403198), zoom: 11),
      ),
      floatingActionButton: FloatingActionButton.extended(
        // onPressed: distFrom1,
        onPressed: (){
          getCurrentPosition().then((value) => _goToCurrentLoc());
        },
        label: Text('Go To Lake!'),
        icon: Icon(Icons.directions_boat),
      ),

      // body: GoogleMap(

    );
  }
  void distFrom1(){
    double earthRadius=3958.75;


    // metro shamasabad
    double lat1=33.65033004799042;
    double lng1=73.08033136643859;
    // metro sadderlat lng
    double lat2=33.593586800492766;
    double lng2=73.05601008949102;

    double dLat=radians(lat2-lat1);
    double dlng=radians(lng2-lng1);
    double a =sin(dLat/2)*sin(dLat/2)+cos(radians(lat1))*cos(radians(lat2))*
            sin(dlng/2)*sin(dlng/2);
    double c=2*atan2(sqrt(a), sqrt(1-a));
    double dist=earthRadius*c;
    double meterConversion=1609.0;


    double totalDist=meterConversion*dist;
    print("==========================================------------------- dLat :${dLat}");
    print("==========================================------------------- dLat :${dlng}");
    print("==========================================------------------- dLat :${a}");
    print("==========================================------------------- dLat :${c}");
    print("==========================================------------------- dLat :${dist}");
    print("==========================================------------------- dLat :${totalDist}");

    print("====================================================================String After conversion to double $totalDist");


  }



  Future getCurrentPosition()async{
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      lat = position.latitude;
      long = position.longitude;

      print("current Lat :${lat} and current lng :${long}");// thats all


      listMarker.add(Marker(
          markerId: MarkerId("Current Position"),
          position: LatLng(lat,long),
          infoWindow: InfoWindow(title: "abdul hanan")));
    });
  }

  Future<void> _goToCurrentLoc() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(currentCameraPosition));
  }
}
