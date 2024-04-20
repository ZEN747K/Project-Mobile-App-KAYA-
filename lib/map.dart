import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class TrashMap extends StatefulWidget {
  const TrashMap({Key? key}) : super(key: key);

  @override
  _TrashMapState createState() => _TrashMapState();
}

class _TrashMapState extends State<TrashMap> {
  late GoogleMapController mapController;
  Location location = Location();
  late LatLng currentLocation = const LatLng(0, 0);

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    try {
      var locationData = await location.getLocation();
      setState(() {
        currentLocation =
            LatLng(locationData.latitude!, locationData.longitude!);
      });
    } catch (e) {
      print('Could not get the location: $e');
    }
  }

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
                  top: 40,
                  child: GestureDetector(
                    onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
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
                  top: 105,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 125,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: currentLocation,
                        zoom: 10,
                      ),
                      markers: {
                        const Marker(
                          markerId: MarkerId('มหาวิทยาลัยมหิดลคณะ ICT'),
                          position: LatLng(13.794472826595825, 100.32470471121312),
                          infoWindow:
                              InfoWindow(title: 'มหาวิทยาลัยมหิดลคณะ ICT'),
                        ),
                        const Marker(
                          markerId: MarkerId('มหาวิทยาลัยมหิดลคณะพยาบาล'),
                          position: LatLng(13.798693636635223, 100.32308456277929),
                          infoWindow:
                              InfoWindow(title: 'มหาวิทยาลัยมหิดลคณะพยาบาล'),
                        ),
                        const Marker(
                          markerId: MarkerId('ทั้งขยะ1'),
                          position: LatLng(13.794272755159712, 100.32403798415399),
                          infoWindow:
                              InfoWindow(title: 'ถังขยะตรงห้องสมุดข้างๆร้านกับข้าวลุง'),
                        ),
                        const Marker(
                          markerId: MarkerId('ทั้งขยะ2'),
                          position: LatLng(13.794717517452666, 100.32395471660931),
                          infoWindow:
                              InfoWindow(title: 'ถังขยะหน้าห้องสมุดข้างหลังคณะ ICT'),
                        ),
                        const Marker(
                          markerId: MarkerId('ทั้งขยะ3'),
                          position: LatLng(13.796080848769453, 100.3255987567232),
                          infoWindow:
                              InfoWindow(title: 'ถังขยะหน้าเซเว่นที่คณะวิศวะ'),
                        ),
                        const Marker(
                          markerId: MarkerId('ทั้งขยะ4'),
                          position: LatLng(13.79433393118447, 100.32076691148546),
                          infoWindow:
                              InfoWindow(title: 'ถังขยะด้านข้างเซเว่นของตึก mlc'),
                        ),
                        const Marker(
                          markerId: MarkerId('ทั้งขยะ5'),
                          position: LatLng(13.79391068501957, 100.32533510616803),
                          infoWindow:
                              InfoWindow(title: 'ถังขยะตรงร้านอเมซอน'),
                        ),
                        const Marker(
                          markerId: MarkerId('ทั้งขยะ6'),
                          position: LatLng(13.793297819677912, 100.32513039727709),
                          infoWindow:
                              InfoWindow(title: 'ถังขยะตรงทางไปศูนย์อาหารที่คณะสังคม'),
                        ),
                        const Marker(
                          markerId: MarkerId('ทั้งขยะ7'),
                          position: LatLng(13.79387896313661, 100.32124040943691),
                          infoWindow:
                              InfoWindow(title: 'ถังขยะในอาคาร mlc ตรงบันไดทางขึ้นหลัก'),
                        ),
                        const Marker(
                          markerId: MarkerId('ทั้งขยะ8'),
                          position: LatLng(13.788047646465559, 100.32491659365672),
                          infoWindow:
                              InfoWindow(title: 'ถังขยะตรงรถบัสศาลายาตรงคณะดุริยางค์'),
                        ),
                        const Marker(
                          markerId: MarkerId('ทั้งขยะ9'),
                          position: LatLng(13.794730619623342, 100.32445680562772),
                          infoWindow:
                              InfoWindow(title: 'ถังขยะในอาคาร ICT หน้าบันไดเลื่อน'),
                        ),
                        const Marker(
                          markerId: MarkerId('ทั้งขยะ10'),
                          position: LatLng(13.79694815861916, 100.32109190998258),
                          infoWindow:
                              InfoWindow(title: 'ถังขยะในอาคารศิลปศาสตร์'),
                        ),
                      },
                      onMapCreated: (GoogleMapController controller) {
                        mapController = controller;
                      },
                      myLocationEnabled:
                          true, // เปิดใช้งานตำแหน่งปัจจุบันของผู้ใช้
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
