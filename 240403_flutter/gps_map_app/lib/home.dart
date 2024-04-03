import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as latlng;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Position currentPosition;
  late int kindChoice;
  late double latData;
  late double longData;
  late MapController mapController;
  late bool canRun;
  late List location;

  // Segment Widget
  Map<int, Widget> segmentWidgets = {
    0: const SizedBox(
      child: Text(
        '현위치',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      ),
    ),
    1: const SizedBox(
      child: Text(
        '둘리 뮤지엄',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      ),
    ),
    2: const SizedBox(
      child: Text(
        '서대문형무소역사관',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      ),
    )
  };

  @override
  void initState() {
    super.initState();
    kindChoice = 0; // segment key
    mapController = MapController();
    canRun = false;
    location = ['현재위치', '둘리뮤지엄', '서대문형무소역사관'];
    checkLocationPermission();
  }

  checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    // 거절
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // 다신 사용하지 않음
    if (permission == LocationPermission.deniedForever) {
      return;
    }

    // 앱을 사용 중 or 항상 허용 일때,
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      getCurrentLocation();
    }
  }

  getCurrentLocation() async {
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((position) {
      currentPosition = position;
      canRun = true;
      latData = currentPosition.latitude;
      longData = currentPosition.longitude;

      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Column(
            children: [
              const Text(
                'GPS & Map',
                style: TextStyle(color: Colors.black),
              ),
              CupertinoSegmentedControl(
                groupValue: kindChoice,
                children: segmentWidgets,
                onValueChanged: (value) {
                  kindChoice = value;
                  if (kindChoice == 0) {
                    getCurrentLocation();
                    latData = currentPosition.latitude;
                    longData = currentPosition.longitude;
                    mapController.move(
                      latlng.LatLng(latData, longData),
                      17.0,
                    );
                  } else if (kindChoice == 1) {
                    latData = 37.65243153;
                    longData = 127.0276397;
                    mapController.move(latlng.LatLng(latData, longData), 17.0);
                  } else {
                    latData = 37.57244171;
                    longData = 126.9595412;
                    mapController.move(latlng.LatLng(latData, longData), 17.0);
                  }
                  setState(() {});
                },
              )
            ],
          ),
        ),
        toolbarHeight: 150,
      ),
      body: canRun
          ? flutterMap()
          : const Center(child: CircularProgressIndicator()),
    );
  }

  // -- Widgets --
  Widget flutterMap() {
    return FlutterMap(
        mapController: mapController,
        options: MapOptions(
            initialCenter: latlng.LatLng(latData, longData), initialZoom: 17.0),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          MarkerLayer(markers: [
            Marker(
                width: 80,
                height: 80,
                point: latlng.LatLng(latData, longData),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                      child: Text(
                        location[kindChoice],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.pin_drop,
                      size: 50,
                      color: Colors.red,
                    )
                  ],
                )),
          ])
        ]);
  }
}
