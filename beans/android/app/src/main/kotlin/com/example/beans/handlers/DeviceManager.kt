package com.example.beans.handlers

import android.content.Context
import android.os.Build

import com.example.beans.NativeHandler

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class DeviceManager(
    private val context: Context
) : NativeHandler {

    override fun canHandle(
        method: String
    ): Boolean {
        return method == "getDeviceInfo"
    }

    override fun handle(
        call: MethodCall,
        result: MethodChannel.Result
    ) {

        when (call.method) {

            "getDeviceInfo" -> {
                getDeviceInfo(result)
            }

            else -> {
                result.notImplemented()
            }
        }
    }

    private fun getDeviceInfo(
        result: MethodChannel.Result
    ) {

        val metrics =
            context.resources.displayMetrics

        val deviceInfo =
            mapOf(

                "deviceName" to
                        Build.MODEL,

                "manufacturer" to
                        Build.MANUFACTURER,

                "androidVersion" to
                        Build.VERSION.RELEASE,

                "apiLevel" to
                        Build.VERSION.SDK_INT,

                "screenWidth" to
                        metrics.widthPixels,

                "screenHeight" to
                        metrics.heightPixels,

                "brand" to
                        Build.BRAND
            )

        result.success(
            deviceInfo
        )
    }
}