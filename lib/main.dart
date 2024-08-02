import 'package:demo_app/temp_card.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/card.dart'; // Make sure this import is correct

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Item> items = [
    Item(name: 'Sunny', svgPath: 'assets/sunny1.svg', background: 'assets/sunny.png'),
    Item(name: 'Snowy', svgPath: 'assets/snowy1.svg', background: 'assets/snowy.png'),
    Item(name: 'Rainy', svgPath: 'assets/rain.svg', background: 'assets/windy.png'),
    Item(name: 'Windy', svgPath: 'assets/windy1.svg', background: 'assets/wind.png'),
    Item(name: 'Lightning', svgPath: 'assets/light1.svg', background: 'assets/light.png'),
  ];

  int _selectedItemIndex = 0;
  double _temperature = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 21, 21), // Set the background color
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          GridCard(temperature: _temperature,),
          Image.asset(
            items[_selectedItemIndex].background,
            fit: BoxFit.cover,
            height: 150, // Adjust height as needed
          ),
          const SizedBox(height: 20),
         
          Slider(
            value: _temperature,
            min: 0,
            max: 40,
            onChanged: (value) {
              setState(() {
                _temperature = value;
              });
            },
          ),
          Text(
            'Temperature: ${_temperature.toStringAsFixed(1)} °C',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 20),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(15, 6, 15, 6),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedItemIndex = index;
                      });
                    },
                    child: PaymentItem(
                      title: items[index].name,
                      svgPath: items[index].svgPath,
                      isSelected: index == _selectedItemIndex, // Pass isSelected parameter
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  String name;
  String svgPath;
  String background;

  Item({required this.name, required this.svgPath, required this.background});
}
