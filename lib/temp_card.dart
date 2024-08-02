import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  final double temperature; // Add this line to accept temperature

  const GridCard({Key? key, required this.temperature}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, bottom: 15),
      child: Container(
        width: 200,
        height: 100,
        padding: const EdgeInsets.all(15.0),
        
          child: Text(
  "${temperature.toStringAsFixed(1)} \u00B0C",
  textAlign: TextAlign.center,
  style: const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 45,
  ),
)

        
      ),
    );
  }
}
