import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remindme/bloc/expense/expense_bloc.dart';
import 'package:remindme/bloc/expense/expense_event.dart';
import 'package:remindme/bloc/expense/expense_state.dart';
import 'package:remindme/bloc/reason/reason_bloc.dart';
import 'package:remindme/bloc/reason/reason_event.dart';
import 'package:remindme/bloc/reason/reason_state.dart';
import 'package:remindme/models/expense_and_income_subcategory.dart';
import 'package:remindme/models/expense_and_income_subsubcategory.dart';
import 'package:remindme/models/reason.dart';
import 'package:remindme/pages/add_transaction/income_and_expense/reason_list.dart';

import 'income_and_expense.dart';

class SubcategoryReasonSelect extends StatelessWidget {
  final int categoryID;
  final int subcategoryID;
  final int index;
  final IncomeAndExpenseSubCategoryModel subCategoryModel;
  List<Reason> subcategoryReasonList = [];
  List<Reason> subsubcategoryReasonList = [];
  List<IncomeAndExpenseSubSubCategoryModel> subsubcategories = [];

  SubcategoryReasonSelect(
      {this.categoryID, this.subcategoryID, this.subCategoryModel, this.index});

  @override
  Widget build(BuildContext context) {
    print('cat iddddd $categoryID');
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OutlinedButton(
              onPressed: () {
                BlocProvider.of<ReasonBloc>(context).add(
                    GetAllSubSubCategoriesWithSubCategoryID(subcategoryID));
                showDialog<bool>(
                  context: context,
                  builder: (context) {
                    return BlocBuilder<ReasonBloc, ReasonState>(
                      builder: (_, state) {
                        if (state
                            is AllSubSubCategoriesWithSubCategoryIDFetched) {
                          subsubcategories = state.subsubcategories;
                          // print('yo subsub ${subsubcategories.length}');
                          // state.subsubcategories.forEach((element) {print(element.subSubcategoryName);});

                        }
                        return subsubcategories.length == 0
                            ? Center(
                                child: Card(
                                    child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Text('No subcategory found'),
                                )),
                              )
                            : Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Card(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemBuilder: (context, i) => ListTile(
                                              leading: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 25),
                                                child: Text(
                                                  subsubcategories[i]
                                                      .subSubcategoryName,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                              onTap: () {
                                                BlocProvider.of<ExpenseBloc>(
                                                        context)
                                                    .add(
                                                  GetSubSubCategoryReasons(
                                                      subsubcategories[i].id),
                                                );
                                                showDialog<void>(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          subsubcategories[i]
                                                              .subSubcategoryName),
                                                      content: Container(
                                                        height: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .height,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: BlocBuilder<
                                                                ExpenseBloc,
                                                                ExpenseState>(
                                                            builder:
                                                                (_, state) {
                                                          if (state
                                                              is SubSubCategoryReasonsFetched) {
                                                            subsubcategoryReasonList =
                                                                state
                                                                    .subsubcategoryReasons;
                                                          }
                                                          return ListView
                                                              .separated(
                                                            itemBuilder: (context,
                                                                    subSubReasonIndex) =>
                                                                ListTile(
                                                              leading: Text(
                                                                  subsubcategoryReasonList[
                                                                          subSubReasonIndex]
                                                                      .name),
                                                              trailing: Text(
                                                                  subsubcategoryReasonList[
                                                                          subSubReasonIndex]
                                                                      .amount),
                                                              onTap: () {
                                                                BlocProvider.of<ExpenseBloc>(context).add(AddExpenseReasonFromList(
                                                                    reasonID:
                                                                        subsubcategoryReasonList[subSubReasonIndex]
                                                                            .id,
                                                                    index:
                                                                        index,
                                                                    reason: subsubcategoryReasonList[
                                                                            subSubReasonIndex]
                                                                        .name,
                                                                    subcategoryID:
                                                                        subcategoryID,
                                                                    subSubcategoryID:
                                                                        subsubcategories[i]
                                                                            .id,
                                                                    categoryID:
                                                                        categoryID,
                                                                    amount: subsubcategoryReasonList[
                                                                            subSubReasonIndex]
                                                                        .amount));
                                                                Navigator.pop(
                                                                    context);
                                                                Navigator.pop(
                                                                    context);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                            itemCount:
                                                                subsubcategoryReasonList
                                                                    .length,
                                                            separatorBuilder:
                                                                (context,
                                                                        index) =>
                                                                    SizedBox(
                                                              height: 5,
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                        itemCount: subsubcategories.length),
                                  ),
                                ),
                              );
                        // return ReasonList(
                        //   reasonList: subcategoryReasonList,
                        //   categoryID: categoryID,
                        //   index: index,
                        //   subcategoryID: subcategoryID,
                        // );
                      },
                    );
                  },
                );
              },
              child: Text(
                subCategoryModel.subcategoryName,
                style: TextStyle(color: Colors.green, fontSize: 15),
              )),
          TextButton(
            onPressed: () {
              BlocProvider.of<ExpenseBloc>(context).add(
                GetSubCategoryReasons(subcategoryID),
              );
              showDialog<bool>(
                context: context,
                builder: (context) {
                  return BlocBuilder<ExpenseBloc, ExpenseState>(
                    builder: (_, state) {
                      if (state is SubCategoryReasonsFetched) {
                        subcategoryReasonList = state.subcategoryReasons;
                      }
                      return subcategoryReasonList.length == 0
                          ? Center(
                              child: Card(
                                  child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Text('No subcategory reason'),
                              )),
                            )
                          : Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Card(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemBuilder: (context, i) => ListTile(
                                              leading: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 25),
                                                child: Text(
                                                  subcategoryReasonList[i].name,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                              trailing: Text(
                                                subcategoryReasonList[i].amount,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                                textAlign: TextAlign.start,
                                              ),
                                              onTap: () {
                                                BlocProvider.of<ExpenseBloc>(
                                                        context)
                                                    .add(AddExpenseReasonFromList(
                                                        reasonID:
                                                            subcategoryReasonList[
                                                                    i]
                                                                .id,
                                                        index: index,
                                                        reason:
                                                            subcategoryReasonList[
                                                                    i]
                                                                .name,
                                                        subcategoryID:
                                                            subcategoryReasonList[
                                                                    i]
                                                                .subcategoryId,
                                                        categoryID: categoryID,
                                                        amount:
                                                            subcategoryReasonList[
                                                                    i]
                                                                .amount));
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              },
                                            ),
                                        itemCount:
                                            subcategoryReasonList.length)),
                              ),
                            );
                      // return ReasonList(
                      //   reasonList: subcategoryReasonList,
                      //   categoryID: categoryID,
                      //   index: index,
                      //   subcategoryID: subcategoryID,
                      // );
                    },
                  );
                },
              );
            },
            child: Text('Select subcategory reason'),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white)),
          )
        ],
      ),
    );
  }
}
