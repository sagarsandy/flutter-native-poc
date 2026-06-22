import Flutter
import UIKit

final class DeviceManager:
NativeHandler {

    func canHandle(
    method: String
    ) -> Bool {

        return method ==
        "getBatteryLevel" ||
        method ==
        "openSettings"
    }

    func handle(
    call: FlutterMethodCall,
    result: @escaping FlutterResult
    ) {

        switch call.method {

        case "getBatteryLevel":
            getBatteryLevel(
                result: result
            )

        case "openSettings":
            openSettings(
                result: result
            )

        default:
            result(
                FlutterMethodNotImplemented
            )
        }
    }

    private func openSettings(
    result: @escaping FlutterResult
    ) {

        guard let url =
        URL(
            string:
            UIApplication
            .openSettingsURLString
        )
        else {

            result(
                FlutterError(
                    code: "SETTINGS_ERROR",
                    message:
                    "Invalid URL",
                    details: nil
                )
            )

            return
        }

        UIApplication.shared.open(
            url
        )

        result(true)
    }

    private func getBatteryLevel(
    result: @escaping FlutterResult
    ) {

        UIDevice.current
        .isBatteryMonitoringEnabled = true

        result(
            Int(
                UIDevice.current
                .batteryLevel * 100
            )
        )
    }
}