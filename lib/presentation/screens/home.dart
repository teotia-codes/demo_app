import 'package:demo_app/data/models/items.dart';
import 'package:demo_app/uitls/card.dart';
import 'package:demo_app/uitls/slider.dart';
import 'package:demo_app/uitls/temp_card.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  List<Item> items = [
    Item(name: 'Sunny', svgPath: 'assets/sunny1.svg', background: 'assets/sunny.png', temperature: 30.0),
    Item(name: 'Snowy', svgPath: 'assets/snowy1.svg', background: 'assets/snowy.png', temperature: -5.0),
    Item(name: 'Rainy', svgPath: 'assets/rain.svg', background: 'assets/windy.png', temperature: 18.0),
    Item(name: 'Windy', svgPath: 'assets/windy1.svg', background: 'assets/wind.png', temperature: 20.0),
    Item(name: 'Lightning', svgPath: 'assets/light1.svg', background: 'assets/light.png', temperature: 25.0),
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
          const SizedBox(height: 30),
          GridCard(temperature: _temperature),
          Image.asset(
            items[_selectedItemIndex].background,
            fit: BoxFit.cover,
            height: 150, // Adjust height as needed
          ),
          const SizedBox(height: 20),
          SliderWithLabel(
            initialValue: _temperature,
            onChanged: (value) {
              setState(() {
                _temperature = value;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4),
            child: Text(
              'Temperature: ${_temperature.toStringAsFixed(1)} °C',
              style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
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
                        _temperature = items[index].temperature; // Set the temperature based on the selected item
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
