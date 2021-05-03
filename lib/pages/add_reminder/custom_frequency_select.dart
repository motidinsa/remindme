import 'package:flutter/material.dart';

class CustomFrequencySelect extends StatefulWidget {
  @override
  _CustomFrequencySelectState createState() => _CustomFrequencySelectState();
}

class _CustomFrequencySelectState extends State<CustomFrequencySelect> {
  bool hasFrequency = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Custom Frequency',
          style: TextStyle(fontSize: 16, color: Colors.green),
        ),
        Expanded(
          child: Align(
            child: Switch(
              value: hasFrequency,
              onChanged: (value) {
                setState(
                      () {
                    hasFrequency = value;
                  },
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
