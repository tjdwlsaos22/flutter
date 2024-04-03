import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> locationName;
  late List<List<double>> locationData;
  late List<Color> nameColor = [
    Theme.of(context).colorScheme.primary,
    Theme.of(context).colorScheme.secondary,
    Theme.of(context).colorScheme.tertiary,
    Theme.of(context).colorScheme.error,
  ];
  late MapController mapController;

  @override
  void initState() {
    super.initState();
    locationName = ['혜화문', '흥인지문', '창의문', '숙정문'];
    locationData = [
      [37.5878892, 127.0037098],
      [37.5711907, 127.009506],
      [37.5926027, 126.9664771],
      [37.5956584, 126.9810576]
    ];

    mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
          mapController: mapController,
          options: const MapOptions(
              initialCenter: latlng.LatLng(37.593, 126.987), initialZoom: 13.2),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            ),
            MarkerLayer(
              markers: List.generate(locationName.length, (index) {
                return Marker(
                    width: 80,
                    height: 80,
                    point: latlng.LatLng(
                        locationData[index][0], locationData[index][1]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                          child: Text(
                            locationName[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: nameColor[index],
                            ),
                          ),
                        ),
                        Icon(Icons.pin_drop, size: 50, color: nameColor[index])
                      ],
                    ));
              }),
            ),
          ]),
    );
  }
}
