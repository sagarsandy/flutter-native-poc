package com.example.beans
import io.flutter.plugin.common.BinaryMessenger
interface NativeStreamHandler {
    fun register(
        messenger: BinaryMessenger
    )
}