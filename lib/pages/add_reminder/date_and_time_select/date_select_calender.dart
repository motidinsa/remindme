import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateSelect extends StatefulWidget {
  @override
  _DateSelectState createState() => _DateSelectState();
}

class _DateSelectState extends State<DateSelect> {
  String selectedDate;
  String formattedDate;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is DateTime) {
        selectedDate = args.value.toString();
        formattedDate =
        '${DateTime
            .parse(selectedDate)
            .day > 9 ? DateTime
            .parse(selectedDate)
            .day : '0${DateTime
            .parse(selectedDate)
            .day}'}-${DateTime
            .parse(selectedDate)
            .month > 9 ? DateTime
            .parse(selectedDate)
            .month : '0${DateTime
            .parse(selectedDate)
            .month}'}'
            '-${DateTime
            .parse(selectedDate)
            .year}';

        print(formattedDate);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      onSelectionChanged: _onSelectionChanged,
      showNavigationArrow: true,
    );
  }
}
