class SettingConfiguration {
  String name;
  String parameterSetting;
  int userID;

  SettingConfiguration({this.name, this.parameterSetting, this.userID});

  Map<String, dynamic> toMap() {
    return {
      'user_id': userID,
      'name': name,
      'parameter_setting': parameterSetting,
    };
  }
}
