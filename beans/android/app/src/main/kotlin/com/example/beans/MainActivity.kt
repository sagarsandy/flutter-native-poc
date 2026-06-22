package com.example.beans
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodCall
import com.example.beans.handlers.DeviceManager
import kotlin.collections.List
import android.util.Log
import com.example.beans.handlers.BatteryUpdateManager
import io.flutter.plugin.common.EventChannel

class MainActivity : FlutterActivity() {
    private  val CHANNEL = "communication";
    private lateinit var handlers: List<NativeHandler>
    override fun configureFlutterEngine(
        flutterEngine: FlutterEngine
    ) {
        super.configureFlutterEngine(flutterEngine)
        handlers = listOf(DeviceManager(this))
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            handleMethodCall(
                call,
                result
            )
        }

        EventChannelRegister(listOf(BatteryUpdateManager(this),)
        ).register(flutterEngine.dartExecutor.binaryMessenger)
    }
    private fun handleMethodCall(
        call: MethodCall,
        result: MethodChannel.Result) {
        Log.d(
            "MAIN_ACTIVITY",
            "Received method = ${call.method}"
        )
        val handler = handlers.firstOrNull {
            it.canHandle(call.method)
        }
        if(handler != null) {
            handler.handle(call, result)
            return
        }
        result.notImplemented()
    }
}