import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecycleScreen extends StatefulWidget {
  const RecycleScreen({Key? key}) : super(key: key);

  @override
  _RecycleScreenState createState() => _RecycleScreenState();
}

class _RecycleScreenState extends State<RecycleScreen> {
  final List<String> wasteOptions = ['ขวดพลาสติก', 'ขวดแก้ว', 'กระดาษ'];
  final Map<String, int> wasteCounts = {};

  @override
  void initState() {
    super.initState();
    _initializeWasteCounts();
  }

  Future<void> _initializeWasteCounts() async {
    final prefs = await SharedPreferences.getInstance();
    for (final option in wasteOptions) {
      wasteCounts[option] = prefs.getInt(option) ?? 0;
    }
  }

  Future<void> _incrementWasteCount(String wasteType) async {
    setState(() {
      wasteCounts[wasteType] = wasteCounts[wasteType]! + 1;
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(wasteType, wasteCounts[wasteType]!);
  }

  Future<void> _clearWasteCounts() async {
    final prefs = await SharedPreferences.getInstance();
    for (final option in wasteOptions) {
      await prefs.remove(option);
    }
    setState(() {
      _initializeWasteCounts();
    });
  }

  void _showScores() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Waste Count"),
        content: Text(
            wasteCounts.entries.map((e) => "${e.key}: ${e.value}").join("\n")),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[800],
        title: const Text('ขยะรีไซเคิล'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.yellowAccent, Colors.amber],
              ),
            ),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ...wasteOptions.map(
                      (option) => buildButton(option, Colors.grey, constraints.maxWidth)),
                  const SizedBox(height: 20),
                  buildScoreButton(Colors.yellow[600]!, constraints.maxWidth),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildButton(String option, Color backgroundColor, double maxWidth) {
    return Container(
      width: maxWidth * 0.8,
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 20),
        ),
        onPressed: () => _incrementWasteCount(option),
        child: Text(option),
      ),
    );
  }

  Widget buildScoreButton(Color themeColor, double maxWidth) {
    return Container(
      width: maxWidth * 0.8,
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: themeColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 20),
        ),
        onPressed: _showScores,
        child: const Text('Show Score'),
      ),
    );
  }
}