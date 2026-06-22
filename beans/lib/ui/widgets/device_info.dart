import 'package:beans/cubit/device_info/device_info_cubit.dart';
import 'package:beans/cubit/device_info/device_info_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceInfoWidget extends StatefulWidget {
  const DeviceInfoWidget({super.key});

  @override
  State<DeviceInfoWidget> createState() => _DeviceInfoWidgetState();
}

class _DeviceInfoWidgetState extends State<DeviceInfoWidget> {
  final DeviceInfoCubit _deviceInfoCubit = DeviceInfoCubit();

  @override
  void initState() {
    super.initState();
    _deviceInfoCubit.fetchDeviceName();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: 300,
      child: BlocBuilder(
        bloc: _deviceInfoCubit,
        builder: (context, state) {
          if (state is DeviceDataState) {
            return Column(
              children: [
                const SizedBox(height: 8),
                Text("Device : ${state.deviceName}"),
                const SizedBox(height: 8),
                Text("Android version : ${state.androidVersion}"),
                const SizedBox(height: 8),
                Text("Api Level : ${state.apiLevel}"),
              ],
            );
          } else {
            return Text("--");
          }
        },
      ),
    );
  }
}
