import Flutter
import UIKit

class SceneDelegate: FlutterSceneDelegate {

    override func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions:
    UIScene.ConnectionOptions
    ) {

        print("SceneDelegate launched")

        super.scene(
            scene,
            willConnectTo: session,
            options: connectionOptions
        )
    }
}