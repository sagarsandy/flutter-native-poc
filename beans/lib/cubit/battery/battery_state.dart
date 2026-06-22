import '../../model/battery_info.dart';

abstract class BatteryState {}

class BatteryInitialState extends BatteryState {}

class BatteryDataState extends BatteryState {
  final int percentage;
  final bool isCharging;

  BatteryDataState({required this.percentage, required this.isCharging});

  factory BatteryDataState.fromModel(BatteryInfo info) {
    return BatteryDataState(
      percentage: info.percentage,
      isCharging: info.isCharging,
    );
  }
}

class BatteryErrorState extends BatteryState {
  final String error;
  BatteryErrorState({required this.error});
}
