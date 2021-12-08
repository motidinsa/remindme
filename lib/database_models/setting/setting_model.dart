import 'package:hive/hive.dart';

part 'setting_model.g.dart';

@HiveType(typeId: 9)
class SettingModel extends HiveObject {
  @HiveField(0)
  final bool subcategorySelectHintDismissed;

  @HiveField(1)
  final String theme;

  SettingModel({
    this.theme,
    this.subcategorySelectHintDismissed,
  });
}
