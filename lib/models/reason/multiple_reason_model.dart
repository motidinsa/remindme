import 'add_reason_model.dart';

class MultipleReasonModel {
  List<AddReasonModel> reasonModels = [];
  final int categoryId;
  int id;

  MultipleReasonModel({this.categoryId, this.reasonModels, this.id});
}
