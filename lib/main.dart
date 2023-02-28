// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
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
      home: const MyHomePage(title: 'Module 3 '),
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
  List<String> uriNames = [
    'https://cdn.worldvectorlogo.com/logos/flutter.svg',
    'https://upload.wikimedia.org/wikipedia/commons/f/fe/Dart_programming_language_logo.svg',
    'https://upload.wikimedia.org/wikipedia/commons/9/95/Android_Studio_Icon_3.6.svg',
    'assets/svg/skillbox_logo.svg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(height: 400.0),
              items: uriNames.map((uriName) {
                SvgPicture svgPicture;
                if (Uri.parse(uriName).isAbsolute) {
                  svgPicture = SvgPicture.network(
                    uriName,
                    placeholderBuilder: (BuildContext context) => Container(
                        padding: const EdgeInsets.all(50.0),
                        child: const CircularProgressIndicator()),
                  );
                } else {
                  svgPicture = SvgPicture.asset(
                    uriName,
                    placeholderBuilder: (BuildContext context) => Container(
                        padding: const EdgeInsets.all(50.0),
                        child: const CircularProgressIndicator()),
                  );
                }
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: svgPicture);
                  },
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
