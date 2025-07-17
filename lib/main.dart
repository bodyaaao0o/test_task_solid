import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TestChangeColor());
  }
}

class TestChangeColor extends StatefulWidget {
  const TestChangeColor({super.key});

  @override
  State<TestChangeColor> createState() => _TestChangeColorState();
}

class _TestChangeColorState extends State<TestChangeColor> {
  Color backgroundColor = Colors.white;

  void changeBackgroundColor() {
    setState(() {
      backgroundColor = generateRandomColor();
    });
  }

  Color generateRandomColor() {
    final Random random = Random();
    const int a = 255;
    const int maxRgb = 256; // Full opacity

    return Color.fromARGB(
      a,
      random.nextInt(maxRgb),
      random.nextInt(maxRgb),
      random.nextInt(maxRgb),
    );
  }

  bool changeTextColor(Color color) {
    return ThemeData.estimateBrightnessForColor(color) == Brightness.dark;
  }

  String colorToHex(Color color) {
    final int a = (color.a * 255).round() & 0xff;
    final int r = (color.r * 255).round() & 0xff;
    final int g = (color.g * 255).round() & 0xff;
    final int b = (color.b * 255).round() & 0xff;
    const int radixString = 16;
    const int hexLength = 2;

    return '0x'
        '${a.toRadixString(radixString).padLeft(hexLength, '0').toUpperCase()}'
        '${r.toRadixString(radixString).padLeft(hexLength, '0').toUpperCase()}'
        '${g.toRadixString(radixString).padLeft(hexLength, '0').toUpperCase()}'
        '${b.toRadixString(radixString).padLeft(hexLength, '0').toUpperCase()}';
  }

  @override
  Widget build(BuildContext context) {
    final textColor = changeTextColor(backgroundColor)
        ? Colors.white
        : Colors.black;

    return GestureDetector(
      onTap: changeBackgroundColor,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello there',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'Color Hex: ${colorToHex(backgroundColor)}',
                style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
