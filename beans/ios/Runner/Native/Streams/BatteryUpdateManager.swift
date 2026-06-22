import Flutter
import UIKit

final class BatteryUpdateManager:
NSObject,
NativeStreamHandler {

    func register(
    messenger:
    FlutterBinaryMessenger
    ) {

        let channel =
        FlutterEventChannel(
            name:
            "battery_stream",
            binaryMessenger:
            messenger
        )

        channel.setStreamHandler(
            BatteryStreamListener()
        )
    }
}