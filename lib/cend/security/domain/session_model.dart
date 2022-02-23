class SessionModel {
  final String jwt;
  final String userId;
  final String? uuid;

  SessionModel(this.jwt, this.userId, this.uuid);

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      SessionModel(json['access_token'], json['id'],json['uuid']);

  Map<String, dynamic> toJson() {
    return {
      'access_token': jwt,
      'id': userId,
      'uuid':uuid,
    };
  }
}
