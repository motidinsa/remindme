import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/category/category_bloc.dart';
import 'package:remindme/bloc/category/category_event.dart';
import 'package:remindme/bloc/reason/reason_bloc.dart';
import 'package:remindme/bloc/reason/reason_event.dart';

class IconSelect extends StatelessWidget {
  final Icon icon;
  final String name;
  final String subcategoryName;
  final int subcategoryID;
  final String type;
  final int id;

  IconSelect(
      {this.icon,
      this.name,
      this.type,
      this.id,
      this.subcategoryName,
      this.subcategoryID});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Ink(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.green),
          ),
          child: icon),
      borderRadius: BorderRadius.circular(50),
      // highlightColor: Colors.amber,
      onTap: () {
        type == 'category'
            ? BlocProvider.of<CategoryBloc>(context).add(
                AddCategoryIcon(iconType: 'material', iconName: name),
              )
            : type == 'subcategory'
                ? BlocProvider.of<CategoryBloc>(context).add(
                    AddSubcategoryIcon(
                        subcategoryIcon: name,
                        tempID: id,
                        subcategoryName: subcategoryName,
                        subcategoryID: subcategoryID),
                  )
                : type == 'sub_subcategory_add'
                    ? BlocProvider.of<CategoryBloc>(context).add(
                        AddSubcategoryNameForSubSubcategory(
                            tempID: id,
                            subcategoryName: subcategoryName,
                            subcategoryID: subcategoryID),
                      )
                    : type == 'add_reason'
                        ? BlocProvider.of<ReasonBloc>(context).add(
                            AddReasonCategoryName(id),
                          )
                        : type == 'add_subcategory_reason'
                            ? BlocProvider.of<ReasonBloc>(context).add(
                                AddReasonSubCategoryName(id),
                              )
                            : BlocProvider.of<ReasonBloc>(context).add(
                                AddReasonSubSubCategoryName(id),
                              );
        print('yee');
        Navigator.of(context).pop();
      },
    );
  }
}
