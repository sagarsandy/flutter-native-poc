import Flutter
import UIKit

final class BatteryStreamListener:
NSObject,
FlutterStreamHandler {

    private var timer:
    Timer?

    private var eventSink:
    FlutterEventSink?

    override init() {

        super.init()

        UIDevice.current
        .isBatteryMonitoringEnabled =
        true
    }

    func onListen(
    withArguments arguments: Any?,
    eventSink events:
    @escaping FlutterEventSink
    ) -> FlutterError? {

        eventSink = events

        timer =
        Timer.scheduledTimer(
            withTimeInterval: 2,
            repeats: true
        ) { [weak self] _ in

            let battery =
            Int(
                UIDevice
                .current
                .batteryLevel * 100
            )

            self?.eventSink?(
                battery
            )
        }

        return nil
    }

    func onCancel(
    withArguments arguments: Any?
    ) -> FlutterError? {

        timer?.invalidate()

        timer = nil

        eventSink = nil

        return nil
    }
}