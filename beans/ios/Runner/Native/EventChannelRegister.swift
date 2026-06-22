import Flutter

final class EventChannelRegister {

    private let streams:
    [NativeStreamHandler]

    init(
    streams: [NativeStreamHandler]
    ) {

        self.streams = streams
    }

    func register(
    messenger: FlutterBinaryMessenger
    ) {

        streams.forEach {

            $0.register(
                messenger: messenger
            )

        }
    }
}