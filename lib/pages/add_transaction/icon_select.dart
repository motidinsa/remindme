import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/bloc/category/category_bloc.dart';
import 'package:mytask/bloc/category/category_event.dart';

class IconSelect extends StatelessWidget {
  final Icon icon;
  final String name;
  final String type;
  final int id;

  IconSelect(this.icon, this.name, this.type, this.id);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      // highlightColor: Colors.amber,
      onTap: () {
        type == 'category'
            ? BlocProvider.of<CategoryBloc>(context)
                .add(AddCategoryIcon(iconType: 'material', iconName: name))
            : BlocProvider.of<CategoryBloc>(context)
                .add(AddSubcategoryIcon(subcategoryIcon: name, tempID: id));
        print('yee');
        Navigator.of(context).pop();
      },
      child: Ink(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.grey),
          ),
          child: icon),
    );
  }
}
