class DeviceInfo {
  final String deviceName;
  final String manufacturer;
  final String androidVersion;
  final int apiLevel;
  final int screenWidth;
  final int screenHeight;

  DeviceInfo({
    required this.deviceName,
    required this.manufacturer,
    required this.androidVersion,
    required this.apiLevel,
    required this.screenWidth,
    required this.screenHeight,
  });

  factory DeviceInfo.fromMap(Map<dynamic, dynamic> json) {
    return DeviceInfo(
      deviceName: json['deviceName'],
      manufacturer: json['manufacturer'],
      androidVersion: json['androidVersion'],
      apiLevel: json['apiLevel'],
      screenWidth: json['screenWidth'],
      screenHeight: json['screenHeight'],
    );
  }
}
