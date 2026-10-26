
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hordiienko Roman',
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: const Color(0xFFFFF7FF),
      ),
      home: const ColorPickerPage(),
    );
  }
}

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({super.key});

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  int red = 0;
  int green = 0;
  int blue = 0;

  @override
  Widget build(BuildContext context) {
    final selectedColor = Color.fromARGB(
      255,
      red,
      green,
      blue,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hordiienko Roman'),
        centerTitle: true,
        backgroundColor: const Color(0xFFCBB5F5),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 45,
            ),
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    color: selectedColor,
                  ),
                ),

                const SizedBox(height: 50),

                ColorSlider(
                  name: 'Red',
                  value: red,
                  onChanged: (value) {
                    setState(() {
                      red = value;
                    });
                  },
                ),

                ColorSlider(
                  name: 'Green',
                  value: green,
                  onChanged: (value) {
                    setState(() {
                      green = value;
                    });
                  },
                ),

                ColorSlider(
                  name: 'Blue',
                  value: blue,
                  onChanged: (value) {
                    setState(() {
                      blue = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ColorSlider extends StatelessWidget {
  final String name;
  final int value;
  final ValueChanged<int> onChanged;

  const ColorSlider({
    super.key,
    required this.name,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$name: $value'),

        Slider(
          value: value.toDouble(),
          min: 0,
          max: 255,
          divisions: 255,
          label: '$value',
          activeColor: const Color(0xFF665088),
          onChanged: (newValue) {
            onChanged(newValue.round());
          },
        ),

        const SizedBox(height: 10),
      ],
    );
  }
}
