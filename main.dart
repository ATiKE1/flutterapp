import 'package:flutter/material.dart';
import './windows/signup.dart' as signupwindow;
import './windows/login.dart' as loginwindow;
import './windows/home.dart' as homewindow;

void main() {
  runApp(const MyApp());
}

class LoaderQueue {
  final String header;
  final String description;
  final String imageLink;

  LoaderQueue(this.header, this.description, this.imageLink);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var queue = [
    LoaderQueue(
        'Quick Delivery At Your Doorstep',
        'Enjoy quick pick-up and delivery to your destination',
        'https://i.imgur.com/NPBCCiJ.png'),
    LoaderQueue(
        'Flexible Payment',
        'Different modes of payment either before and after delivery without stress',
        'https://i.imgur.com/EO8OQ4n.png'),
    LoaderQueue(
        'Real-time Tracking',
        'Track your packages/items from the comfort of your home till final destination',
        'https://i.imgur.com/gRlYFiQ.png')
  ];

  int currentIndex = 0;
  bool isNotLast = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(queue[currentIndex].imageLink),
            Text(
              queue[currentIndex].header,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0560FA),
                  fontSize: 24),
              textAlign: TextAlign.center,
            ),
            Text(
              queue[currentIndex].description,
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 16),
              textAlign: TextAlign.center,
            ),
            isNotLast
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        OutlinedButton(
                          onPressed: () => {
                            setState(() {
                              currentIndex = queue.length - 1;
                              isNotLast = false;
                            })
                          },
                          style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFF0560FA),
                              disabledBackgroundColor: const Color(0xFF0560FA),
                              side: BorderSide.none,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          child: const Text(
                            'Skip',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () => {
                            setState(() {
                              if (currentIndex != queue.length - 1) {
                                currentIndex++;
                              }
                              if (currentIndex == queue.length - 1) {
                                isNotLast = false;
                              }
                            })
                          },
                          style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFF0560FA),
                              disabledBackgroundColor: const Color(0xFF0560FA),
                              side: BorderSide.none,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          child: const Text(
                            'Next',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ])
                : Column(
                    children: [
                      OutlinedButton(
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const homewindow.HomeScreen()),
                          )
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFF0560FA),
                            disabledBackgroundColor: const Color(0xFF0560FA),
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            fixedSize: const Size.fromWidth(342.0)),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
