import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PointScreen extends StatefulWidget {
  const PointScreen({Key? key}) : super(key: key);

  @override
  _PointScreenState createState() => _PointScreenState();
}

class _PointScreenState extends State<PointScreen> {
  int _totalScore = 0;
  final Map<String, int> _wasteCounts = {
    'General': 0,
    'Hazardous': 0,
    'Natural': 0,
    'Recycle': 0,
  };

  @override
  void initState() {
    super.initState();
    _loadCounts();
  }

  Future<void> _loadCounts() async {
  final prefs = await SharedPreferences.getInstance();
  setState(() {
    _wasteCounts['General'] = (prefs.getInt('ถุงขนม') ?? 0) +
        (prefs.getInt('ถุงพลาสติก') ?? 0) +
        (prefs.getInt('ซองบะหมี่') ?? 0);
    _wasteCounts['Hazardous'] = (prefs.getInt('กระป๋องสี') ?? 0) +
        (prefs.getInt('แบตเตอรี่') ?? 0) +
        (prefs.getInt('ผ้าอนามัย') ?? 0);
    _wasteCounts['Natural'] = (prefs.getInt('เศษอาหาร') ?? 0) +
        (prefs.getInt('เศษใบไม้') ?? 0) +
        (prefs.getInt('ซากสัตว์') ?? 0);
    _wasteCounts['Recycle'] = (prefs.getInt('ขวดพลาสติก') ?? 0) +
        (prefs.getInt('ขวดแก้ว') ?? 0) +
        (prefs.getInt('กระดาษ') ?? 0);
    _totalScore = _wasteCounts.values.fold(0, (sum, count) => sum + count);
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Trash Point',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            _totalScore.toString(),
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          ScoreCard(
            title: 'ขยะทั่วไป ',
            score: _wasteCounts['General']!,
            color: Colors.blue,
          ),
          ScoreCard(
            title: 'ขยะอันตราย',
            score: _wasteCounts['Hazardous']!,
            color: Colors.red,
          ),
          ScoreCard(
            title: 'ขยะอินทรีย์',
            score: _wasteCounts['Natural']!,
            color: Colors.green,
          ),
          ScoreCard(
            title: 'ขยะรีไซเคิล',
            score: _wasteCounts['Recycle']!,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}

class ScoreCard extends StatelessWidget {
  final String title;
  final int score;
  final Color color;

  const ScoreCard({
    Key? key,
    required this.title,
    required this.score,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              score.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}