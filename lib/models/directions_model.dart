class DirectionsModel {
  DirectionsModel({
    this.humanReadableAddress,
    this.locationName,
    this.locationId,
    this.locationLatitude,
    this.locationLongitude,
  });

  String? humanReadableAddress;
  String? locationName;
  String? locationId;
  double? locationLatitude;
  double? locationLongitude;

  factory DirectionsModel.fromJson(json) => DirectionsModel(
        humanReadableAddress: json["humanReadableAddress"] ?? "",
        locationName: json["locationName"] ?? "",
        locationId: json["locationId"] ?? "",
        locationLatitude: json["locationLatitude"] ?? 0,
        locationLongitude: json["locationLongitude"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "humanReadableAddress": humanReadableAddress ?? "",
        "locationName": locationName ?? "",
        "locationId": locationId ?? "",
        "locationLatitude": locationLatitude ?? 0,
        "locationLongitude": locationLongitude ?? 0,
      };
}
