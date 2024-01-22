class LevelModel {
  int levelIndex;
  bool isLocked;
  int levelPoint;
  int userPoint;

  LevelModel({
   required this.levelIndex,
   required this.isLocked,
   required this.levelPoint,
   required this.userPoint,
  });

  LevelModel copyWith({
    int? levelIndex,
    bool? isLocked,
    int? levelPoint,
    int? userPoint,
  }) {
    return LevelModel(
      levelIndex: levelIndex ?? this.levelIndex,
      isLocked: isLocked ?? this.isLocked,
      levelPoint: levelPoint ?? this.levelPoint,
      userPoint: userPoint ?? this.userPoint,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'levelIndex': levelIndex,
      'isLocked': isLocked,
      'levelPoint': levelPoint,
      'userPoint': userPoint,
    };
  }

  factory LevelModel.fromJson(Map<String, dynamic> json) {
    return LevelModel(
      levelIndex: json['levelIndex'] as int,
      isLocked: json['isLocked'] as bool,
      levelPoint: json['levelPoint'] as int,
      userPoint: json['userPoint'] as int,
    );
  }

  @override
  String toString() =>
      "LevelModel(levelIndex: $levelIndex,isLocked: $isLocked,levelPoint: $levelPoint,userPoint: $userPoint)";

  @override
  int get hashCode => Object.hash(levelIndex, isLocked, levelPoint, userPoint);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is LevelModel &&
              runtimeType == other.runtimeType &&
              levelIndex == other.levelIndex &&
              isLocked == other.isLocked &&
              levelPoint == other.levelPoint &&
              userPoint == other.userPoint;
}
