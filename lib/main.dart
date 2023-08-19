import 'package:flutter/material.dart';
import 'dart:io';

class LoveCalculator extends StatefulWidget {
  @override
  _LoveCalculatorState createState() => _LoveCalculatorState();
}

class _LoveCalculatorState extends State<LoveCalculator> {
  final _aController = TextEditingController();
  final _bController = TextEditingController();
  String _result = '';
  bool _showResult = false;
  @override
  void dispose() {
    _aController.dispose();
    _bController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Love Calculator'),
      ),
      body: Center(
        child: _showResult
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$_result',
                    style: TextStyle(fontSize: 68.0),
                  ),
                  SizedBox(height: 88.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showResult = false;
                      });
                    },
                    child: Text('Calculate Again'),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _aController,
                      decoration: InputDecoration(
                        labelText: 'Enter your name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _bController,
                      decoration: InputDecoration(
                        labelText: 'Enter your partner\'s name',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String a = _aController.text.trim();
                      print(a);
                      String b = _bController.text.trim();
                      // _aController.text = "";
                      // _bController.text = "";
                      // dispose();
                      List<String> d = ['1', '2', '3', '4', '5', '6'];
                      List<String> ee = [
                        'FRIENDS',
                        'LOVE',
                        'AFFECTION',
                        'MARRIAGE',
                        'ENEMY',
                        'SISTER'
                      ];
                      while (d.length != 1) {
                        int e = a.length + b.length;
                        while (e > d.length) {
                          e = e - d.length;
                        }
                        d.removeAt(e - 1);
                        d = d.sublist(e - 1) + d.sublist(0, e - 1);
                      }
                      int k = int.parse(d[0]);
                      setState(() {
                        _result = ee[k - 1];
                        _showResult = true;
                      });
                      // dispose();
                    },
                    child: Text('Calculate'),
                  ),
                ],
              ),
      ),
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Love Calculator App',
      home: LoveCalculator(),
    );
  }
}
