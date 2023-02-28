// Flutter imports:
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skillbox Flutter Course',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Module 4'),
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
  Map<String, dynamic> data = {
    'Мои фото': [
      'https://picsum.photos/1200/501',
      'https://picsum.photos/1200/502',
      'https://picsum.photos/1200/503',
      'https://picsum.photos/1200/504',
      'https://picsum.photos/1200/505',
      'https://picsum.photos/1200/506',
      'https://picsum.photos/1200/507',
      'https://picsum.photos/1200/508',
      'https://picsum.photos/1200/509',
      'https://picsum.photos/1200/510',
      'https://picsum.photos/1200/526',
      'https://picsum.photos/1200/527',
      'https://picsum.photos/1200/528',
      'https://picsum.photos/1200/529',
      'https://picsum.photos/1200/530',
      'https://picsum.photos/1200/531',
    ],
    'Галерея': [
      'https://picsum.photos/1200/511',
      'https://picsum.photos/1200/512',
      'https://picsum.photos/1200/513',
      'https://picsum.photos/1200/514',
      'https://picsum.photos/1200/515',
      'https://picsum.photos/1200/516',
      'https://picsum.photos/1200/517',
      'https://picsum.photos/1200/518',
      'https://picsum.photos/1200/519',
      'https://picsum.photos/1200/520',
      'https://picsum.photos/1200/521',
      'https://picsum.photos/1200/522',
      'https://picsum.photos/1200/523',
      'https://picsum.photos/1200/524',
      'https://picsum.photos/1200/525',
      'https://picsum.photos/1200/532',
    ]
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: data.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Галерея'),
          bottom: TabBar(
              tabs: data.entries.map((el) => Tab(text: el.key)).toList()),
        ),
        body: TabBarView(
          children: data.entries.map((el) {
            return GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
              ),
              key: PageStorageKey(el.key),
              children: <Widget>[
                ...el.value.map((e) {
                  return Image.network(
                    e,
                    fit: BoxFit.cover,
                  );
                }).toList()
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
