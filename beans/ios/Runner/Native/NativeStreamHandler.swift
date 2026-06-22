import Flutter

protocol NativeStreamHandler {

    func register(
    messenger: FlutterBinaryMessenger
    )
}