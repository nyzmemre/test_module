import 'package:test_module/features/test/test_model.dart';

class LevelModel {
  List<TestModel> quesList;
  bool isCompleted;
  int? numOfCorrect;
  String? giftIconPath;

  LevelModel({
    required this.quesList,
    required  this.isCompleted,
    this.numOfCorrect,
    this.giftIconPath,
  });

  LevelModel copyWith({
   required List<TestModel> quesList,
    required bool isCompleted,
    int? numOfCorrect,
    String? giftIconPath,
  }) {
    return LevelModel(
      quesList: quesList,
      isCompleted: isCompleted,
      numOfCorrect: numOfCorrect ?? this.numOfCorrect,
      giftIconPath: giftIconPath ?? this.giftIconPath,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quesList': quesList,
      'isCompleted': isCompleted,
      'numOfCorrect': numOfCorrect,
      'giftIconPath': giftIconPath,
    };
  }

  factory LevelModel.fromJson(Map<String, dynamic> json) {
    return LevelModel(
      quesList: json['quesList'] as List<TestModel>,
      isCompleted: json['isCompleted'] as bool,
      numOfCorrect: json['numOfCorrect'] as int?,
      giftIconPath: json['giftIconPath'] as String?,
    );
  }

  @override
  String toString() =>
      "Response(quesList: $quesList,isCompleted: $isCompleted,numOfCorrect: $numOfCorrect,giftIconPath: $giftIconPath)";

  @override
  int get hashCode =>
      Object.hash(quesList, isCompleted, numOfCorrect, giftIconPath);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is LevelModel &&
              runtimeType == other.runtimeType &&
              quesList == other.quesList &&
              isCompleted == other.isCompleted &&
              numOfCorrect == other.numOfCorrect &&
              giftIconPath == other.giftIconPath;
}
