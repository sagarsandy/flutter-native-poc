import '../../model/device_info.dart';

abstract class DeviceInfoState {}

class DeviceInfoInitialState extends DeviceInfoState {}

class DeviceInfoLoadingState extends DeviceInfoState {}

class DeviceDataState extends DeviceInfoState {
  final String deviceName;
  final String manufacturer;
  final String androidVersion;
  final int apiLevel;
  final int screenWidth;
  final int screenHeight;

  DeviceDataState({
    required this.deviceName,
    required this.manufacturer,
    required this.androidVersion,
    required this.apiLevel,
    required this.screenWidth,
    required this.screenHeight,
  });

  factory DeviceDataState.fromModel(DeviceInfo info) {
    return DeviceDataState(
      deviceName: info.deviceName,
      manufacturer: info.manufacturer,
      androidVersion: info.androidVersion,
      apiLevel: info.apiLevel,
      screenWidth: info.screenWidth,
      screenHeight: info.screenHeight,
    );
  }
}

class DeviceInfoErrorState extends DeviceInfoState {
  final String error;

  DeviceInfoErrorState({required this.error});
}
