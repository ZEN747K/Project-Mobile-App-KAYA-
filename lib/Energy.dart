import 'package:flutter/material.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 38, 47),
      ),
      home: const EnergyComparation(),
    );
  }
}

class EnergyComparation extends StatelessWidget {
  const EnergyComparation({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: const Color(0xFF5DA57A),
              padding: const EdgeInsets.only(top: 58, bottom: 45),
              child: const Center(
                child: Text(
                  'Energy comparation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Energy comparison',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'หมายถึงการเปรียบเทียบการใช้พลังงานระหว่างวิธีการจัดการขยะที่แตกต่างกัน เพื่อหาวิธีที่มีผลกระทบต่อสิ่งแวดล้อมน้อยที่สุดหรือเสถียรที่สุด โดยมีวัตถุประสงค์หลักคือการลดการใช้พลังงานรวมทั้งการลดปริมาณขยะที่ส่งไปที่ถังขยะที่จะถูกนำไปทำลาย',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 16),
                  Image.asset('assets/Save.png'),
                  const SizedBox(height: 16),
                  const Text(
                    'การรีไซเคิล (Recycling):',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    'การรีไซเคิลช่วยลดการใช้พลังงานในการผลิตวัสดุใหม่ เนื่องจากวัสดุที่รีไซเคิลได้มากกว่าหนึ่งครั้งไม่ต้องผลิตใหม่จากวัสดุดิบ ทำให้ปริมาณการใช้พลังงานลดลง',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 16),
                  Image.asset('assets/MWh.png'),
                  const SizedBox(height: 16),
                  const Text(
                    'การเผาขยะ (Incineration):',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    'การเผาขยะสามารถผลิตไฟฟ้าหรือความร้อน ซึ่งสามารถนำไปใช้ในการผลิตพลังงานไฟฟ้าหรือพลังงานความร้อน นอกจากนี้ การลดปริมาณขยะที่ส่งไปที่ถังขยะที่จะถูกนำไปทำลายก็ช่วยลดการใช้พลังงาน',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Text(
                    'การจัดการที่ทำให้เกิดขึ้นหลังจากการใช้งาน: เช่น การนำขยะไปทำการรีไซเคิลหรือการทำการแยกขยะเพื่อลดปริมาณขยะที่ส่งไปที่ถังขยะสุดท้าย',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Stack(
                    children: [
                      Container(
                        height: 850,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.purple,
                              Colors.blue,
                              Colors.green,
                              Colors.yellow,
                              Colors.orange,
                              Colors.red,
                              Colors.pink,
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'HDPE/PP 1 KG สามารถ CO2 ได้ \n\n0.68 KG\n\nLPDE 1 KG สามารถCO2 ได้ \n\n0.72 KG\n\nPET 1 KG สามารถCO2 ได้ \n\n0.63 KG\n\nกระดาษ 1 KG สามารถCO2 ได้\n\n0.57 KG\n\nเเก้ว 1 KG สามารถCO2 ได้้ \n\n0.01 KG \n\nอลูมิเนียม 1 KG สามารถCO2 ได้\n\n3.71 KG \n\nเหล็ก 1 KG สามารถCO2 ได้\n\n0.87 KG',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
