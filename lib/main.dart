import 'package:demo_app/card.dart';
import 'package:flutter/material.dart';

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
    Item(name: 'Sunny', svgPath: 'assets/sunny1.svg', backgroundImage: 'assets/sunny.jpg', amount: '\$100'),
    Item(name: 'Snowy', svgPath: 'assets/snowy1.svg', backgroundImage: 'assets/snowy.jpg', amount: '\$200'),
    Item(name: 'Cloudy', svgPath: 'assets/windy1.svg', backgroundImage: 'assets/windy.jpg', amount: '\$300'),
  ];

  int _selectedItemIndex = 0;
  double _temperature = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              items[_selectedItemIndex].backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedItemIndex = index;
                          });
                        },
                        child: PaymentItem(
                          title: items[index].name,
                          svgPath: items[index].svgPath,
                          amount: items[index].amount,
                          category: "Category ${index + 1}",
                        ),
                      ),
                    );
                  },
                ),
              ),
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
              Text('Temperature: ${_temperature.toStringAsFixed(1)} °C'),
            ],
          ),
        ],
      ),
    );
  }
}

class Item {
  String name;
  String svgPath;
  String backgroundImage;
  String amount;

  Item({required this.name, required this.svgPath, required this.backgroundImage, required this.amount});
}
