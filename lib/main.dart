import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laboratory Work 4',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool _toggle = true; 
  BoxFit fitMode = BoxFit.cover; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Laboratory Work 4")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              SizedBox(
                width: 300,
                height: 200,
                child: Image.asset(
                  _toggle ? "assets/image1.jpg" : "assets/image2.jpg",
                  fit: fitMode,
                ),
              ),
              const SizedBox(height: 20),

              
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset("assets/image1.jpg",
                      width: 300, height: 200, fit: BoxFit.cover),
                  Container(
                    width: 300,
                    height: 200,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  const Text(
                    "Welcome to Flutter",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(200, 50),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("SnackBar is shown!")),
                  );
                },
                child: const Text(
                  "Show SnackBar",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(height: 15),

              
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondScreen()),
                  );
                },
                child: const Text(
                  "Go to Second Screen",
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ),
              const SizedBox(height: 15),

              
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black),
                  minimumSize: const Size(200, 50),
                ),
                onPressed: () {
                  setState(() {
                    _toggle = !_toggle;
                  });
                },
                child: const Text(
                  "Toggle Image",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: const Center(
        child: Text(
          "You are on the second screen!",
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
      ),
    );
  }
}
