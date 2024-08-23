// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RandomImageGenerator(),
    );
  }
}

class RandomImageGenerator extends StatefulWidget {
  const RandomImageGenerator({super.key});

  @override
  _RandomImageGeneratorState createState() => _RandomImageGeneratorState();
}

class _RandomImageGeneratorState extends State<RandomImageGenerator> {
  // List of image paths
  final List<String> _images = [
    'assets/dice_images/dice_six.png',
    'assets/dice_images/dice_five.png',
    'assets/dice_images/dice_four.png',
    'assets/dice_images/dice_three.png',
    'assets/dice_images/dice_two.png',
    'assets/dice_images/dice_one.png',
  ];

  // Variable to hold the current image path
  String? _currentImage;

  // Function to generate a random image
  void _generateRandomImage() {
    final random = Random();
    setState(() {
      _currentImage = _images[random.nextInt(_images.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Roll The Dics',
            style: TextStyle(fontSize: 28, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _currentImage != null
                ? Image.asset(_currentImage!, width: 300, height: 280)
                : Image.asset('assets/dice_images/dice_one.png'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateRandomImage,
              child: const Text('Generate Random Image'),
            ),
          ],
        ),
      ),
    );
  }
}
