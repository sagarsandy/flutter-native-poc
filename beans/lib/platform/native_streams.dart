import 'package:flutter/services.dart';

import '../model/battery_info.dart';

class NativeStreams {
  static const _batteryChannel = EventChannel('battery_stream');

  static Stream<BatteryInfo> batteryStream() {
    return _batteryChannel.receiveBroadcastStream().map(
      (event) => BatteryInfo.fromMap(event as Map<dynamic, dynamic>),
    );
  }
}
