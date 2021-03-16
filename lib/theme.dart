import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class ThemeConfigure extends StatefulWidget {
  @override
  _ThemeConfigureState createState() => _ThemeConfigureState();
}

class _ThemeConfigureState extends State<ThemeConfigure> {
  bool userValue = true;
  ColorSwatch _tempMainColor;
  Color _tempShadeColor;
  ColorSwatch _textColor;
  ColorSwatch _cardColor;
  ColorSwatch _backgroundColor;
  ColorSwatch _tabbarColor;
  Color _shadeColor = Colors.blue[800];

  // void _openDialog(String title, Widget content) {
  //   showDialog(
  //     context: context,
  //     builder: (_) {
  //       return AlertDialog(
  //         contentPadding: const EdgeInsets.all(6.0),
  //         title: Text(title),
  //         content: content,
  //         actions: [
  //           FlatButton(
  //             child: Text('Cancel',style: TextStyle(color: Colors.grey),),
  //             onPressed: Navigator.of(context).pop,
  //           ),
  //           FlatButton(
  //             child: Text('Ok',style: TextStyle(color: Colors.green),),
  //             onPressed: () {
  //
  //               setState(() => _mainColor = _tempMainColor);
  //               Navigator.of(context).pop();
  //               // setState(() => _shadeColor = _tempShadeColor);
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  //
  //   void _openColorPicker() async {
  //   _openDialog(
  //     "Select color",
  //     MaterialColorPicker(shrinkWrap: true,
  //       selectedColor: _shadeColor,
  //       onColorChange: (color) => setState(() => _tempShadeColor = color),
  //       onMainColorChange: (color) => setState(() => _tempMainColor = color),
  //       onBack: () => print("Back button pressed"),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            Card(
              elevation: 5,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.wb_sunny_outlined,
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Day',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.green)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Switch(
                              value: userValue,
                              onChanged: (value) {
                                setState(
                                  () {
                                    userValue = value;
                                  },
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.nightlight_round,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Night',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.green)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Switch(
                              value: userValue,
                              onChanged: (value) {
                                setState(
                                  () {
                                    userValue = value;
                                  },
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.nightlight_round,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Dark',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.green)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Switch(
                              value: userValue,
                              onChanged: (value) {
                                setState(
                                  () {
                                    userValue = value;
                                  },
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                child: Wrap(
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            // isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            context: context,
                            builder: (context) => StatefulBuilder(
                              builder: (context, setState) {
                                return Container(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Container(
                                    padding: EdgeInsets.only(top: 20, left: 20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Container(),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Text(
                                                'Text color',
                                                style: TextStyle(fontSize: 18),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(8),
                                                    child: Icon(
                                                      Icons.circle,
                                                      color: _textColor ??
                                                          Colors.black,
                                                    ),
                                                  ),
                                                  onTap: () => {
                                                    showDialog(
                                                      context: context,
                                                      builder: (_) {
                                                        return AlertDialog(
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .all(6.0),
                                                          title: Text(
                                                              'Select color'),
                                                          content:
                                                              MaterialColorPicker(
                                                            shrinkWrap: true,
                                                            selectedColor:
                                                                _shadeColor,
                                                            onColorChange: (color) =>
                                                                setState(() =>
                                                                    _tempShadeColor =
                                                                        color),
                                                            onMainColorChange: (color) =>
                                                                setState(() =>
                                                                    _tempMainColor =
                                                                        color),
                                                            onBack: () => print(
                                                                "Back button pressed"),
                                                          ),
                                                          actions: [
                                                            FlatButton(
                                                              child: Text(
                                                                'Cancel',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                              onPressed:
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop,
                                                            ),
                                                            FlatButton(
                                                              child: Text(
                                                                'Ok',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .green),
                                                              ),
                                                              onPressed: () {
                                                                setState(() =>
                                                                    _textColor =
                                                                        _tempMainColor);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                // setState(() => _shadeColor = _tempShadeColor);
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  },
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Container(),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Text(
                                                'Card color',
                                                style: TextStyle(fontSize: 18),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Icon(
                                                      Icons.circle,
                                                      color: _cardColor ??
                                                          Colors.green,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (_) {
                                                        return AlertDialog(
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .all(6.0),
                                                          title: Text(
                                                              'Select color'),
                                                          content:
                                                              MaterialColorPicker(
                                                            shrinkWrap: true,
                                                            selectedColor:
                                                                _shadeColor,
                                                            onColorChange: (color) =>
                                                                setState(() =>
                                                                    _tempShadeColor =
                                                                        color),
                                                            onMainColorChange: (color) =>
                                                                setState(() =>
                                                                    _tempMainColor =
                                                                        color),
                                                            onBack: () => print(
                                                                "Back button pressed"),
                                                          ),
                                                          actions: [
                                                            FlatButton(
                                                              child: Text(
                                                                'Cancel',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                              onPressed:
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop,
                                                            ),
                                                            FlatButton(
                                                              child: Text(
                                                                'Ok',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .green),
                                                              ),
                                                              onPressed: () {
                                                                setState(() =>
                                                                    _cardColor =
                                                                        _tempMainColor);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                // setState(() => _shadeColor = _tempShadeColor);
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Container(),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Text(
                                                'Background color',
                                                style: TextStyle(fontSize: 18),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Icon(
                                                      Icons.circle,
                                                      color: _backgroundColor ??
                                                          Colors.grey,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (_) {
                                                        return AlertDialog(
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .all(6.0),
                                                          title: Text(
                                                              'Select color'),
                                                          content:
                                                              MaterialColorPicker(
                                                            shrinkWrap: true,
                                                            selectedColor:
                                                                _shadeColor,
                                                            onColorChange: (color) =>
                                                                setState(() =>
                                                                    _tempShadeColor =
                                                                        color),
                                                            onMainColorChange: (color) =>
                                                                setState(() =>
                                                                    _tempMainColor =
                                                                        color),
                                                            onBack: () => print(
                                                                "Back button pressed"),
                                                          ),
                                                          actions: [
                                                            FlatButton(
                                                              child: Text(
                                                                'Cancel',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                              onPressed:
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop,
                                                            ),
                                                            FlatButton(
                                                              child: Text(
                                                                'Ok',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .green),
                                                              ),
                                                              onPressed: () {
                                                                setState(() =>
                                                                    _backgroundColor =
                                                                        _tempMainColor);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                // setState(() => _shadeColor = _tempShadeColor);
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Container(),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Text(
                                                'Tab bar color',
                                                style: TextStyle(fontSize: 18),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Icon(
                                                      Icons.circle,
                                                      color: _tabbarColor ??
                                                          Colors.blueGrey,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (_) {
                                                        return AlertDialog(
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .all(6.0),
                                                          title: Text(
                                                              'Select color'),
                                                          content:
                                                              MaterialColorPicker(
                                                            shrinkWrap: true,
                                                            selectedColor:
                                                                _shadeColor,
                                                            onColorChange: (color) =>
                                                                setState(() =>
                                                                    _tempShadeColor =
                                                                        color),
                                                            onMainColorChange: (color) =>
                                                                setState(() =>
                                                                    _tempMainColor =
                                                                        color),
                                                            onBack: () => print(
                                                                "Back button pressed"),
                                                          ),
                                                          actions: [
                                                            FlatButton(
                                                              child: Text(
                                                                'Cancel',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                              onPressed:
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop,
                                                            ),
                                                            FlatButton(
                                                              child: Text(
                                                                'Ok',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .green),
                                                              ),
                                                              onPressed: () {
                                                                setState(() =>
                                                                    _tabbarColor =
                                                                        _tempMainColor);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                // setState(() => _shadeColor = _tempShadeColor);
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child: Container(),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10),
                                                  child: OutlinedButton(
                                                    child: Text(
                                                      'Set',
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 16),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Configure theme',
                          style: TextStyle(color: Colors.green),
                        ))
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.only(top: 10),
              child: Align(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  child: Text(
                    'Apply theme',
                    // style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
