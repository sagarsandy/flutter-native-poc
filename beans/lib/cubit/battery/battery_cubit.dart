import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/battery_info.dart';
import '../../platform/native_streams.dart';
import 'battery_state.dart';

class BatteryCubit extends Cubit<BatteryState> {
  StreamSubscription<BatteryInfo>? _subscription;

  BatteryCubit() : super(BatteryInitialState());

  void startListening() {
    _subscription = NativeStreams.batteryStream().listen((batteryInfo) {
      emit(BatteryDataState.fromModel(batteryInfo));
    });
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
