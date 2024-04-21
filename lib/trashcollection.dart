import 'package:flutter/material.dart';
import 'collection/general.dart';
import 'collection/hazardous.dart';
import 'collection/natural.dart';
import 'collection/point.dart';
import 'collection/recycle.dart';

class TrashCollectionScreen extends StatelessWidget {
 const TrashCollectionScreen({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: const Color.fromARGB(255, 93, 166, 122),
       title: const Text('Trash collection',style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 30,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w900,
                            ),),
       centerTitle: true,
     ),
     body: Container(
       decoration: const BoxDecoration(
         gradient: LinearGradient(
           begin: Alignment.topCenter,
           end: Alignment.bottomCenter,
           colors: [Color.fromARGB(255, 32, 74, 53), Color.fromARGB(255, 27, 63, 45)],
         ),
       ),
       child: Center(
         child: LayoutBuilder(
           builder: (context, constraints) {
             return Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 TrashButton(
                   label: 'ขยะทั่วไป',
                   color: Colors.blue,
                   onPressed: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => const GeneralScreen()),
                     );
                   },
                   maxWidth: constraints.maxWidth,
                 ),
                 TrashButton(
                   label: 'ขยะรีไซเคิล',
                   color: Colors.yellow,
                   onPressed: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => const RecycleScreen()),
                     );
                   },
                   maxWidth: constraints.maxWidth,
                 ),
                 TrashButton(
                   label: 'ขยะอินทรีย์',
                   color: Colors.green,
                   onPressed: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => const NaturalScreen()),
                     );
                   },
                   maxWidth: constraints.maxWidth,
                 ),
                 TrashButton(
                   label: 'ขยะอันตราย',
                   color: Colors.red,
                   onPressed: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => const HazardousScreen()),
                     );
                   },
                   maxWidth: constraints.maxWidth,
                 ),
                 TrashButton(
                   label: 'Point Screen',
                   color: Color.fromARGB(255, 95, 95, 95),
                   onPressed: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => const PointScreen()),
                     );
                   },
                   maxWidth: constraints.maxWidth,
                 ),
               ],
             );
           },
         ),
       ),
     ),
   );
 }
}

class TrashButton extends StatelessWidget {
 final String label;
 final Color color;
 final VoidCallback onPressed;
 final double maxWidth;

 const TrashButton({
   Key? key,
   required this.label,
   required this.color,
   required this.onPressed,
   required this.maxWidth,
 }) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return Container(
     width: maxWidth * 0.8,
     margin: const EdgeInsets.all(8),
     child: ElevatedButton(
       style: ElevatedButton.styleFrom(
         backgroundColor: color,
         foregroundColor: Colors.white,
         padding: const EdgeInsets.symmetric(vertical: 20),
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(30),
         ),
         textStyle: const TextStyle(
           fontSize: 20,
           fontWeight: FontWeight.bold,
           fontFamily: 'Inter',
         ),
       ),
       onPressed: onPressed,
       child: Text(label),
     ),
   );
 }
}