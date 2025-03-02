import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lab 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showFirstImage = true;

  void _toggleImage() {
    setState(() {
      _showFirstImage = !_showFirstImage;
    });
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('SnackBar shown!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Lab 3')),
      body: Stack(
        children: [
          Image.asset(
            'assets/image1.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withAlpha(127),
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to Flutter',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  _showFirstImage ? 'assets/image1.jpg' : 'assets/image2.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _showSnackBar(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text(
                    'Show SnackBar',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SecondScreen()),
                    );
                  },
                  style: TextButton.styleFrom(
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text(
                    'Go to Second Screen',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: _toggleImage,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.black),
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text(
                    'Toggle Image',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'This is the Second Screen',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(200, 50),
              ),
              child: const Text(
                'Back to Home',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
