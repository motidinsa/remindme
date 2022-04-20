import '../../database_models/reason/reason_model.dart';

class MultipleReasonModel {
  List<ReasonModel> reasonModels = [];
  final int categoryId;
  int id;

  MultipleReasonModel({this.categoryId, this.reasonModels, this.id});
}
