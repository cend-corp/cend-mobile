class AuthModel {
  final String spyWord;
  final String? uuid;
  final bool uuidInputExpanded;
  final bool errorPopupShowed;

  AuthModel({
    required this.spyWord,
    this.uuid,
    required this.uuidInputExpanded,
    required this.errorPopupShowed,
  });

  AuthModel copyWith({
    String? spyWord,
    String? uuid,
    bool? uuidInputExpanded,
    bool? errorPopupShowed,
  }) {
    return AuthModel(
      spyWord: spyWord ?? this.spyWord,
      uuid: uuid ?? this.uuid,
      uuidInputExpanded: uuidInputExpanded ?? this.uuidInputExpanded,
      errorPopupShowed: errorPopupShowed ?? this.errorPopupShowed
    );
  }

  @override
  String toString() {
    return 'AuthModel{spyWord: $spyWord, uuid: $uuid, uuidInputExpanded: $uuidInputExpanded}';
  }
}
