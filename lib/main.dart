import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/button.dart';
import 'components/dropdown.dart';

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
  int _counter = 0;
  String _text = 'lib/images/image1.svg';
  void _incrementCounter() {
    setState(() {
      if (_counter == 2) _counter = 0;
      _counter++;
      switch(_counter) {
        case 1:
          _text = 'lib/images/image1.svg';
          break;
        case 2:
          _text = 'lib/images/Vek.svg';
          break;
        default:
          _text = '';
      }
    });
  }

  String? _selectedState = "None selected";

  final List<String> rooms = [
    'Hörsaal 1',
    'Hörsaal 2',
    'Hörsaal 3',
    'Hörsaal 4',
    'Hörsaal 5',
    'Hörsaal 6',
    'Hörsaal 7',
    'Hörsaal 8',
    'Hörsaal 9',
    'Hörsaal 10',
    'Hörsaal 11',
    'Hörsaal 12',
    'Hörsaal 13',
    'Hörsaal 14',
    'Hörsaal 15',
    'Hörsaal 16',
    'Hörsaal 17',
    'Hörsaal 18',
    'Hörsaal 19',
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
          SizedBox(height: 20,),
          DropDown(
            selectedState: _selectedState,
            onChanged: (String? newValue) {
            setState(() {
              _selectedState = newValue;
              });
            },
            rooms: rooms,
          ),
          Expanded(
            child: ListView(
              children: [
                AspectRatio(
                  aspectRatio: 9 / 16,
                  child: InteractiveViewer(
                    maxScale: 10,
                    child: SvgPicture.asset(
                      //width: 400,
                      //height: 500,
                      _text,
                    ),
                  ),
                ),
                /*InteractiveViewer(
                  maxScale: 10,
                  child: SvgPicture.asset(
                    width: 400,
                    height: 750,
                    _text,
                  )
                ),*/
                //SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: SwitchButton(
                    myText: 'switch',
                    event: _incrementCounter,
                  ),
                ),
              ],
            ),
          )
          ],
        ),
      ),
    );
  }
}