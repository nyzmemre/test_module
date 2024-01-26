class TestModel {
  String quessID;
  String quessImagePath;
  String quessCategory;
  int quessGrade;
  String quessAnsw;
  int quessLevel;
  String? secondImagePath;
  int? visibleTime;
  String? tip;
  String? solve;
  bool? isResfebe;

  TestModel({
    required this.quessID,
    required this.quessImagePath,
    required this.quessCategory,
    required this.quessGrade,
    required this.quessAnsw,
    required this.quessLevel,
    this.secondImagePath,
    this.visibleTime,
    this.tip,
    this.solve,
    this.isResfebe,
  });

  Map<String, dynamic> toJson() {
    return {
      'quessID': quessID,
      'quessImagePath': quessImagePath,
      'quessCategory': quessCategory,
      'quessGrade': quessGrade,
      'quessAnsw': quessAnsw,
      'quessLevel': quessLevel,
      'secondImagePath': secondImagePath,
      'visibleTime': visibleTime,
      'tip': tip,
      'solve': solve,
      'isResfebe': isResfebe,
    };
  }

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      quessID: json['quessID'] as String,
      quessImagePath: json['quessImagePath'] as String,
      quessCategory: json['quessCategory'] as String,
      quessGrade: json['quessGrade'] as int,
      quessAnsw: json['quessAnsw'] as String,
      quessLevel: json['quessLevel'] as int,
      secondImagePath: json['secondImagePath'] as String?,
      visibleTime: json['visibleTime'] as int?,
      tip: json['tip'] as String?,
      solve: json['solve'] as String?,
      isResfebe: json['isResfebe'] as bool?,
    );
  }
}
