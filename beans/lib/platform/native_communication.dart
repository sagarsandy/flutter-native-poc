import 'package:flutter/services.dart';

class NativeCommunication {
  static const MethodChannel _channel = MethodChannel('communication');

  static Future<T?> invoke<T>({
    required String method,
    Map<String, dynamic>? args,
  }) {
    return _channel.invokeMethod<T>(method, args);
  }
}
