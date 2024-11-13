import 'package:flutter/material.dart';

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
    );
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
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              queue[currentIndex].description,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            isNotLast
                ? Row(children: [
                    ElevatedButton(
                      onPressed: () => {
                        setState(() {
                          currentIndex = queue.length - 1;
                          isNotLast = false;
                        })
                      },
                      child: const Text('Skip'),
                    ),
                    ElevatedButton(
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
                      child: const Text('Next'),
                    )
                  ])
                : const Column(
                    children: [
                      ElevatedButton(
                        onPressed: null,
                        child: Text('Last page'),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
