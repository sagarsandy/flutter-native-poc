package com.example.beans

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

interface NativeHandler {
    fun canHandle(method: String): Boolean

    fun handle(
        call: MethodCall,
        result: MethodChannel.Result
    )
}