import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plan_2_go/components/button.dart';
import 'package:plan_2_go/components/dropdown.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Plan 2 Go'),
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
  String _path = 'lib/images/None_selected.svg';
  String? _selectedState = 'None selected';
  
  void choosePath() {
    setState(() {
      String part = (_selectedState!.substring(1, 10)).trim();
      part = part.replaceAll(' ', '_');
      _path = 'lib/images/$part.svg';
    });
  }

  void noneSelected() {
    setState(() {
      _path = 'lib/images/None_selected.svg';
    });
  }

  final List<String> rooms = [
    'Hörsaal 1 - K - 041B',
    'Hörsaal 2 - HT - 182E',
    'Hörsaal 3 - HT - 180E',
    'Hörsaal 4 - HT - 179F',
    'Hörsaal 5 - HT - 175G',
    'Hörsaal 6 - HT - 174H',
    'Hörsaal 7 - HT - 172H',
    'Hörsaal 8 - P - 013',
    'Hörsaal 9 - HG - 001',
    'Hörsaal 10 - HG - 101',
    'Hörsaal 11 - T - 008',
    'Hörsaal 12 - T - 006',
    'Hörsaal 13 - T - 007',
    'Hörsaal 14 - T - 008',
    'Hörsaal 15 - MZ - 001A',
    'Hörsaal 16 - MZ - 009A',
    'Hörsaal 17 - MZ - 001B',
    'Hörsaal 18 - SZ - Z17',
    'Hörsaal 19 - SZ - Z18',
    'None selected',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            DropDown(
              selectedState: _selectedState,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedState = newValue;
                  }
                );
                choosePath();
              },
              rooms: rooms,
            ),
            Expanded(
              child: InteractiveViewer(
                maxScale: 10,
                child: SvgPicture.asset(
                  _path,
                  fit:BoxFit.contain,
                ),
              ),
            ),
            SwitchButton(
              myText: 'switch',
              event: noneSelected,
            ),
          ],
        ),
      ),
    );
  }
}