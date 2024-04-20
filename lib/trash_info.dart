import 'package:flutter/material.dart';


import 'information/common.dart';
import 'information/danger.dart';
import 'information/insea.dart';
import 'information/recycle.dart';
import 'main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      
    );
  }
}

class TrashInformation extends StatelessWidget {
  const TrashInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            CategoryButton(
              text: 'ขยะทั่วไป',
                onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => const TrashPictureCommon()),
                            );
                          },
            ),
            CategoryButton(
              text: 'ขยะอินทรีย์',
              color: const Color(0xFF28AA44),
              onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => const TrashPictureInsea()),
                            );
                          },
            ),
            CategoryButton(
              text: 'ขยะรีไซเคิล',
              color: const Color(0xFFBAA050),
              onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => const TrashPictureRecycle()),
                            );
                          },
            ),
            CategoryButton(
              text: 'ขยะอันตราย',
              color: const Color(0xFFBA5056),
               onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => const TrashPictureDanger()),
                            );
                          },
            ),
            CategoryButton(
              text: 'MENU',
              color: const Color(0xFF427C7A),
              onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => const CustomWidget()),
                            );
                          },
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 103,
      decoration: const BoxDecoration(
        color: Color(0xFF5DA57A),
        
      ),
      child: const Center(
        child: Text(
          'Trash Information',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onTap;

  const CategoryButton({
    super.key,
    required this.text,
    this.color = const Color(0xFF2C59F6),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 310,
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}