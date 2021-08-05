import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:vector_math/vector_math.dart';

class UserLocation{

  Position position ;
  static double lat;
  static double long;
  static double userDistance;
  Future  getCurrentPosition()async{
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      lat = position.latitude;
      long = position.longitude;
      print("current Lat :${lat} and current lng :${long}");// thats all

    double earthRadius=3958.75;

    // metro shamasabad
    // double lat1=33.65033004799042;
    // double lng1=73.08033136643859;
    double lat1=lat;
    double lng1=long;

    // metro sadderlat lng
    // double lat2=33.593586800492766;
    // double lng2=73.05601008949102;
    double lat2=33.6495248;
    double lng2=73.0743183;

    double dLat=radians(lat2-lat1);
    double dlng=radians(lng2-lng1);
    double a =sin(dLat/2)*sin(dLat/2)+cos(radians(lat1))*cos(radians(lat2))*
        sin(dlng/2)*sin(dlng/2);
    double c=2*atan2(sqrt(a), sqrt(1-a));
    double dist=earthRadius*c;
    double meterConversion=1609.0;
    double totalDist=meterConversion*dist;
    userDistance=totalDist;
    print("==========================================------------------- dLat :${dLat}");
    print("==========================================------------------- dLat :${dlng}");
    print("==========================================------------------- dLat :${a}");
    print("==========================================------------------- dLat :${c}");
    print("==========================================------------------- dLat :${dist}");
    print("==========================================------------------- dLat :${totalDist}");
    print("====================================================================String After conversion to double $totalDist");
  }
}