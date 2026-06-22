import Flutter
import UIKit

public final class
CommunicatePlugin:
NSObject,
FlutterPlugin {

    private var handlers:
    [NativeHandler] = []

    public static func register(
    with registrar:
    FlutterPluginRegistrar
    ) {

        print(
            "CommunicatePlugin registered"
        )

        let instance =
        CommunicatePlugin()

        instance.handlers = [

            DeviceManager()

        ]

        let channel =
        FlutterMethodChannel(
            name:
            "communication",
            binaryMessenger:
            registrar.messenger()
        )

        registrar.addMethodCallDelegate(
            instance,
            channel: channel
        )

        EventChannelRegistrar(
            streams: [

                BatteryUpdateManager()

            ]

        ).register(
            messenger:
            registrar.messenger()
        )
    }

    public func handle(
    _ call:
    FlutterMethodCall,
    result:
    @escaping FlutterResult
    ) {

        guard let handler =
        handlers.first(
            where: {
                $0.canHandle(
                    method:
                    call.method
                )
            }
        )
        else {

            result(
                FlutterMethodNotImplemented
            )

            return
        }

        handler.handle(
            call: call,
            result: result
        )
    }
}