import 'package:beans/platform/native_communication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/device_info.dart';
import 'device_info_state.dart';

class DeviceInfoCubit extends Cubit<DeviceInfoState> {
  DeviceInfoCubit() : super(DeviceInfoInitialState());

  Future<void> fetchDeviceName() async {
    emit(DeviceInfoLoadingState());

    try {
      final response = await NativeCommunication.invoke<Map>(
        method: 'getDeviceInfo',
      );

      if (response == null) {
        emit(DeviceInfoErrorState(error: 'No device information received'));
        return;
      }

      final deviceInfo = DeviceInfo.fromMap(response);

      emit(DeviceDataState.fromModel(deviceInfo));
    } catch (e) {
      emit(DeviceInfoErrorState(error: e.toString()));
    }
  }
}
