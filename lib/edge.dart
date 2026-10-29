import 'package:flutter/material.dart';

void main() => runApp(const EdgeApp());

class EdgeApp extends StatelessWidget {
  const EdgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EdgeInsetsScreen(),
    );
  }
}

// One reusable box. Only label, color, and padding change.
class PaddedBox extends StatelessWidget {
  const PaddedBox({
    super.key,
    required this.label,
    required this.color,
    required this.padding,
    this.fullWidth = false,
  });

  final String label;
  final Color color;
  final EdgeInsets padding;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullWidth ? double.infinity : null,
      padding: padding,
      color: color,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 10, color: Colors.black87),
      ),
    );
  }
}

class EdgeInsetsScreen extends StatelessWidget {
  const EdgeInsetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('YOUR LASTNAME')), // <-- change this
      body: const Column(
        children: [
          PaddedBox(
            label: 'EdgeInsets.all(30)',
            color: Colors.red,
            padding: EdgeInsets.all(30),
          ),
          SizedBox(height: 20),
          PaddedBox(
            label: 'EdgeInsets.symmetric(horizontal: 40, vertical: 10)',
            color: Colors.yellow,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            fullWidth: true,
          ),
          SizedBox(height: 20),
          PaddedBox(
            label: 'EdgeInsets.only(left: 30, top: 10, right: 5, bottom: 20)',
            color: Colors.blue,
            padding: EdgeInsets.only(left: 30, top: 10, right: 5, bottom: 20),
          ),
          SizedBox(height: 20),
          PaddedBox(
            label: 'EdgeInsets.fromLTRB(10, 20, 30, 40)',
            color: Colors.green,
            padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
          ),
        ],
      ),
    );
  }
}