package com.example.beans

import io.flutter.plugin.common.BinaryMessenger
class EventChannelRegister(
    private val streams:
    List<NativeStreamHandler>
) {

    fun register(
        messenger: BinaryMessenger
    ) {

        streams.forEach {

            it.register(
                messenger
            )

        }
    }
}