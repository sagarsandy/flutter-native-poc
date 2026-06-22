class BatteryInfo {
  final int percentage;
  final bool isCharging;

  BatteryInfo({required this.percentage, required this.isCharging});

  factory BatteryInfo.fromMap(Map<dynamic, dynamic> map) {
    return BatteryInfo(
      percentage: map['percentage'] as int,
      isCharging: map['isCharging'] as bool,
    );
  }
}
