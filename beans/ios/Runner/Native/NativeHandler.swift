import Flutter

protocol NativeHandler {

    func canHandle(
    method: String
    ) -> Bool

    func handle(
    call: FlutterMethodCall,
    result: @escaping FlutterResult
    )
}