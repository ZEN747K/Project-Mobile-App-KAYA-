import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrashMap extends StatelessWidget {
  const TrashMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Color(0xFFDEEEF3)),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 104,
                    decoration: const BoxDecoration(color: Color(0xFF5DA57A)),
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 14,
                  child: SizedBox(
                    width: 63,
                    height: 24,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 23,
                            height: 24,
                            padding: const EdgeInsets.only(
                                top: 2, right: 11.72, bottom: 2),
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(),
                            child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [],
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 18,
                          top: 4,
                          child: Text(
                            'MENU',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 1.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 65,
                  top: 52,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 130,
                    height: 80,
                    child: const Text(
                      'KAYA MAP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w900,
                        height: 1.0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 175,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 175,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(13.794744331197775,
                            100.32545653666973), // ตำแหน่งเริ่มต้นที่ศาลายามหิดล
                        zoom: 15, // การซูมเริ่มต้นของแผนที่
                      ),
                      markers: {
                        Marker(
                          markerId: MarkerId('มหาวิทยาลัยมหิดลคณะ ICT'),
                          position:
                              LatLng(13.794420495660686, 100.32472333050978),
                          infoWindow:
                              InfoWindow(title: 'มหาวิทยาลัยมหิดลคณะ ICT'),
                        ),
                        Marker(
                          markerId: MarkerId('มหาวิทยาลัยมหิดลคณะพยาบาล'),
                          position:
                              LatLng(13.798797402344437, 100.32309474226246),
                          infoWindow:
                              InfoWindow(title: 'มหาวิทยาลัยมหิดลคณะพยาบาล'),
                        ),
                      },
                      mapType: MapType.normal, // ประเภทของแผนที่
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
