import 'package:flutter/material.dart';

class SelectedDateTime extends StatefulWidget {
  final String type;
  final String value;

  SelectedDateTime({this.type, this.value});

  @override
  _SelectedDateTimeState createState() => _SelectedDateTimeState();
}

class _SelectedDateTimeState extends State<SelectedDateTime> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _textEditingController.text = widget.value;
    return Container(
      margin: widget.type=='Date'?EdgeInsets.fromLTRB(20, 0, 10, 0):EdgeInsets.fromLTRB(10, 0, 20, 0),
      child: TextField(
        readOnly: true,
        enabled: false,
        cursorHeight: 30,
        controller: _textEditingController,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: widget.type,
            labelStyle: TextStyle(
              fontSize: 18,
              color: Colors.green,
            ),
            contentPadding: EdgeInsets.only(left: 20)),
        // onChanged: (text) => {name = text},
      ),
    );
  }
}
